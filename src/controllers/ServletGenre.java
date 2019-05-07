package controllers;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import models.Produits;

public class ServletGenre extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Produits prod = new Produits();
		String g = request.getParameter("genre");
		String drm = "",dpl = "",drl = "";
		switch (g) {
			case "Roman" : drm="disabled"; break;
			case "Politique" : dpl = "disabled"; break;
			case "Religion" : drl = "disabled"; break;
		}
		ArrayList<Produits> listProd = prod.getProduitsByType(g);
		if(listProd != null) {
			request.setAttribute("produits", listProd);
			request.setAttribute("disRoman", drm);
			request.setAttribute("disPolitique", dpl);
			request.setAttribute("disReligion", drl);
			RequestDispatcher req = request.getRequestDispatcher("/catalogue.jsp");
			req.forward(request, response);
		}else response.sendRedirect("Accueil.jsp");

	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
