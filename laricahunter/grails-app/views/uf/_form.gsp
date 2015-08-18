<%@ page import="laricahunter.Uf" %>



<div class="fieldcontain ${hasErrors(bean: ufInstance, field: 'sigla', 'error')} required">
	<label for="sigla">
		<g:message code="uf.sigla.label" default="Sigla" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="sigla" required="" value="${ufInstance?.sigla}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: ufInstance, field: 'nome', 'error')} required">
	<label for="nome">
		<g:message code="uf.nome.label" default="Nome" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nome" required="" value="${ufInstance?.nome}"/>

</div>

