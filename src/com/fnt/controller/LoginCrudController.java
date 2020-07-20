package com.fnt.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fnt.model.dto.MemberDto;
  

@WebServlet("/LoginCrudController")
public class LoginCrudController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
    public LoginCrudController() {
    	 
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String command = request.getParameter("command");
		System.out.println("[" + command + "]");
		
		
		if(command.equals("login")) {
			String memberid = request.getParameter("id");
			String memberpw = request.getParameter("pw");
			
			
			
		}
	}

}
