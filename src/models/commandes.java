package models;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class commandes {

	private String reference;
	private int idcom,idC,quantite;
	private Statement stm;
	private ResultSet rst;
	private Connection con;
	private ArrayList<Produits> listcomd = new ArrayList<Produits>();

	public commandes() {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/e-commerce", "root", "");
			stm = con.createStatement();
		} catch (SQLException e) {
			e.printStackTrace();
		}catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public ArrayList<Produits> getCommandeByClient(int idC){
		try {
			rst = stm.executeQuery("select * from commande where IdC="+idC);
			Produits p;
			while(rst.next()) {
				p = new Produits();
				p.setProduitByRef(rst.getString("Reference"));
				p.setQttcom(rst.getInt("quantite"));
				listcomd.add(p);
			}
			return listcomd;
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
	}
	
	public boolean addcommande(ArrayList<Produits> prod,int idC){
		try {
			String rqt = "insert into commande(Reference,quantite,IdC) values ";
			for (Produits p : prod) {
				rqt +="('"+p.getReference()+"',"+p.getQttcom()+","+idC+"),";
				stm.executeUpdate("update Produits set quantite="+(p.getQuantite() - p.getQttcom())+" where reference='"+p.getReference()+"'");
			}
			rqt = rqt.replaceAll("[,]+$", "");
			stm.executeUpdate(rqt);
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
	}
	
	public int getQuantite() {
		return quantite;
	}

	public void setQuantite(int quantite) {
		this.quantite = quantite;
	}
	public String getReference() {
		return reference;
	}
	public void setReference(String reference) {
		this.reference = reference;
	}
	public int getIdcom() {
		return idcom;
	}
	public void setIdcom(int idcom) {
		this.idcom = idcom;
	}
	public int getIdC() {
		return idC;
	}
	public void setIdC(int idC) {
		this.idC = idC;
	}
}
