package controllers;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import models.Clients;

public class ServletIndex extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Clients clt = new Clients();
		HttpSession session = request.getSession(true);
		if(clt.getClientById(Integer.parseInt(session.getAttribute("clt").toString()))) {
			request.setAttribute("NameClt", clt.getNom());
			RequestDispatcher  reqDes = request.getRequestDispatcher("index.jsp");
			reqDes.forward(request, response);
		}else {
			request.setAttribute("ErrAuth", "Les informations sont incorrect !");
			request.getRequestDispatcher("identifier.jsp").forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
