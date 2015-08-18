
<%@ page import="laricahunter.Cardapio" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'cardapio.label', default: 'Cardapio')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-cardapio" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/home')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-cardapio" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="preco" title="${message(code: 'cardapio.preco.label', default: 'Preco')}" />
					
						<g:sortableColumn property="descricao" title="${message(code: 'cardapio.descricao.label', default: 'Descricao')}" />
					
						<g:sortableColumn property="avatar" title="${message(code: 'cardapio.avatar.label', default: 'Avatar')}" />
					
						<th><g:message code="cardapio.categoria.label" default="Categoria" /></th>
					
						<th><g:message code="cardapio.estabelecimento.label" default="Estabelecimento" /></th>
					
						<th><g:message code="cardapio.produto.label" default="Produto" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${cardapioInstanceList}" status="i" var="cardapioInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${cardapioInstance.id}">${fieldValue(bean: cardapioInstance, field: "preco")}</g:link></td>
					
						<td>${fieldValue(bean: cardapioInstance, field: "descricao")}</td>
					
						<td>${fieldValue(bean: cardapioInstance, field: "avatar")}</td>
					
						<td>${fieldValue(bean: cardapioInstance, field: "categoria")}</td>
					
						<td>${fieldValue(bean: cardapioInstance, field: "estabelecimento")}</td>
					
						<td>${fieldValue(bean: cardapioInstance, field: "produto")}</td>
					
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
