package models;

import java.io.Serializable;
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

public class Produits implements Serializable{

	private String reference, titre, auteur, photo, genre;
	private double prix;
	private int quantite, qttcom = 0;
	private Connection con;
	private Statement stm;
	private ResultSet rst;
	private ArrayList<Produits> listproduits = new ArrayList<Produits>();
	public Produits() {
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

	private Produits(ResultSet rslt) {
		try {
			reference = rslt.getString("Reference");
			titre = rslt.getString("titre");
			auteur = rslt.getString("auteur");
			photo = rslt.getString("photo");
			genre = rslt.getString("genre");
			prix = rslt.getDouble("prix");
			quantite = rslt.getInt("quantite");
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}
	public ArrayList<Produits> getProduits() {
		try {
			if(listproduits.size() != 0) listproduits.clear();
			rst = stm.executeQuery("select * from produits");
			while(rst.next()) {

				listproduits.add(new Produits(rst));
			}
			return listproduits;
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
	}
	public void setProduitByRef(String ref) {
		try {
			rst = stm.executeQuery("select * from produits where Reference='"+ref+"'");
			if(rst.next()) {
				reference = rst.getString("Reference");
				titre = rst.getString("titre");
				auteur = rst.getString("auteur");
				photo = rst.getString("photo");
				genre = rst.getString("genre");
				prix = rst.getDouble("prix");
				quantite = rst.getInt("quantite");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	public ArrayList<Produits> getProduitsByType(String genre) {
		try {
			if(listproduits.size() != 0) listproduits.clear();
			rst = stm.executeQuery("select * from produits where genre ='"+genre+"'");
			while(rst.next()) {
				listproduits.add(new Produits(rst));
			}
			return listproduits;
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
	}
	
	public boolean addProduit() {
		String rqt = "INSERT INTO produits(reference,titre, auteur, photo, genre, prix, quantite) VALUES('"+reference+"','"+titre+"','"+auteur+"','images/Logo.png','"+genre+"',"+prix+","+quantite+")";
		try {
			stm.executeUpdate(rqt);
			return true;
		} catch (Exception e) {
			return false;
		}
	}
	public int getQttcom() {
		return qttcom;
	}

	public void setQttcom(int qttcom) {
	  this.qttcom = qttcom;
	
	}
	
	public void setQttcom() {
		if (this.qttcom < this.quantite) {
			this.qttcom++;
		}
		
	}
	public String getReference() {
		return reference;
	}
	public void setReference(String reference) {
		this.reference = reference;
	}
	public String getTitre() {
		return titre;
	}
	public void setTitre(String titre) {
		this.titre = titre;
	}
	public String getAuteur() {
		return auteur;
	}
	public void setAuteur(String auteur) {
		this.auteur = auteur;
	}
	public String getPhoto() {
		return photo;
	}
	public void setPhoto(String photo) {
		this.photo = photo;
	}
	public String getGenre() {
		return genre;
	}
	public void setGenre(String genre) {
		this.genre = genre;
	}
	public double getPrix() {
		return prix;
	}
	public void setPrix(double prix) {
		this.prix = prix;
	}
	public int getQuantite() {
		return quantite;
	}
	public void setQuantite(int quantite) {
		this.quantite = quantite;
	}

}
