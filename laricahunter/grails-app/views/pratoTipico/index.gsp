
<%@ page import="laricahunter.PratoTipico" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'pratoTipico.label', default: 'PratoTipico')}" />
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
