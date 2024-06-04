package com.servlet;

import java.io.IOException;
import com.dao.UserDao;
import com.entity.User;
import com.db.HibernateUtil;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/RegisterUser")
public class UserRegister extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String name = req.getParameter("name");
		String email = req.getParameter("email");
		String password = req.getParameter("password");
		User u = new User(name,email,password);
		//System.out.println(u);
		UserDao dao = new UserDao(HibernateUtil.getSessionFactory());
		boolean saved = dao.saveuser(u);
		
		if(saved) {
			resp.sendRedirect("successfulRegister.jsp");
		}
		else {
			System.out.println("Something went wrong");
		}
		
	}
}
