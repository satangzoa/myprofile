package com.pengsoo.home.dao;

import java.util.ArrayList;

import com.pengsoo.home.dto.MemberDto;

public interface IDao {
	
	public int memberJoin(String mid, String mpw, String mname, String memail);//회원가입 insert
//	public MemberDto checkId(String mid);//select 아이디 존재여부 확인
	
	public int checkId(String mid);//select 아이디 존재여부 확인
	
	//<select id="checkId" resultType="int">
//	select count(*) from profile_member where mid=#{param1}
//</select>

//	<select id="checkId" resultType="com.pengsoo.home.dto.MemberDto">
//	select * from profile_member where mid=#{param1}
//</select>
	public int checkIdAndPw(String mid, String mpw);// 아이디와 비밀번호의 존재 및 일치 여부 확인 select
	public MemberDto getMemberInfo(String mid);//아이디로 조회하여 회원정보 가져오기 select
	public void memberModify(String mid,String mpw, String mname, String memail);//회원정보수정 update
}
