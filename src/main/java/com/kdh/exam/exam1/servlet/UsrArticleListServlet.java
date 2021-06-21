package com.kdh.exam.exam1.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kdh.exam.exam1.dto.Article;
import com.kdh.mysqlutil.MysqlUtil;
import com.kdh.mysqlutil.SecSql;

@WebServlet("/usr/article/list")
public class UsrArticleListServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		파라미터 인코딩 UTF-8
		request.setCharacterEncoding("UTF-8");
//		서블릿이 HTML 파일을 만들 때 인코딩 UTF-8 
		response.setCharacterEncoding("UTF-8");
//		HTML이 UTF-8 인코딩이라는 것을 브라우저에게 전달한다
		response.setContentType("text/html; charset=UTF-8");
		
		MysqlUtil.setDBInfo("localhost", "sbsst", "sbs123414", "2021_jsp_board");

		MysqlUtil.setDevMode(true);
		
		SecSql sql = new SecSql();
		sql.append("SELECT A.* FROM article AS A ORDER BY A.id DESC");
		List<Article> articles = MysqlUtil.selectRows(sql, Article.class);
		
		request.setAttribute("articles" , articles);
		
		MysqlUtil.closeConnection();
		
//		jsp 연결하기
		RequestDispatcher requestDispatcher = request.getRequestDispatcher("/WEB-INF/usr/article/list.jsp");
		requestDispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
