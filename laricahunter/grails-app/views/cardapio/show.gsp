
<%@ page import="laricahunter.Cardapio" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'cardapio.label', default: 'Cardapio')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-cardapio" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/home')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-cardapio" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list cardapio">
			
				<g:if test="${cardapioInstance?.preco}">
				<li class="fieldcontain">
					<span id="preco-label" class="property-label"><g:message code="cardapio.preco.label" default="Preco" /></span>
					
						<span class="property-value" aria-labelledby="preco-label"><g:fieldValue bean="${cardapioInstance}" field="preco"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${cardapioInstance?.descricao}">
				<li class="fieldcontain">
					<span id="descricao-label" class="property-label"><g:message code="cardapio.descricao.label" default="Descricao" /></span>
					
						<span class="property-value" aria-labelledby="descricao-label"><g:fieldValue bean="${cardapioInstance}" field="descricao"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${cardapioInstance?.avatar}">
				<li class="fieldcontain">
					<span id="avatar-label" class="property-label"><g:message code="cardapio.avatar.label" default="Avatar" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${cardapioInstance?.categoria}">
				<li class="fieldcontain">
					<span id="categoria-label" class="property-label"><g:message code="cardapio.categoria.label" default="Categoria" /></span>
					
						<span class="property-value" aria-labelledby="categoria-label"><g:link controller="categoria" action="show" id="${cardapioInstance?.categoria?.id}">${cardapioInstance?.categoria?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${cardapioInstance?.estabelecimento}">
				<li class="fieldcontain">
					<span id="estabelecimento-label" class="property-label"><g:message code="cardapio.estabelecimento.label" default="Estabelecimento" /></span>
					
						<span class="property-value" aria-labelledby="estabelecimento-label"><g:link controller="estabelecimento" action="show" id="${cardapioInstance?.estabelecimento?.id}">${cardapioInstance?.estabelecimento?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${cardapioInstance?.produto}">
				<li class="fieldcontain">
					<span id="produto-label" class="property-label"><g:message code="cardapio.produto.label" default="Produto" /></span>
					
						<span class="property-value" aria-labelledby="produto-label"><g:link controller="produto" action="show" id="${cardapioInstance?.produto?.id}">${cardapioInstance?.produto?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:cardapioInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${cardapioInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
