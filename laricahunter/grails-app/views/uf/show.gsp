
<%@ page import="laricahunter.Uf" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'uf.label', default: 'Uf')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<div id="show-uf" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<div class="links">
				<g:link action="index"><g:message code="default.list.label" args="[entityName]" /></g:link>
				<g:link  action="create"><g:message code="default.new.label" args="[entityName]" /></g:link>
			</div>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list uf">
			
				<g:if test="${ufInstance?.sigla}">
				<li class="fieldcontain">
					<span id="sigla-label" class="property-label"><g:message code="uf.sigla.label" default="Sigla" /></span>
					
						<span class="property-value" aria-labelledby="sigla-label"><g:fieldValue bean="${ufInstance}" field="sigla"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${ufInstance?.nome}">
				<li class="fieldcontain">
					<span id="nome-label" class="property-label"><g:message code="uf.nome.label" default="Nome" /></span>
					
						<span class="property-value" aria-labelledby="nome-label"><g:fieldValue bean="${ufInstance}" field="nome"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:ufInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${ufInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
