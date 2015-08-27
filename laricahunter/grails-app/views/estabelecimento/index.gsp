
<%@ page import="laricahunter.Estabelecimento" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'estabelecimento.label', default: 'Estabelecimento')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
	
		<div id="list-estabelecimento" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<div class="links">
				<g:link  action="index"><g:message code="default.list.label" args="[entityName]" /></g:link>
				<g:link  action="create"><g:message code="default.new.label" args="[entityName]" /></g:link>
			</div>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="cnpj" title="${message(code: 'estabelecimento.cnpj.label', default: 'Cnpj')}" />
					
						<g:sortableColumn property="razaosocial" title="${message(code: 'estabelecimento.razaosocial.label', default: 'Razaosocial')}" />
					
						<g:sortableColumn property="nomefantasia" title="${message(code: 'estabelecimento.nomefantasia.label', default: 'Nomefantasia')}" />
					
						<g:sortableColumn property="logradouro" title="${message(code: 'estabelecimento.logradouro.label', default: 'Logradouro')}" />
					
						<g:sortableColumn property="numero" title="${message(code: 'estabelecimento.numero.label', default: 'Numero')}" />

						<th>Ações</th>
						
					</tr>
				</thead>
				<tbody>
				<g:each in="${estabelecimentoInstanceList}" status="i" var="estabelecimentoInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td>${fieldValue(bean: estabelecimentoInstance, field: "cnpj")}</td>
					
						<td>${fieldValue(bean: estabelecimentoInstance, field: "razaosocial")}</td>
					
						<td>${fieldValue(bean: estabelecimentoInstance, field: "nomefantasia")}</td>
					
						<td>${fieldValue(bean: estabelecimentoInstance, field: "logradouro")}</td>
					
						<td>${fieldValue(bean: estabelecimentoInstance, field: "numero")}</td>
					
						<td><g:link action="show" id="${estabelecimentoInstance.id}">Acessar</g:link></td>
					
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${estabelecimentoInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
