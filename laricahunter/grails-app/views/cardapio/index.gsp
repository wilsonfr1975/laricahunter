
<%@ page import="laricahunter.Cardapio" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'cardapio.label', default: 'Cardapio')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
	<nav class="navbar navbar-default">
	  <div class="container-fluid">
	    <div class="navbar-header">
	      <a class="navbar-brand" href="#">Larica Hunter</a>
	    </div>
		<div >
			<ul class="nav navbar-nav">
				<li><a href="${createLink(uri: '/home')}"><g:message code="default.home.label"/></a></li>
		        <sec:ifAllGranted roles="ROLE_ADMIN">
					<li><a href="${createLink(uri: '/estabelecimento')}">Estabelecimento</a></li>
					<li><a href="${createLink(uri: '/categoria')}">Categoria</a></li>
					<li><a href="${createLink(uri: '/cardapio')}">Cardápio</a></li>
					<li><a href="${createLink(uri: '/pratoTipico')}">PratoTipico</a></li>
					<li><a href="${createLink(uri: '/produto')}">Produto</a></li>
					<li><a href="${createLink(uri: '/municipio')}">Municipio</a></li>
					<li><a href="${createLink(uri: '/uf')}">UF</a></li>
					<li><a href="${createLink(uri: '/usuario')}">Usuário</a></li>
					<li><a href="${createLink(uri: '/regra')}">Regra</a></li>
					<li><a href="${createLink(uri: '/usuarioRegra')}">UsuarioRegra</a></li>
					<li><a href="${createLink(controller: 'logout')}"> Logout</a></li>
				</sec:ifAllGranted>
			</ul>
		</div>
	   </div>
	</nav>
		<div id="list-cardapio" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<sec:ifAllGranted roles="ROLE_ADMIN">
				<g:link class="create" style="margin-left: 20px;" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link>
			</sec:ifAllGranted>
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
					
						<td>
						<img width="50" height="50" src="${createLink(controller:'cardapio', action:'image', id: cardapioInstance?.id)}"/>
						</td>
					
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
