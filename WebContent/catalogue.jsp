<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
	 <%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
	       <%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt" %>
	 
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Catalogue</title>
<link rel="stylesheet" type="text/css" href="css/Style.css">

</head>
<body>
<c:set var="language" value="${not empty param.lang? param.lang : not empty language? language : pageContext.request.locale }" scope="session"/>
 <fmt:setLocale value="${language}" />
 <fmt:setBundle basename="Languages.text"/>
<jsp:include page="head.jsp" />

<jsp:include page="menu.jsp" />

	<c:set var="disRoman" value='${requestScope["disRoman"]}'/>
	<c:set var="disPolitique" value='${requestScope["disPolitique"]}'/>
	<c:set var="disReligion" value='${requestScope["disReligion"]}'/>
	<h1><fmt:message  key="Ctlg.message.titre" /></h1>
	<form action="ChangeGnr" method="post">
		<label style="display: block;"><fmt:message  key="Ctlg.message.Chg" /> : </label>
		<input type="submit" value="Roman" name="genre" class="BtnG" <c:out value="${disRoman}"/>/>
		<input type="submit" value="Politique" name="genre" class="BtnG" <c:out value="${disPolitique}"/>/>
		<input type="submit" value="Religion" name="genre" class="BtnG" <c:out value="${disReligion}"/>/>
		<table cellspacing="0">
			<thead>
				<tr>
					<th><fmt:message  key="AjtP.produits.ref" /></th>
					<th><fmt:message  key="AjtP.produits.titre" /></th>
					<th><fmt:message  key="AjtP.produits.auteur" /></th>
					<th><fmt:message  key="AjtP.produits.photo" /></th>
					<th><fmt:message  key="AjtP.produits.prix" /></th>
					<th></th>
				</tr>
			</thead>
			<c:forEach items="${produits}" var="prod">
				<c:if test="${prod.getQuantite() != 0}">
					<tr>
						<td><a href="Details?ref=${prod.getReference()}">${prod.getReference()}</a></td>
						<td>${prod.getTitre()}</td>
						<td>${prod.getAuteur()}</td>
						<td><img width="90px" src="${prod.getPhoto()}"/></td>
						<td>${prod.getPrix()}</td>
						<td><a href="Panier?addprod=${prod.getReference()}"><fmt:message  key="Ctlg.message.addc" /></a></td>
					</tr>
				</c:if>
			</c:forEach>
		</table>
	</form>
</body>
</html>