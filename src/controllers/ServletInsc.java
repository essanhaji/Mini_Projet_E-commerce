package controllers;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import models.Clients;

public class ServletInsc extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Clients clt = new Clients();
		clt.setNom(request.getParameter("nom"));
		clt.setPrenom(request.getParameter("prenom"));
		String add = request.getParameter("address") +" "+request.getParameter("cdpostal")+" "+request.getParameter("city");
		clt.setAdresse(add);
		clt.setEmail(request.getParameter("mail"));
		clt.setMotdpass(request.getParameter("password"));
		if(clt.setClient() != -1) {
			response.sendRedirect("identifier.jsp");
		}else {
			request.setAttribute("ErrInsc", "Une erreur dans l'insertion veuillez ressayez");
			RequestDispatcher reqdesp = request.getRequestDispatcher("inscrire.jsp");
			reqdesp.forward(request, response);
		}
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
