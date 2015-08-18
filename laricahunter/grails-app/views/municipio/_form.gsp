<%@ page import="laricahunter.Municipio" %>



<div class="fieldcontain ${hasErrors(bean: municipioInstance, field: 'nome', 'error')} required">
	<label for="nome">
		<g:message code="municipio.nome.label" default="Nome" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nome" required="" value="${municipioInstance?.nome}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: municipioInstance, field: 'uf', 'error')} required">
	<label for="uf">
		<g:message code="municipio.uf.label" default="Uf" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="uf" name="uf.id" from="${laricahunter.Uf.list()}" optionKey="id" required="" value="${municipioInstance?.uf?.id}" class="many-to-one"/>

</div>

