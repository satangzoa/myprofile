package com.pengsoo.home.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.support.DaoSupport;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.pengsoo.home.dao.IDao;
import com.pengsoo.home.dto.Criteria;
import com.pengsoo.home.dto.MemberDto;
import com.pengsoo.home.dto.PageDto;
import com.pengsoo.home.dto.QBoardDto;




@Controller
public class HomeController {
	
	@Autowired
	private SqlSession sqlSession;// 오라클 세션 정보 가져온댜

	@RequestMapping(value = "/")
	public String home() {
		
		return "index";
	}
	

	@RequestMapping(value = "profile")
	public String pfofile() {
		
		return "profile";
	}
	
	@RequestMapping(value = "contact")
	public String contact() {
		
		return "contact";
	}
	
	@RequestMapping(value = "index")
	public String index() {
		
		return "index";
	}
	
	@RequestMapping(value = "login")
	public String login() {
		
		return "login";
	}

	@RequestMapping(value = "join")
	public String join() {
		
		return "join";
	}
	
	@RequestMapping(value = "question")
	public String question(HttpSession session, Model model) {
		
		String sessionId = (String) session.getAttribute("memberId");
		
		if(sessionId == null) {//로그인 상태 확인
			model.addAttribute("memberId", "손님이심");
		} else {
			model.addAttribute("memberId", sessionId);
		}
		
		return "question";
	}
	

	@RequestMapping(value = "joinOk")
	public String joinOk(HttpServletRequest request, HttpSession session, Model model) {
		
		String mid =request.getParameter("mid");
		String mpw =request.getParameter("mpw");
		String mname =request.getParameter("mname");
		String memail =request.getParameter("memail");
		
		IDao dao = sqlSession.getMapper(IDao.class);
		
		int joinFlag = dao.memberJoin(mid, mpw, mname, memail);
		//joinFlag 값이 1이면 회원가입 성공, 아니면 실패
//		System.out.println("가입 성공여부:" +joinFlag);
		
		if(joinFlag == 1) {// 회원가입 성공시 바로 로그인 진행
			session.setAttribute("memberID", mid);
			session.setAttribute("memberName", mname);
			
			model.addAttribute("mname", mid);
			model.addAttribute("mid", mname);
			
			return "joinOk";
		} else {//회원가입 실패
			return "joinFail";
		}
	}
	
	@RequestMapping(value = "logout")
	public String logout(HttpSession session) {
		
		session.invalidate();
		
		return "login";
	}
	

	@RequestMapping(value = "loginOk")
	public String loginOk(HttpServletRequest request, Model model,HttpSession session) {
		
		String mid =request.getParameter("mid");
		String mpw =request.getParameter("mpw");
		
		IDao dao = sqlSession.getMapper(IDao.class);
		
		int checkIdFlag = dao.checkId(mid);//로그인하려는  아이디 존재시 1시,로그인하려는  아이디 존재하지 않으면 0 반환
		int checkIdPwFlag = dao.checkIdAndPw(mid, mpw);//로그인 하려는 아이디와 비밀번호가 모두 일치하는 데이터가 존재하면 1 아니면 0
		
//		if(checkIdFlag == 0) {
//		model.addAttribute("checkIdFlag",checkIdFlag);
//	} else {
//		model.addAttribute("checkIdFlag",checkIdFlag);
//	}
		model.addAttribute("checkIdFlag",checkIdFlag);
		model.addAttribute("checkIdPwFlag",checkIdPwFlag);
		
		if(checkIdPwFlag == 1) {// 로그인 실행
			session.setAttribute("memberId", mid);
			MemberDto memberDto = dao.getMemberInfo(mid);
			
			model.addAttribute("memberDto", memberDto);
			model.addAttribute("mid", mid);
		}
		
		return "loginOk";
	}

	@RequestMapping(value = "memberModify")
	public String memberModify(HttpSession session,Model model) {
		
		String sessionId = (String) session.getAttribute("memberId");
		
		IDao dao = sqlSession.getMapper(IDao.class);
		MemberDto memberDto = dao.getMemberInfo(sessionId);
		
		model.addAttribute("memberDto", memberDto);
		
		return "memberModify";
	}
	
