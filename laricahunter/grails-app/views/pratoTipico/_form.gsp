<%@ page import="laricahunter.PratoTipico" %>



<div class="fieldcontain ${hasErrors(bean: pratoTipicoInstance, field: 'municipio', 'error')} required">
	<label for="municipio">
		<g:message code="pratoTipico.municipio.label" default="Municipio" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="municipio" name="municipio.id" from="${laricahunter.Municipio.list()}" optionKey="id" required="" value="${pratoTipicoInstance?.municipio?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: pratoTipicoInstance, field: 'produto', 'error')} required">
	<label for="produto">
		<g:message code="pratoTipico.produto.label" default="Produto" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="produto" name="produto.id" from="${laricahunter.Produto.list()}" optionKey="id" required="" value="${pratoTipicoInstance?.produto?.id}" class="many-to-one"/>

</div>

