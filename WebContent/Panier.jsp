<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
    <%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
	<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt" %>
    
<c:set var="language" value="${not empty param.lang? param.lang : pageContext.request.locale }" scope="session"/>
 <fmt:setLocale value="${language}" />
 <fmt:setBundle basename="Languages.text"/>


<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title><fmt:message  key="pn.tit" /></title>
<link rel="stylesheet" type="text/css" href="css/Style.css">

</head>
<body>
<jsp:include page="head.jsp" />

<jsp:include page="menu.jsp" />

	<h1 id="tit"><fmt:message  key="pn.tit" /></h1>
	<hr>
	<c:choose>
		<c:when test="${ not empty sessionScope.listPrd }">
			<table cellspacing="0">
				<thead>
					<tr>
						<th><fmt:message  key="AjtP.produits.photo" /></th>
						<th><fmt:message  key="AjtP.produits.titre" /></th>
						<th><fmt:message  key="AjtP.produits.auteur" /></th>
						<th><fmt:message  key="AjtP.produits.prix" /></th>
						<th><fmt:message  key="AjtP.produits.qttp" /></th>
					</tr>
				</thead>
				<c:forEach items="${listPrd}" var="prd">
					<tr>
						<td><img src="${prd.getPhoto()}" width="100px"/></td>
						<td>${prd.getTitre()}</td>
						<td>${prd.getAuteur()}</td>
						<td>${prd.getPrix()}</td>
						<td>${prd.getQttcom()}</td>
					</tr>
				</c:forEach>
			</table>
			<c:set var="nbrp" value='${requestScope["NombrP"]}'/>
			<h3><fmt:message  key="pni.nbrprd" /><c:out value="${nbrp}"/></h3>
		</c:when>
		<c:otherwise>
			<h1 id="tit"><fmt:message  key="pni.errinf" /></h1>
		</c:otherwise>
	</c:choose>
	
	<div class="Acc">
	<div class="Link">
 		<a href="Catalogue"><h4><fmt:message  key="pni.cmdothr" /></h4></a>
 	</div>
 	<div class="Link">
		<a href="Commande"><h4><fmt:message  key="pni.vcmd" /></h4></a>
 	</div>
 </div>
	
</body>
</html>