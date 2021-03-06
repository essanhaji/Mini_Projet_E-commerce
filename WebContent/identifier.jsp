<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
    <%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
	<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt" %>
<html>
<c:set var="language" value="${not empty param.lang? param.lang : pageContext.request.locale }" scope="session"/>
<fmt:setLocale value="${language}" />  <fmt:setBundle basename="Languages.text"/>
<head> <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title><fmt:message  key="idt.singi" /></title>
<link rel="stylesheet" type="text/css" href="css/Style.css"> </head>
<body>
<jsp:include page="head.jsp" />
<nav> <ul> <li><a href="Acceuil"><fmt:message  key="mn.message.ac" /></a></li> <li><a href="Inscr">
<fmt:message  key="idt.singi" /></a></li></ul><form>
<select id="lng" name="lang" onchange="submit()"> <option value="fr" >Fran�ais</option>
<option value="en_us" <c:out value="${param.lang == 'en_us'? 'selected': '' }" /> >English</option> </select>
</form></nav>
<h1 id="tit"><fmt:message  key="idt.idntf" /></h1>
<c:set var="message" value='${requestScope["ErrAuth"]}'/>
<p class="Err"><c:out value="${message}"/></p>
<form method="post" action="Authen" class="MainIdtf">
<div> <div class="inpt"> <label>E-mail : </label>
		<input type="text" name="mail"/> </div>
<div class="inpt"> <label><fmt:message  key="idt.psw" /></label>
<input type="password" name="password"/>
<input type="submit" name="submit" value="<fmt:message  key="idt.sub" />"/>
</div></div>
</form>
</body>
</html>