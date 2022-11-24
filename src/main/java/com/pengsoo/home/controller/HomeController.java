package com.pengsoo.home.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {

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
	public String qustion() {
		
		return "question";
	}
}
