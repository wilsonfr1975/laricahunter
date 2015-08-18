<%@ page import="laricahunter.Cardapio" %>



<div class="fieldcontain ${hasErrors(bean: cardapioInstance, field: 'preco', 'error')} required">
	<label for="preco">
		<g:message code="cardapio.preco.label" default="Preco" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="preco" value="${fieldValue(bean: cardapioInstance, field: 'preco')}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: cardapioInstance, field: 'descricao', 'error')} required">
	<label for="descricao">
		<g:message code="cardapio.descricao.label" default="Descricao" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="descricao" required="" value="${cardapioInstance?.descricao}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: cardapioInstance, field: 'avatar', 'error')} required">
	<label for="avatar">
		<g:message code="cardapio.avatar.label" default="Avatar" />
		<span class="required-indicator">*</span>
	</label>
	<input type="file" id="avatar" name="avatar" />

</div>

<div class="fieldcontain ${hasErrors(bean: cardapioInstance, field: 'categoria', 'error')} required">
	<label for="categoria">
		<g:message code="cardapio.categoria.label" default="Categoria" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="categoria" name="categoria.id" from="${laricahunter.Categoria.list()}" optionKey="id" required="" value="${cardapioInstance?.categoria?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: cardapioInstance, field: 'estabelecimento', 'error')} required">
	<label for="estabelecimento">
		<g:message code="cardapio.estabelecimento.label" default="Estabelecimento" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="estabelecimento" name="estabelecimento.id" from="${laricahunter.Estabelecimento.list()}" optionKey="id" required="" value="${cardapioInstance?.estabelecimento?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: cardapioInstance, field: 'produto', 'error')} required">
	<label for="produto">
		<g:message code="cardapio.produto.label" default="Produto" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="produto" name="produto.id" from="${laricahunter.Produto.list()}" optionKey="id" required="" value="${cardapioInstance?.produto?.id}" class="many-to-one"/>

</div>

