
<%@ page import="laricahunter.Cardapio" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'cardapio.label', default: 'Cardapio')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
	<nav class="navbar navbar-default">
	  <div class="container-fluid">
	    <div class="navbar-header">
	      <a class="navbar-brand" href="#">Larica Hunter</a>
	    </div>
		<div >
			<ul class="nav navbar-nav">
				<li><a id="home-link" href="#"><g:message code="default.home.label"/></a></li>
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
				<li><a id="city-search" href="${createLink(uri: '/home')}">Pesquisando em...</a></li>
			</ul>
		</div>
	   </div>
	</nav>	
	
		<div id="show-cardapio" class="content scaffold-show"  role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<sec:ifAllGranted roles="ROLE_ADMIN">
				<div class="links">
					<g:link  action="index"><g:message code="default.list.label" args="[entityName]" /></g:link>
					<g:link  action="create"><g:message code="default.new.label" args="[entityName]" /></g:link>
				</div>
			</sec:ifAllGranted>
			
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list cardapio">
			
				<g:if test="${cardapioInstance?.preco}">
				<li class="fieldcontain">
					<span id="preco-label" class="property-label"><g:message code="cardapio.preco.label" default="Preco"/>: </span>
					
						<span class="property-value" aria-labelledby="preco-label"><g:fieldValue bean="${cardapioInstance}" field="preco"/></span>
				</li>
				</g:if>
			
				<g:if test="${cardapioInstance?.descricao}">
				<li class="fieldcontain">
					<span id="descricao-label" class="property-label"><g:message code="cardapio.descricao.label" default="Descricao"/>: </span>
					
						<span class="property-value" aria-labelledby="descricao-label"><g:fieldValue bean="${cardapioInstance}" field="descricao"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${cardapioInstance?.avatar}">
				<li class="fieldcontain">
					<span id="avatar-label" class="property-label"><g:message code="cardapio.avatar.label" default="Avatar"/>: </span>
					<div class="property-value" aria-labelledby="imagem-label">
						<img width="50" style="margin-left: 15px;" height="50" src="${createLink(controller:'cardapio', action:'image', id: cardapioInstance?.id)}"/>
					</div>
				</li>
				</g:if>
			
				<g:if test="${cardapioInstance?.categoria}">
				<li class="fieldcontain">
					<span id="categoria-label" class="property-label"><g:message code="cardapio.categoria.label" default="Categoria"/>: </span>
					
						<span class="property-value" aria-labelledby="categoria-label"><g:link controller="categoria" action="show" id="${cardapioInstance?.categoria?.id}">${cardapioInstance?.categoria?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${cardapioInstance?.estabelecimento}">
				<li class="fieldcontain">
					<span id="estabelecimento-label" class="property-label"><g:message code="cardapio.estabelecimento.label" default="Estabelecimento"/>: </span>
					
						<span class="property-value" aria-labelledby="estabelecimento-label"><g:link controller="estabelecimento" action="show" id="${cardapioInstance?.estabelecimento?.id}">${cardapioInstance?.estabelecimento?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${cardapioInstance?.produto}">
				<li class="fieldcontain">
					<span id="produto-label" class="property-label"><g:message code="cardapio.produto.label" default="Produto"/>: </span>
					
						<span class="property-value" aria-labelledby="produto-label"><g:link controller="produto" action="show" id="${cardapioInstance?.produto?.id}">${cardapioInstance?.produto?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<sec:ifAllGranted roles="ROLE_ADMIN">
				<g:form url="[resource:cardapioInstance, action:'delete']" method="DELETE">
					<fieldset class="buttons">
						<g:link class="edit" action="edit" resource="${cardapioInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
						<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
					</fieldset>
				</g:form>
			</sec:ifAllGranted>
		</div>
	</body>
</html>
