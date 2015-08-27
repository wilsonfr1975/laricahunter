
<%@ page import="laricahunter.PratoTipico" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'pratoTipico.label', default: 'PratoTipico')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
			
		<div id="list-pratoTipico" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<div class="links">
				<g:link action="index"><g:message code="default.list.label" args="[entityName]" /></g:link>
				<g:link action="create"><g:message code="default.new.label" args="[entityName]" /></g:link>
			</div>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<th><g:message code="pratoTipico.municipio.label" default="Municipio" /></th>
					
						<th><g:message code="pratoTipico.produto.label" default="Produto" /></th>
					
						<th>Ações</th>
						
					</tr>
				</thead>
				<tbody>
				<g:each in="${pratoTipicoInstanceList}" status="i" var="pratoTipicoInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td>${fieldValue(bean: pratoTipicoInstance, field: "municipio")}</td>
					
						<td>${fieldValue(bean: pratoTipicoInstance, field: "produto")}</td>
						
						<td><g:link action="show" id="${pratoTipicoInstance.id}">Acessar</g:link></td>
					
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
