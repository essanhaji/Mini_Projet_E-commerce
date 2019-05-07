package controllers;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import models.commandes;
import models.Produits;

public class ServletComd extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		HttpSession session = request.getSession(true);
		commandes cmd = new commandes();
		ArrayList<Produits> prd = (ArrayList<Produits>)session.getAttribute("listPrd");
		int idc = Integer.parseInt(session.getAttribute("clt").toString());
		RequestDispatcher  reqDes;
		if(cmd.addcommande(prd, idc)) {
			ArrayList<Produits> comd = cmd.getCommandeByClient(idc);
			request.setAttribute("panier",prd);
			request.setAttribute("commande", comd);
			session.removeAttribute("listPrd");
			reqDes = request.getRequestDispatcher("commande.jsp");
		}else reqDes = request.getRequestDispatcher("Catalogue");
		reqDes.forward(request, response);

	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
