package om.kdh.exam.exam1;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/usr/home/main")
public class UsrHomeMain extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		파라미터 인코딩 UTF-8
		request.setCharacterEncoding("UTF-8");
//		서블릿이 HTML 파일을 만들 때 인코딩 UTF-8 
		response.setCharacterEncoding("UTF-8");
//		HTML이 UTF-8 인코딩이라는 것을 브라우저에게 전달한다
		response.setContentType("text/html; charset=UTF-8");
		
		String name = request.getParameter("name");
		response.getWriter().append(name);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
