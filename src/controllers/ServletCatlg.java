package controllers;

import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import models.Produits;

public class ServletCatlg extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Produits prod = new Produits();
		ArrayList<Produits> listProd = prod.getProduits();
		
		if(listProd != null) {
			request.setAttribute("produits", listProd);
			RequestDispatcher req = request.getRequestDispatcher("/catalogue.jsp");
			req.forward(request, response);
		}else response.sendRedirect("Accueil.jsp");
		
		
		
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
