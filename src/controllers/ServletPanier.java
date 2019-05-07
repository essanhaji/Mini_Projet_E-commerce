package controllers;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import models.Produits;
public class ServletPanier extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		Produits prod = new Produits();
		ArrayList<Produits> produits = new ArrayList<Produits>();
		HttpSession session = request.getSession(true);
		String ref = request.getParameter("addprod");
		int nbrp = 0;
		if(ref != null) {
			prod.setProduitByRef(ref);
			if(session.getAttribute("listPrd") == null) {
				prod.setQttcom();
				produits.add(prod);
				session.setAttribute("listPrd", produits);
			}else {
				produits = (ArrayList<Produits>)session.getAttribute("listPrd");
				boolean exist = false;
				for (Produits p : produits) {
					if (p.getReference().equals(ref)) {
						p.setQttcom();
						exist = true;
						break;
					}
				}
				if(!exist) {
					prod.setQttcom();
					produits.add(prod);
				}
			}
			for (Produits p : produits) {
				nbrp += p.getQttcom();
			}
			session.setAttribute("listPrd", produits);
			request.setAttribute("NombrP", nbrp);
		}else {
			if(session.getAttribute("listPrd") != null) {
				produits = (ArrayList<Produits>)session.getAttribute("listPrd");
				for (Produits p : produits) {
					nbrp += p.getQttcom();
				}
				request.setAttribute("NombrP", nbrp);
			}
		}
		RequestDispatcher reqdesp = request.getRequestDispatcher("Panier.jsp");
		reqdesp.forward(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
