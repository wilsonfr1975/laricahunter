
<%@ page import="laricahunter.Municipio" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'municipio.label', default: 'Municipio')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>

		<div id="list-municipio" class="content scaffold-list" role="main">
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
					
						<g:sortableColumn property="nome" title="${message(code: 'municipio.nome.label', default: 'Nome')}" />
					
						<th><g:message code="municipio.uf.label" default="Uf" /></th>
					
						<th>Ações</th>
					</tr>
				</thead>
				<tbody>
				<g:each in="${municipioInstanceList}" status="i" var="municipioInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td>${fieldValue(bean: municipioInstance, field: "nome")}</td>
					
						<td>${fieldValue(bean: municipioInstance, field: "uf")}</td>
					
						<td><g:link action="show" id="${municipioInstance.id}">Acessar</g:link></td>
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${municipioInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
