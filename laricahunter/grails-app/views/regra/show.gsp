
<%@ page import="seguranca.Regra" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'regra.label', default: 'Regra')}" />
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
		<div id="show-regra" class="content scaffold-show" style="margin-left: 2%;" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:link class="list" style="margin-left: 20px;" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link>
			<g:link class="create" style="margin-left: 20px;"  action="create"><g:message code="default.new.label" args="[entityName]" /></g:link>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list regra">
			
				<g:if test="${regraInstance?.authority}">
				<li class="fieldcontain">
					<span id="authority-label" class="property-label"><g:message code="regra.authority.label" default="Authority" /></span>
					
						<span class="property-value" aria-labelledby="authority-label"><g:fieldValue bean="${regraInstance}" field="authority"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:regraInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${regraInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
