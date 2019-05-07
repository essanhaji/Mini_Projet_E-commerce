<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
  <%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
    <%@ taglib uri="http://java.sun.com/jstl/sql_rt" prefix="sql" %>
          <%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt" %>
    <c:set var="language" value="${not empty param.lang? param.lang : pageContext.request.locale }" scope="session"/>
 <fmt:setLocale value="${language}" />
 <fmt:setBundle basename="Languages.text"/>
<html lang="${language}">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Ajouter produit</title>
<link rel="stylesheet" type="text/css" href="css/Style.css">

</head>
<body>	

<jsp:include page="head.jsp" />


	
	<nav>
	<ul>
<li><a href="Deconnexion"><fmt:message  key="mn.message.deco" /></a></li>
	</ul>
	<form>
	<select id="lng" name="lang" onchange="this.form.submit()">
		<option value="fr">Français</option>
		<option value="en_us" <c:out value="${param.lang == 'en_us'? 'selected': '' }" /> >English</option>
	</select>
</form>
</nav>
	<sql:setDataSource dataSource="jdbc/e-commerce"/>
	<sql:query var="prods">
		select * from produits;
	</sql:query>
	
	<table cellspacing="0">
		<thead>
			<tr>
				<th><fmt:message  key="AjtP.produits.photo" /></th>
				<th><fmt:message  key="AjtP.produits.ref" /></th>
				<th><fmt:message  key="AjtP.produits.titre" /></th>
				<th><fmt:message  key="AjtP.produits.auteur" /></th>
				<th><fmt:message  key="AjtP.produits.gnr" /></th>
				<th><fmt:message  key="AjtP.produits.prix" /></th>
				<th><fmt:message key="AjtP.produits.qtt" /></th>
			</tr>
		</thead>
		<c:forEach var="prd" items="${prods.rows}">
			<tr>
				<td><img width="90px" src="${prd.photo}"/></td>
				<td>${prd.reference}</td>
				<td>${prd.titre}</td>
				<td>${prd.auteur}</td>
				<td>${prd.genre}</td>
				<td>${prd.prix}</td>
				<td>${prd.quantite}</td>
			</tr>
		</c:forEach>
	</table>
	<hr>
	<h1><fmt:message key="AjtP.tite2" /></h1>
	<form method="post" action="upload" class="MainIdtf" enctype="multipart/form-data">
		<div>
			<div class="inpt">
				<label><fmt:message  key="AjtP.produits.ref" /></label>
				<input type="text" name="ref">
			</div>
			<div class="inpt">
				<label><fmt:message  key="AjtP.produits.titre" /></label>
				<input type="text" name="titre">
			</div>
			<div class="inpt">
				<label><fmt:message  key="AjtP.produits.auteur" /></label>
				<input type="text" name="aut">
			</div>
			<div class="inpt">
				<label><fmt:message  key="AjtP.produits.gnr" /></label>
				
					<select name="genre">
						<option value="Roman">Roman</option>
						<option value="Religion">Religion</option>
						<option value="Politique">Plolitique</option>
					</select>
				
			</div>
			<div class="inpt">
				<label><fmt:message  key="AjtP.produits.prix" /></label>
				<input type="text" name="prix">
			</div>
			<div class="inpt">
				<label><fmt:message  key="AjtP.produits.qtt" /></label>
				<input type="text" name="qtt">
			</div>
			<div class="inpt">
				<label><fmt:message  key="AjtP.produits.photo" /></label>
				<input type="file" name="pht" />
			</div>
			<div class="inpt">
				<input type="submit" name="submit" value="<fmt:message  key="AjtP.message.sub" />">
				<input type="reset" name="vider" name="vider" value="<fmt:message  key="AjtP.message.reset" />">
			</div>
		</div>
	</form>
	<c:if test="${not empty requestScope['AddProd'] }">
		<c:set var="photo" value='${requestScope["photo"]}'/>
		<c:choose>
			<c:when test="${requestScope['AddProd'] == true}">
				<h2>Le produit a été ajouter avec succé</h2>
			</c:when>
			<c:when test="${requestScope['AddProd'] == false}">
				<h2>l'insertion de produit est echouer</h2>
			</c:when>
		</c:choose>
	</c:if>
</body>
</html>