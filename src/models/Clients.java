package models;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import org.omg.CosNaming.NamingContextExtPackage.AddressHelper;

public class Clients {
	
	private String nom,prenom,adresse,email,motdpass;
	private int id;
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	private Connection con;
	private Statement stm;
	private ResultSet rst;
	public Clients() {
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
	
	public boolean getClient() { 
		
		try {
			rst = stm.executeQuery("select * from clients where Email='"+email+"' and password='"+motdpass+"'");
			if(rst.next()) {
				id = rst.getInt("IdC");
				nom = rst.getString("Nom");
				prenom = rst.getString("Prenom");
				adresse = rst.getString("Adresse");
				return true;
			}else return false;
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
		
	}
	
	public boolean getClientById(int id) { 			
		try {
			rst = stm.executeQuery("select * from clients where IdC="+id);
			if(rst.next()) {
				id = rst.getInt("IdC");
				nom = rst.getString("Nom");
				prenom = rst.getString("Prenom");
				adresse = rst.getString("Adresse");
				return true;
			}else return false;
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
		
	}
	
	public int setClient() {
		
		try {
			return stm.executeUpdate("insert into clients(Nom, Prenom, Adresse, Email, password) values('"+nom+"','"+prenom+"','"+adresse+"','"+email+"','"+motdpass+"')");
		} catch (SQLException e) {
			e.printStackTrace();
			return -1;
		}
	}
	
	public String getNom() {
		return nom;
	}

	public void setNom(String nom) {
		this.nom = nom;
	}

	public String getPrenom() {
		return prenom;
	}

	public void setPrenom(String prenom) {
		this.prenom = prenom;
	}

	public String getAdresse() {
		return adresse;
	}

	public void setAdresse(String adresse) {
		this.adresse = adresse;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getMotdpass() {
		return motdpass;
	}

	public void setMotdpass(String motdpass) {
		this.motdpass = motdpass;
	}
}
