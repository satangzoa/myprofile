package com.pengsoo.home.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.pengsoo.home.dao.IDao;




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
	public String question() {
		
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
}








