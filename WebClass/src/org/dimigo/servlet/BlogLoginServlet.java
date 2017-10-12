package org.dimigo.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.dimigo.vo.UserVO;

/**
 * Servlet implementation class SignUpServlet
 */
@WebServlet("/bloglogin")
public class BlogLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BlogLoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		RequestDispatcher rd = request.getRequestDispatcher("/blog/myblog.jsp");
	      rd.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
boolean result = true;
	request.setCharacterEncoding("utf-8");
	HttpSession session = request.getSession();
	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
	String name = "baesh";
	System.out.printf("id : %s, pwd : %s, name : %s\n", id, pwd, name);

	response.setContentType("text/html/charset=utf-8");
		if("test@naver.com".equals(id)){
			//세션에 사용자 정보 생성
			UserVO user = new UserVO();
			user.setId(id);
			user.setName(name);
		
			
			session.setAttribute("user",user);
			RequestDispatcher rd = request.getRequestDispatcher("/myblog/myblog.jsp");
		      rd.forward(request, response);
		}else{
			request.setAttribute("msg","error");
			//세션에 사용자 정보 생성
			UserVO user = new UserVO();
			user.setId(id);
			user.setName(name);
		
			
			session.setAttribute("user",user);
			RequestDispatcher rd = request.getRequestDispatcher("/myblog/myblog.jsp");
		      rd.forward(request, response);
		}
		
		
	}

}
