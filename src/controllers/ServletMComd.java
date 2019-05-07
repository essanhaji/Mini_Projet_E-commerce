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
import models.commandes;


public class ServletMComd extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		HttpSession session = request.getSession(true);
		commandes cmd = new commandes();
		int idc = Integer.parseInt(session.getAttribute("clt").toString());
		ArrayList<Produits> comd = cmd.getCommandeByClient(idc);
		request.setAttribute("commande", comd);
		RequestDispatcher  reqDes = request.getRequestDispatcher("MesCommandes.jsp");
		reqDes.forward(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
