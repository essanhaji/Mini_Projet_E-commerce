	       <%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt" %>
	             <%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
	       
	       <c:set var="language" value="${not empty param.lang? param.lang : pageContext.request.locale }" scope="session"/>
 <fmt:setLocale value="${language}" />
 <fmt:setBundle basename="Languages.text"/>
<div class="head">
	<img alt="logo" width="100px" src="images/Logo.png">
	<h1><fmt:message  key="headTitle" /></h1>
</div>