	@RequestMapping(value = "memberModifyOk")
	public String memberModifyOk(HttpServletRequest request, Model model) {
		
		String mid = request.getParameter("mid");
		String mpw = request.getParameter("mpw");
		String mname = request.getParameter("mname");
		String memail = request.getParameter("memail");
		
		IDao dao = sqlSession.getMapper(IDao.class);
		
		dao.memberModify(mid, mpw, mname, memail);//반환타입이 void
		MemberDto memberDto = dao.getMemberInfo(mid);// 수정된 회원정보 다시 가져오기
		model.addAttribute("memberDto", memberDto);
		
		return "memberModifyOk";
	}
		
	@RequestMapping(value = "questionOk")
	public String writeQuestion(HttpServletRequest request, Model model) {
		
		String qid = request.getParameter("qid");//글쓴유저 아이디
		String qname = request.getParameter("qname");//글쓴유저 이름
		String qcontent = request.getParameter("qcontent");//글쓴이가 쓴 질문내용
		String qemail = request.getParameter("qemail");//이메일
		
		IDao dao = sqlSession.getMapper(IDao.class);
		dao.writeQuestion(qid, qname, qcontent, qemail);
		
		return "redirect:list";
	}
	
	@RequestMapping(value = "list")
	public String list( Model model, Criteria cri,HttpServletRequest request) {//페이징해야하므로 Criteria 가져온다
		if(request.getParameter("pageNum") == null) {
			int pageNumInt =1;//1페이지부터 시작
			model.addAttribute("currPage", pageNumInt );
		} else {
			int pageNumInt =Integer.parseInt(request.getParameter("pageNum"));
			model.addAttribute("currPage", pageNumInt );
		}
		IDao dao = sqlSession.getMapper(IDao.class);
		
		int totalRecord = dao.boardAllcount();
		
		//cri.setPageNum();
		cri.setStartNum(cri.getPageNum()-1 * cri.getAmount()); //공식이므로 외운다 /해당 페이지의 시작번호를 설정
		
		PageDto pageDto = new PageDto(cri, 57); //PageDto 호출해서 객체생성

		List<QBoardDto> qboardDtos = dao.questionList();//List 와 <QBoardDto> 임포트
		
		model.addAttribute("pageMaker", pageDto);//pageMaker = pageDto
		model.addAttribute("qdtos", qboardDtos );
		
		
		return "questionList";
	}
	
	@RequestMapping(value = "/questionView")
	public String questionView(HttpServletRequest request, Model model) {
		
		String qnum = request.getParameter("qnum");
		
		IDao dao = sqlSession.getMapper(IDao.class);
		
		QBoardDto qBoardDto = dao.questionView(qnum);
		
		model.addAttribute("qdto", qBoardDto);
		model.addAttribute("qid", qBoardDto.getQid());//글쓴 유저의 id값 전송
		
		return "questionView";
	}
	
	@RequestMapping(value = "questionModify")
	public String questionModify(HttpServletRequest request, Model model) {
		
		String qnum = request.getParameter("qnum");
		IDao dao = sqlSession.getMapper(IDao.class);
		
		QBoardDto qBoardDto = dao.questionView(qnum);
		
		model.addAttribute("qdto", qBoardDto);
		return "questionModify";
	}

	
	@RequestMapping(value = "questionModifyOk")
	public String questionModifyOk(HttpServletRequest request, Model model) {
		
		String qnum = request.getParameter("qnum");
		String qname = request.getParameter("qname");
		String qcontent = request.getParameter("qcontent");
		String qemail = request.getParameter("qemail");
		
		IDao dao = sqlSession.getMapper(IDao.class);
		
		dao.questionModify(qnum, qname, qcontent, qemail);
		
		return "redirect:list";
	}
	
	
	@RequestMapping(value = "questionDelete")
	public String questionDelete(HttpServletRequest request, Model model) {
		
		String qnum = request.getParameter("qnum");
		
		IDao dao = sqlSession.getMapper(IDao.class);
		dao.questionDelete(qnum);
	
		
		return "redirect:list";
	}
}















