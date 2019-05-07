<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
    	       <%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt" %>
	             <%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<c:set var="language" value="${not empty param.lang? param.lang : pageContext.request.locale }" scope="session"/>
 <fmt:setLocale value="${language}" />
 <fmt:setBundle basename="Languages.text"/>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title><fmt:message  key="mn.message.ac" /></title>
<link rel="stylesheet" type="text/css" href="css/Style.css">
</head>
<body>
	<jsp:include page="head.jsp" />
<jsp:include page="menu.jsp" />
	<c:set var="message" value='${requestScope["NameClt"]}'/>
	<h1 id="tit"><fmt:message  key="ind.titre" /> <c:out value="${message}"/></h1>
<hr>

<div class="Acc">
	<div class="Link">
 		<a href="Catalogue"><fmt:message  key="ind.catg" /></a>
 	</div>
 	<div class="Link">
 		<a href="MesCommandes"><fmt:message  key="ind.flword" /></a>
 	</div>
 	<div class="Link">
 		<a href="Panier"><fmt:message  key="ind.shcrt" /></a>	
 	</div>
 </div>
</body>
</html>