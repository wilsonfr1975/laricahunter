
<%@ page import="laricahunter.PratoTipico" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'pratoTipico.label', default: 'PratoTipico')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-pratoTipico" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/home')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-pratoTipico" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<th><g:message code="pratoTipico.municipio.label" default="Municipio" /></th>
					
						<th><g:message code="pratoTipico.produto.label" default="Produto" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${pratoTipicoInstanceList}" status="i" var="pratoTipicoInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${pratoTipicoInstance.id}">${fieldValue(bean: pratoTipicoInstance, field: "municipio")}</g:link></td>
					
						<td>${fieldValue(bean: pratoTipicoInstance, field: "produto")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${pratoTipicoInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
