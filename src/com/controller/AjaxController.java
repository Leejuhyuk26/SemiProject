package com.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.command.write.CertifCommand;
import com.command.write.IdchkCommand;
import com.command.write.emailCommand;

@WebServlet("*.ajax")
public class AjaxController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    public AjaxController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ajaxAction(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ajaxAction(request, response);
	}
	
	protected void ajaxAction(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("ajaxAction() 호출");
		
		request.setCharacterEncoding("utf-8"); // 한글 인코딩
		
		// URL로부터 URI, ContextPath, Command 분리
		String uri = request.getRequestURI();
		String conPath = request.getContextPath();
		String com = uri.substring(conPath.length());
		
		// 테스트 출력
		System.out.println("uri: " + uri);
		System.out.println("conPath: " + conPath);
		System.out.println("com: " + com);

		switch(com) {
		case "/list.ajax": // 글 목록 AJAX요청
			new IdchkCommand().execute(request, response);
			break;
		case "/emailchk.ajax": // 글 목록 AJAX요청
			new emailCommand().execute(request, response);
			break;
		case "/certif.ajax": // 글 목록 AJAX요청
			new CertifCommand().execute(request, response);
			break;
		} // end switch
		
	}// end action()

}
