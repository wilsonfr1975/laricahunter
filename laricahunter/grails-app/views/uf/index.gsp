
<%@ page import="laricahunter.Uf" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'uf.label', default: 'Uf')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<div id="list-uf" class="content scaffold-list" role="main">
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
					
						<g:sortableColumn property="sigla" title="${message(code: 'uf.sigla.label', default: 'Sigla')}" />
					
						<g:sortableColumn property="nome" title="${message(code: 'uf.nome.label', default: 'Nome')}" />
						
						<th>Ações</th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${ufInstanceList}" status="i" var="ufInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td>${fieldValue(bean: ufInstance, field: "sigla")}</td>
					
						<td>${fieldValue(bean: ufInstance, field: "nome")}</td>
					
						<td><g:link action="show" id="${ufInstance.id}">Acessar</g:link></td>
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${ufInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
