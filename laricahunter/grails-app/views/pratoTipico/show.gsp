
<%@ page import="laricahunter.PratoTipico" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'pratoTipico.label', default: 'PratoTipico')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<div id="show-pratoTipico" class="content scaffold-show"  role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<div class="links">
				<g:link action="index"><g:message code="default.list.label" args="[entityName]" /></g:link>
				<g:link action="create"><g:message code="default.new.label" args="[entityName]" /></g:link>
			</div>

			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list pratoTipico">
			
				<g:if test="${pratoTipicoInstance?.municipio}">
				<li class="fieldcontain">
					<span id="municipio-label" class="property-label"><g:message code="pratoTipico.municipio.label" default="Municipio" />: </span>
					
						<span class="property-value" aria-labelledby="municipio-label"><g:link controller="municipio" action="show" id="${pratoTipicoInstance?.municipio?.id}">${pratoTipicoInstance?.municipio?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${pratoTipicoInstance?.produto}">
				<li class="fieldcontain">
					<span id="produto-label" class="property-label"><g:message code="pratoTipico.produto.label" default="Produto" />: </span>
					
						<span class="property-value" aria-labelledby="produto-label"><g:link controller="produto" action="show" id="${pratoTipicoInstance?.produto?.id}">${pratoTipicoInstance?.produto?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:pratoTipicoInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${pratoTipicoInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
