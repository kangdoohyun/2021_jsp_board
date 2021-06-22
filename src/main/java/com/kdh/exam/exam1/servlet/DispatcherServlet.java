package com.kdh.exam.exam1.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kdh.exam.exam1.http.Rq;
import com.kdh.exam.exam1.http.controller.Controller;
import com.kdh.exam.exam1.http.controller.UsrArticleController;
import com.kdh.mysqlutil.MysqlUtil;

@WebServlet("/usr/*")
public class DispatcherServlet extends HttpServlet {
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) {
		Rq rq = new Rq(req, resp);
		
		if ( rq.isInvalid() ) {
			rq.println("올바르지 않은 요청입니다.");
			rq.println("<br>");
		}
		
		Controller controller = null;
		
		switch( rq.getControllerTypeName() ) {
		case "usr":
			switch( rq.getControllerName() ) {
			case "article":
				controller = new UsrArticleController();
			}
			break;
		}
		
		if ( controller != null ) {
			MysqlUtil.setDBInfo("localhost", "sbsst", "sbs123414", "2021_jsp_board");
			MysqlUtil.setDevMode(true);
			
			controller.performAction(rq);
			
			MysqlUtil.closeConnection();
		}
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}

}
