
<%@ page import="laricahunter.Home" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'home.label', default: 'Home')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-home" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
	<div class="nav" role="navigation">

		<ul>
				<li><a class="home" href="${createLink(uri: '/home')}"><g:message code="default.home.label"/></a></li>
				<sec:ifAllGranted roles="ROLE_ADMIN">
				<li><a class="" href="${createLink(uri: '/estabelecimento')}">Estabelecimento</a></li>
				<li><a class="" href="${createLink(uri: '/categoria')}">Categoria</a></li>
				<li><a class="" href="${createLink(uri: '/cardapio')}">Cardápio</a></li>
				<li><a class="" href="${createLink(uri: '/pratoTipico')}">PratoTipico</a></li>
				<li><a class="" href="${createLink(uri: '/produto')}">Produto</a></li>
				<li><a class="" href="${createLink(uri: '/municipio')}">Municipio</a></li>
				<li><a class="" href="${createLink(uri: '/uf')}">UF</a></li>
				<li><a class="" href="${createLink(uri: '/usuario')}">Usuário</a></li>
				<li><a class="" href="${createLink(uri: '/regra')}">Regra</a></li>
				<li><a class="" href="${createLink(uri: '/usuarioRegra')}">UsuarioRegra</a></li>
				<li><a href="${createLink(controller: 'logout')}"> Logout</a></li>
				</sec:ifAllGranted>
				<sec:ifAllGranted roles="ROLE_USER">
					<li><a class="" href="${createLink(uri: '/cardapio')}">Cardápio</a></li>
					<li><a href="${createLink(controller: 'logout')}"> Logout</a></li>
				</sec:ifAllGranted>

				<sec:ifNotLoggedIn>
					<div>
						<li><span><g:link class="login" controller='login' action='auth'>Login</g:link></span></li>
					</div>
				</sec:ifNotLoggedIn>
			<sec:ifLoggedIn>
				<li><span style="font-size: x-small">Logado:<sec:loggedInUserInfo field="username"/></span></li>
			</sec:ifLoggedIn>
</ul>
</div>

		<div id="list-home" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
					</tr>
				</thead>
				<tbody>
				<fieldset class="form">
					<g:form controller="Estabelecimento" action="list" method="GET">
						<div class="fieldcontain">
							<label for="query">Busca:</label>
							<g:textField name="query" value="${params.query}" placeholder="Por Estabelecimento"/>
						</div>
					</g:form>
				</fieldset>

				<g:each in="${estabelecimentoList}" status="i" var="estabelecimentoInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

						<td ><g:link style="font-size: small" action="show" controller="estabelecimento" id="${estabelecimentoInstance.id}">${fieldValue(bean: estabelecimentoInstance, field: "nomefantasia")}</g:link></td>

					</tr>
				</g:each>
				<g:each in="${homeInstanceList}" status="i" var="homeInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${homeInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
