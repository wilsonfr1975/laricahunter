<%@ page import="laricahunter.Produto" %>



<div class="fieldcontain ${hasErrors(bean: produtoInstance, field: 'nome', 'error')} required">
	<label for="nome">
		<g:message code="produto.nome.label" default="Nome" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nome" required="" value="${produtoInstance?.nome}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: produtoInstance, field: 'categoria', 'error')} required">
	<label for="categoria">
		<g:message code="produto.categoria.label" default="Categoria" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="categoria" name="categoria.id" from="${laricahunter.Categoria.list()}" optionKey="id" required="" value="${produtoInstance?.categoria?.id}" class="many-to-one"/>

</div>

