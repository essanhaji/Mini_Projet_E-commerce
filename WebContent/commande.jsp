<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
    <%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
    <%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Commandes</title>
<link rel="stylesheet" type="text/css" href="css/Style.css">
<c:set var="language" value="${not empty param.lang? param.lang : pageContext.request.locale }" scope="session"/>
 <fmt:setLocale value="${language}" />
 <fmt:setBundle basename="Languages.text"/>

</head>
<body>
<jsp:include page="head.jsp" />

<jsp:include page="menu.jsp" />

	<h1 id="tit"><fmt:message  key="mn.message.mcmd" /></h1>
	<hr>
	<h3 id="tit"><fmt:message  key="mn.message.infocmd" /></h3>
	
	<table cellspacing="0">
		<thead>
			<tr>
				<th><fmt:message  key="AjtP.produits.photo" /></th>
				<th><fmt:message  key="AjtP.produits.titre" /></th>
				<th><fmt:message  key="AjtP.produits.auteur" /></th>
				<th><fmt:message  key="AjtP.produits.prix" /></th>
				<th><fmt:message  key="AjtP.produits.qtt" /></th>
			</tr>
		</thead>
		<c:forEach items="${panier}" var="prd">
			<tr>
				<td><img width="90px" src="${prd.getPhoto()}"/></td>
				<td>${prd.getTitre()}</td>
				<td>${prd.getAuteur()}</td>
				<td>${prd.getPrix()}</td>
				<td>${prd.getQttcom()}</td>
			</tr>
		</c:forEach>
	</table>
	<h3><fmt:message  key="message.yord" /> ${panier.size()} <fmt:message  key="message.prd" /></h3>
	<hr>
	<h2 id="tit"><fmt:message  key="cmd.message.titre2" /></h2>
	<table cellspacing="0">
		<thead>
			<tr>
				<th><fmt:message  key="AjtP.produits.photo" /></th>
				<th><fmt:message  key="AjtP.produits.titre" /></th>
				<th><fmt:message  key="AjtP.produits.auteur" /></th>
				<th><fmt:message  key="AjtP.produits.prix" /></th>
				<th><fmt:message  key="AjtP.produits.qtt" /></th>
			</tr>
		</thead>
		<c:forEach items="${commande}" var="Cprd">
			<tr>
				<td><img width="90px" src="${Cprd.getPhoto()}"/></td>
				<td>${Cprd.getTitre()}</td>
				<td>${Cprd.getAuteur()}</td>
				<td>${Cprd.getPrix()}</td>
				<td>${Cprd.getQttcom()}</td>
			</tr>
		</c:forEach>
	</table>	
</body>
</html>