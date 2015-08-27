
<%@ page import="laricahunter.Municipio" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'municipio.label', default: 'Municipio')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<div id="show-municipio" class="content scaffold-show"  role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<div class="links">
				<g:link action="index"><g:message code="default.list.label" args="[entityName]" /></g:link>
				<g:link action="create"><g:message code="default.new.label" args="[entityName]" /></g:link>
			</div>

			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list municipio">
			
				<g:if test="${municipioInstance?.nome}">
				<li class="fieldcontain">
					<span id="nome-label" class="property-label"><g:message code="municipio.nome.label" default="Nome" />: </span>
					
						<span class="property-value" aria-labelledby="nome-label"><g:fieldValue bean="${municipioInstance}" field="nome"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${municipioInstance?.uf}">
				<li class="fieldcontain">
					<span id="uf-label" class="property-label"><g:message code="municipio.uf.label" default="Uf" />: </span>
					
						<span class="property-value" aria-labelledby="uf-label"><g:link controller="uf" action="show" id="${municipioInstance?.uf?.id}">${municipioInstance?.uf?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:municipioInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${municipioInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
