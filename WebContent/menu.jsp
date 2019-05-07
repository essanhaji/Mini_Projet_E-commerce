<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt" %>
 <%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<c:set var="language" value="${not empty param.lang? param.lang : not empty language? language : pageContext.request.locale}" scope="session"/>
 <fmt:setLocale value="${language}" />
 <fmt:setBundle basename="Languages.text"/>
 
<nav>
	<ul>
		<li><a href="Acceuil"><fmt:message  key="mn.message.ac" /></a></li>
		<li><a href="Catalogue"><fmt:message  key="mn.message.ctlg" /></a></li>
		<li><a href="Panier"><fmt:message  key="mn.message.pan" /></a></li>
		<li><a href="MesCommandes"><fmt:message  key="mn.message.mcmd" /></a></li>
		<li><a href="Deconnexion"><fmt:message  key="mn.message.deco" /></a></li>
	</ul>
	<form>
	<select id="lng" name="lang" onchange="this.form.submit()"> <option value="fr" >Français</option>
		<option value="en_us" <c:out value="${param.lang == 'en_us'? 'selected': '' }" /> >English</option>
	</select></form>
</nav>