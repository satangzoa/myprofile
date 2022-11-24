package com.pengsoo.home.dao;

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
}
