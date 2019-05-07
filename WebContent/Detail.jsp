<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
    <%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
    <%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt" %>
    <c:set var="language" value="${not empty param.lang? param.lang : not empty lang? lang : pageContext.request.locale }" scope="session"/>
 <fmt:setLocale value="${language}" />
 <fmt:setBundle basename="Languages.text"/>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Detail</title>
<link rel="stylesheet" type="text/css" href="css/Style.css">

<style type="text/css">
	td{
		border: 1px solid black;
	}
	table {
		margin: 5% 0 0 28%;
	}
	table tr td a {
		margin: 0px 5%;
	}
</style>

</head>
<body>

<jsp:include page="head.jsp" />

<jsp:include page="menu.jsp" />

	<jsp:useBean id="produit" class="models.Produits" scope="request"/>
	<h1><fmt:message  key="dt.titre" /> <jsp:getProperty property="titre" name="produit"/></h1>
	<table cellspacing="0"">
		<tr>
			<td rowspan="4"><img src='<jsp:getProperty property="photo" name="produit"/>' width="200px" /></td>
		</tr>
		<tr>
			<td><label><fmt:message  key="AjtP.produits.ref" /> : </label></td>
			<td><jsp:getProperty property="reference" name="produit"/></td>
			<td><label><fmt:message  key="AjtP.produits.titre" /> :</label></td>
			<td><jsp:getProperty property="titre" name="produit"/></td>
		</tr>
		<tr>
			<td><label><fmt:message  key="AjtP.produits.auteur" /> :</label></td>
			<td><jsp:getProperty property="auteur" name="produit"/></td>
			<td><label><fmt:message  key="AjtP.produits.qtt" /></label></td>
			<td><jsp:getProperty property="quantite" name="produit"/></td>
		</tr>
		<tr>

			<td><label><fmt:message  key="AjtP.produits.prix" /> :</label></td>
			<td colspan="3"><jsp:getProperty property="prix" name="produit"/></td>
		</tr>
		<tr><td colspan="5"><a href="Catalogue"><fmt:message  key="dt.ret" /></a>&nbsp;<a href="Panier?addprod=<jsp:getProperty property="reference" name="produit"/>"><fmt:message  key="Ctlg.message.addc" /></a></td></tr>
	</table>
</body>
</html>