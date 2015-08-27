<%@ page import="laricahunter.Cardapio" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'cardapio.label', default: 'Cardapio')}" />
		<title><g:message code="default.edit.label" args="[entityName]" /></title>
	</head>
	<body>
		<div id="edit-cardapio" class="content scaffold-edit" role="main">
			<h1><g:message code="default.edit.label" args="[entityName]" /></h1>
			<sec:ifAllGranted roles="ROLE_ADMIN">
				<div class="links">
					<g:link   action="index"><g:message code="default.list.label" args="[entityName]" /></g:link>
					<g:link  action="create"><g:message code="default.new.label" args="[entityName]" /></g:link>
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
			<g:hasErrors bean="${cardapioInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${cardapioInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			<sec:ifAllGranted roles="ROLE_ADMIN">
				<g:form url="[resource:cardapioInstance, action:'update']" method="POST"  enctype="multipart/form-data">
					<g:hiddenField name="version" value="${cardapioInstance?.version}" />
					<fieldset class="form">
						<g:render template="form"/>
					</fieldset>
					<fieldset class="buttons">
						<g:actionSubmit class="save" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" />
					</fieldset>
				</g:form>
			</sec:ifAllGranted>
			<sec:ifAllGranted roles="ROLE_USER">
				<g:form url="[resource:cardapioInstance, action:'update']" method="POST"  enctype="multipart/form-data">
					<g:hiddenField name="version" value="${cardapioInstance?.version}" />
					<fieldset class="form">
						<g:render template="form"/>
					</fieldset>
					<fieldset class="buttons">
						<g:actionSubmit class="save" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" />
					</fieldset>
				</g:form>
			</sec:ifAllGranted>
		</div>
	</body>
</html>
