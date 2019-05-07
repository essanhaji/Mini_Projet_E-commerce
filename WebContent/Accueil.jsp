 <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
      <%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
      <%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Acceuil</title>
<link rel="stylesheet" type="text/css" href="css/Style.css">
<style type="text/css"> .head { box-shadow: 0px 11px 11px 0px #ab7676; border-bottom: 1px solid black;}  </style>
</head>
<body>
<c:set var="language" value="${not empty param.lang? param.lang : not empty language? language : pageContext.request.locale }" scope="session"/>
 <fmt:setLocale value="${language}" />
 <fmt:setBundle basename="Languages.text"/>
<jsp:include page="head.jsp" />
<nav> 
<form style="padding: 29px">
	<select id="lng" name="lang" onchange="this.form.submit()"> <option value="fr" >Français</option> 
		<option value="en_us"<c:out value="${param.lang == 'en_us'? 'selected': '' }" /> >English</option> 
	</select>
</form>
</nav>
<h1 id="tit"><fmt:message  key="message.titre" /></h1>
<hr>
<div class="Acc"> <div class="Link">
 <a href="Identifier"><fmt:message  key="message.ident" /></a>
</div>
  <div class="Link" >
 	<a href="Inscr"><fmt:message  key="message.insc" /></a>	
 </div> </div>

</body>
</html>