package com.kdh.exam.exam1.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/usr/article/doWrite")
public class UsrArticleDoWriteServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		파라미터 인코딩 UTF-8
		request.setCharacterEncoding("UTF-8");
//		서블릿이 HTML 파일을 만들 때 인코딩 UTF-8 
		response.setCharacterEncoding("UTF-8");
//		HTML이 UTF-8 인코딩이라는 것을 브라우저에게 전달한다
		response.setContentType("text/html; charset=UTF-8");
		
//		write.jsp 에서 넘어온 파라미터를 request.getParameter() 로 받아준다
		String title = request.getParameter("title");
		String body = request.getParameter("body");
		
		response.getWriter().append(title +"<br>");
		response.getWriter().append(body +"<br>");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
