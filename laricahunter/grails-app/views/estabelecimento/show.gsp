
<%@ page import="laricahunter.Estabelecimento" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'estabelecimento.label', default: 'Estabelecimento')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>

		<div id="show-estabelecimento" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<sec:ifAllGranted roles="ROLE_ADMIN">
				<div class="links">
					<g:link action="index"><g:message code="default.list.label" args="[entityName]" /></g:link>
					<g:link action="create"><g:message code="default.new.label" args="[entityName]" /></g:link>
				</div>
			</sec:ifAllGranted>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list estabelecimento">
			
				<g:if test="${estabelecimentoInstance?.cnpj}">
				<li class="">
					<span id="cnpj-label" class="property-label"><g:message code="estabelecimento.cnpj.label" default="Cnpj" />: </span>
					
						<span class="property-value" aria-labelledby="cnpj-label"><g:fieldValue bean="${estabelecimentoInstance}" field="cnpj"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${estabelecimentoInstance?.razaosocial}">
				<li class="">
					<span id="razaosocial-label" class="property-label"><g:message code="estabelecimento.razaosocial.label" default="Razaosocial"/>: </span>
					
						<span class="property-value" aria-labelledby="razaosocial-label"><g:fieldValue bean="${estabelecimentoInstance}" field="razaosocial"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${estabelecimentoInstance?.nomefantasia}">
				<li class="">
					<span id="nomefantasia-label" class="property-label"><g:message code="estabelecimento.nomefantasia.label" default="Nomefantasia"/>: </span>
					
						<span class="property-value" aria-labelledby="nomefantasia-label"><g:fieldValue bean="${estabelecimentoInstance}" field="nomefantasia"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${estabelecimentoInstance?.logradouro}">
				<li class="">
					<span id="logradouro-label" class="property-label"><g:message code="estabelecimento.logradouro.label" default="Logradouro"/>: </span>
					
						<span class="property-value" aria-labelledby="logradouro-label"><g:fieldValue bean="${estabelecimentoInstance}" field="logradouro"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${estabelecimentoInstance?.numero}">
				<li class="">
					<span id="numero-label" class="property-label"><g:message code="estabelecimento.numero.label" default="Numero"/>: </span>
					
						<span class="property-value" aria-labelledby="numero-label"><g:fieldValue bean="${estabelecimentoInstance}" field="numero"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${estabelecimentoInstance?.complemento}">
				<li class="">
					<span id="complemento-label" class="property-label"><g:message code="estabelecimento.complemento.label" default="Complemento"/>: </span>
					
						<span class="property-value" aria-labelledby="complemento-label"><g:fieldValue bean="${estabelecimentoInstance}" field="complemento"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${estabelecimentoInstance?.bairro}">
				<li class="">
					<span id="bairro-label" class="property-label"><g:message code="estabelecimento.bairro.label" default="Bairro"/>: </span>
					
						<span class="property-value" aria-labelledby="bairro-label"><g:fieldValue bean="${estabelecimentoInstance}" field="bairro"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${estabelecimentoInstance?.cep}">
				<li class="">
					<span id="cep-label" class="property-label"><g:message code="estabelecimento.cep.label" default="Cep"/>: </span>
					
						<span class="property-value" aria-labelledby="cep-label"><g:fieldValue bean="${estabelecimentoInstance}" field="cep"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${estabelecimentoInstance?.fone1}">
				<li class="">
					<span id="fone1-label" class="property-label"><g:message code="estabelecimento.fone1.label" default="Fone1"/>: </span>
					
						<span class="property-value" aria-labelledby="fone1-label"><g:fieldValue bean="${estabelecimentoInstance}" field="fone1"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${estabelecimentoInstance?.fone2}">
				<li class="">
					<span id="fone2-label" class="property-label"><g:message code="estabelecimento.fone2.label" default="Fone2"/>: </span>
					
						<span class="property-value" aria-labelledby="fone2-label"><g:fieldValue bean="${estabelecimentoInstance}" field="fone2"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${estabelecimentoInstance?.fone3}">
				<li class="">
					<span id="fone3-label" class="property-label"><g:message code="estabelecimento.fone3.label" default="Fone3"/>: </span>
					
						<span class="property-value" aria-labelledby="fone3-label"><g:fieldValue bean="${estabelecimentoInstance}" field="fone3"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${estabelecimentoInstance?.horaabertura}">
				<li class="">
					<span id="horaabertura-label" class="property-label"><g:message code="estabelecimento.horaabertura.label" default="Horaabertura"/>: </span>
					
						<span class="property-value" aria-labelledby="horaabertura-label"><g:formatDate date="${estabelecimentoInstance?.horaabertura}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${estabelecimentoInstance?.horafechamento}">
				<li class="">
					<span id="horafechamento-label" class="property-label"><g:message code="estabelecimento.horafechamento.label" default="Horafechamento"/>: </span>
					
						<span class="property-value" aria-labelledby="horafechamento-label"><g:formatDate date="${estabelecimentoInstance?.horafechamento}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${estabelecimentoInstance?.avatar}">
				<li class="">
					<span id="avatar-label" class="property-label"><g:message code="estabelecimento.avatar.label" default="Avatar"/>: </span>
					<div class="property-value" aria-labelledby="imagem-label">
						<img width="50" style="margin-left: 15px;" height="50" src="${createLink(controller:'estabelecimento', action:'image', id: estabelecimentoInstance?.id)}"/>
					</div>
				</li>
				</g:if>
			
				<g:if test="${estabelecimentoInstance?.municipio}">
				<li class="">
					<span id="municipio-label" class="property-label"><g:message code="estabelecimento.municipio.label" default="Municipio" /></span>
					
						<span class="property-value" aria-labelledby="municipio-label">${estabelecimentoInstance?.municipio?.encodeAsHTML()}</span>
					
				</li>
				</g:if>
			
			</ol>
			<sec:ifAllGranted roles="ROLE_ADMIN">
				<g:form url="[resource:estabelecimentoInstance, action:'delete']" method="DELETE">
					<fieldset class="buttons">
						<g:link class="edit" action="edit" resource="${estabelecimentoInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
						<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
					</fieldset>
				</g:form>
			</sec:ifAllGranted>
		</div>
	</body>
</html>
