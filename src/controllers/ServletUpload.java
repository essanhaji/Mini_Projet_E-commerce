package controllers;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import models.Produits;


public class ServletUpload extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String UPLOAD_DIRECTORY = "C:/Users/ES SANHAJI/Dropbox/Mini_Projet_E-commerce/WebContent/images";
        if (ServletFileUpload.isMultipartContent(request)) {
            try {
				List<FileItem> multiparts = new ServletFileUpload(new DiskFileItemFactory()).parseRequest(request);
                String ref = null,titre= null,aut= null,genre= null,prix= null,qtt= null;
                String name = null;
                for (FileItem item : multiparts) {
                    if (!item.isFormField()) {
                        name = new File(item.getName()).getName();
                        item.write(new File(UPLOAD_DIRECTORY + File.separator + name));
                    } else {
                        InputStream input = item.getInputStream();
                        if (item.getFieldName().equals("ref")) {
                            byte[] str = new byte[input.available()];
                            input.read(str);
                            ref = new String(str, "UTF8");
                        }
                        if (item.getFieldName().equals("titre")) {
                            byte[] str = new byte[input.available()];
                            input.read(str);
                            titre = new String(str, "UTF8");
                        }
                        if (item.getFieldName().equals("aut")) {
                            byte[] str = new byte[input.available()];
                            input.read(str);
                            aut = new String(str, "UTF8");
                        }
                        if (item.getFieldName().equals("genre")) {
                            byte[] str = new byte[input.available()];
                            input.read(str);
                            genre = new String(str, "UTF8");
                      
                        }
                        if (item.getFieldName().equals("prix")) {
                            byte[] str = new byte[input.available()];
                            input.read(str);
                            prix = new String(str, "UTF8");
                        }
                        if (item.getFieldName().equals("qtt")) {
                            byte[] str = new byte[input.available()];
                            input.read(str);
                            qtt = new String(str, "UTF8");
                        }
                    }
                }
                String photo = "images/"+name;
                Produits prod = new Produits();
                prod.setReference(ref);
                prod.setTitre(titre);
                prod.setAuteur(aut);
                prod.setPhoto(photo);
                prod.setGenre(genre);
                prod.setPrix(Double.parseDouble(prix));
                prod.setQuantite(Integer.parseInt(qtt));
                request.setAttribute("AddProd", prod.addProduit());
                }catch (Exception ex) {
            		ex.printStackTrace();
            		request.getRequestDispatcher("/AjouterProduits.jsp").forward(request, response);
            }
        }
        
        request.getRequestDispatcher("/AjouterProduits.jsp").forward(request, response);	
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
