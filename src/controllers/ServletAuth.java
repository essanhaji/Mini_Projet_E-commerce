package controllers;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import models.Clients;

public class ServletAuth extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		Clients clt = new Clients();
		clt.setEmail(request.getParameter("mail"));
		clt.setMotdpass(request.getParameter("password"));

		if(clt.getClient()) {
			HttpSession session = request.getSession(true);
			if(clt.getNom().equals("SuperUser")) {
				session.setAttribute("SuperU", clt.getId());
				RequestDispatcher  reqDes = request.getRequestDispatcher("/AjouterProduits");
				reqDes.forward(request, response);
			}else {
				session.setAttribute("clt", clt.getId());
				//request.setAttribute("Client", clt);
				request.setAttribute("NameClt", clt.getNom());
				RequestDispatcher  reqDes = request.getRequestDispatcher("index.jsp");
				reqDes.forward(request, response);
			}
		}else {
			if(request.getParameter("lang") != null) {
				RequestDispatcher  reqDes = request.getRequestDispatcher("index.jsp");
				reqDes.forward(request, response);
			}else {
				request.setAttribute("ErrAuth", "Les informations sont incorrect !");
				request.getRequestDispatcher("identifier.jsp").forward(request, response);
			}
		}
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
