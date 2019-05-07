<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<c:set var="language" value="${not empty param.lang? param.lang : pageContext.request.locale }" scope="session"/>
 <fmt:setLocale value="${language}" />
 <fmt:setBundle basename="Languages.text"/>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title><fmt:message  key="ins.sub" /></title>
<link rel="stylesheet" type="text/css" href="css/Style.css">
</head><body>
<jsp:include page="head.jsp" />
<nav><ul><li><a href="Acceuil"><fmt:message  key="mn.message.ac" /></a></li>
<li><a href="Identifier"><fmt:message  key="idt.idntf" /></a></li></ul><form>
<select id="lng" name="lang" onchange="">
	<option value="fr" >Français</option>
	<option value="en_us" <c:out value="${param.lang == 'en_us'? 'selected': '' }" /> >English</option>
</select></form></nav>
	<h1 id="tit"><fmt:message  key="idt.singi" /></h1>
	<c:set var="message" value='${requestScope["ErrInsc"]}'/>
	<p><c:out value="${message}"/></p>
	<form method="post" action="Inscription" class="MainIdtf">
		<div><div class="inpt">
			<label><fmt:message  key="ins.nom" /> </label>
			<input type="text" name="nom"/>
			</div>
			<div class="inpt">
				<label><fmt:message  key="ins.prn" /> : </label>
				<input type="text" name="prenom"/>
			</div>
			<div class="inpt">
				<label><fmt:message  key="ins.addr" /> : </label>				
				<input type="text" name="address"/>
				<label><fmt:message  key="ins.cp" /> : </label>	
				<input type="text" name="cdpostal" />
				<label><fmt:message  key="ins.vll" /> : </label>	
				<input type="text" name="city" />
				
			</div>
			<div class="inpt">
				<label>E-mail : </label>
				<input type="text" name="mail"/>
			</div>
			<div class="inpt">
				<label><fmt:message  key="idt.psw" /> : </label>
				<input type="password" name="password"/>
				<input type="submit" name="submit" value="<fmt:message  key="ins.sub" />"/>
			</div>
		</div>
	</form>
</body>
</html>