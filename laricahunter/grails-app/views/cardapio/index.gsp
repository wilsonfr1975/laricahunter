
<%@ page import="laricahunter.Cardapio" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'cardapio.label', default: 'Cardapio')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<div id="list-cardapio" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<sec:ifAllGranted roles="ROLE_ADMIN">
				<div class="links">
					<g:link  action="index"><g:message code="default.list.label" args="[entityName]" /></g:link>
					<g:link action="create"><g:message code="default.new.label" args="[entityName]" /></g:link>
				</div>
			</sec:ifAllGranted>
			<sec:ifAllGranted roles="ROLE_USER">
				<div class="links">
					<g:link  action="index"><g:message code="default.list.label" args="[entityName]" /></g:link>
					<g:link  action="create"><g:message code="default.new.label" args="[entityName]" /></g:link>
				</div>
			</sec:ifAllGranted>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
					
						<g:sortableColumn property="avatar" title="${message(code: 'cardapio.avatar.label', default: 'Avatar')}" />
						
						<th><g:message code="cardapio.categoria.label" default="Categoria" /></th>
						
						<th><g:message code="cardapio.produto.label" default="Produto" /></th>

						<g:sortableColumn property="descricao" title="${message(code: 'cardapio.descricao.label', default: 'Descricao')}" />
					
						<th><g:message code="cardapio.estabelecimento.label" default="Estabelecimento" /></th>
					
						<g:sortableColumn property="preco" title="${message(code: 'cardapio.preco.label', default: 'Preco')}" />
						
						<th>Ações</th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${cardapioInstanceList}" status="i" var="cardapioInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td>
						<img width="50" height="50" src="${createLink(controller:'cardapio', action:'image', id: cardapioInstance?.id)}"/>
						</td>

						<td>${fieldValue(bean: cardapioInstance, field: "categoria")}</td>

						<td>${fieldValue(bean: cardapioInstance, field: "produto")}</td>

						<td>${fieldValue(bean: cardapioInstance, field: "descricao")}</td>
					
						<td>${fieldValue(bean: cardapioInstance, field: "estabelecimento")}</td>

						<td>R$ ${fieldValue(bean: cardapioInstance, field: "preco")}</td>
					
						<td><g:link action="show" id="${cardapioInstance.id}">Acessar</g:link></td>
						
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${cardapioInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
