package controllers;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import models.User;
import services.impl.UserService;

@WebServlet("/LoginSrv")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public LoginServlet() {
		super();
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String userName = request.getParameter("username");
		String password = request.getParameter("password");
//		String userType = request.getParameter("usertype");
		response.setContentType("text/html");

		String status = "Login Denied! Invalid Username or password.";
		// Login as Admin
		if (password.equals("admin") && userName.equals("admin@gmail.com")) {
			// valid
			RequestDispatcher rd = request.getRequestDispatcher("adminViewProduct.jsp");

			HttpSession session = request.getSession();

			session.setAttribute("username", userName);
			session.setAttribute("usertype", "admin");

			rd.forward(request, response);

		}else { // Login as customer

			UserService udao = new UserService();

			status = udao.isValidCredential(userName, password);

			if (status.equalsIgnoreCase("valid")) {
				// valid user

				User user = udao.getUserDetails(userName, password);

				HttpSession session = request.getSession();

				session.setAttribute("userdata", user);

				session.setAttribute("username", userName);
				session.setAttribute("usertype", "customer");

				RequestDispatcher rd = request.getRequestDispatcher("userHome.jsp");

				rd.forward(request, response);

			} else {
				// invalid user;

				RequestDispatcher rd = request.getRequestDispatcher("login.jsp?message=" + status);

				rd.forward(request, response);

			}
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}
}
