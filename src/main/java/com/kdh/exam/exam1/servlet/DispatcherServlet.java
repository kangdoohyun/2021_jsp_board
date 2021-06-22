package com.kdh.exam.exam1.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kdh.mysqlutil.MysqlUtil;
import com.kdh.mysqlutil.SecSql;

@WebServlet("/usr/*")
public class DispatcherServlet extends HttpServlet {
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//		파라미터 인코딩 UTF-8
		req.setCharacterEncoding("UTF-8");
//		서블릿이 HTML 파일을 만들 때 인코딩 UTF-8 
		req.setCharacterEncoding("UTF-8");
//		HTML이 UTF-8 인코딩이라는 것을 브라우저에게 전달한다
		resp.setContentType("text/html; charset=UTF-8");
		
		String requestUri = req.getRequestURI();
		String[] requestUriBits = requestUri.split("/");
		
		int minBitsCount = 5;
		
		if (requestUriBits.length < minBitsCount) {
			resp.getWriter().append("올바른 요청이 아닙니다.");
			return;
		}
		
		String controllerTypeName = requestUriBits[2];
		String controllerName = requestUriBits[3];
		String actionMethodName = requestUriBits[4];
		
		resp.getWriter().append("controllerTypeName : " + controllerTypeName);
		resp.getWriter().append("<br>");
		resp.getWriter().append("controllerName : " + controllerName);
		resp.getWriter().append("<br>");
		resp.getWriter().append("actionMethodName : " + actionMethodName);
		
		MysqlUtil.setDBInfo("localhost", "sbsst", "sbs123414", "2021_jsp_board");

		MysqlUtil.setDevMode(true);
		
		
		MysqlUtil.closeConnection();
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}

}
