
<%@ page import="seguranca.UsuarioRegra" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'usuarioRegra.label', default: 'UsuarioRegra')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<div id="list-usuarioRegra" class="content scaffold-list" role="main">
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
					
						<th><g:message code="usuarioRegra.regra.label" default="Regra" /></th>
					
						<th><g:message code="usuarioRegra.usuario.label" default="Usuario" /></th>
						
						<th>Ações</th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${usuarioRegraInstanceList}" status="i" var="usuarioRegraInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td>${fieldValue(bean: usuarioRegraInstance, field: "regra")}</td>
					
						<td>${fieldValue(bean: usuarioRegraInstance, field: "usuario")}</td>
						
						<td><g:link action="show" id="${usuarioRegraInstance.id}">Acessar</g:link></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${usuarioRegraInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
