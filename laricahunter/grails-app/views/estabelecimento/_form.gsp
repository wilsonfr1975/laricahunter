<%@ page import="laricahunter.Estabelecimento" %>



<div class="fieldcontain ${hasErrors(bean: estabelecimentoInstance, field: 'cnpj', 'error')} required">
	<label for="cnpj">
		<g:message code="estabelecimento.cnpj.label" default="Cnpj" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="cnpj" required="" value="${estabelecimentoInstance?.cnpj}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: estabelecimentoInstance, field: 'razaosocial', 'error')} required">
	<label for="razaosocial">
		<g:message code="estabelecimento.razaosocial.label" default="Razaosocial" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="razaosocial" required="" value="${estabelecimentoInstance?.razaosocial}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: estabelecimentoInstance, field: 'nomefantasia', 'error')} required">
	<label for="nomefantasia">
		<g:message code="estabelecimento.nomefantasia.label" default="Nomefantasia" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nomefantasia" required="" value="${estabelecimentoInstance?.nomefantasia}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: estabelecimentoInstance, field: 'logradouro', 'error')} required">
	<label for="logradouro">
		<g:message code="estabelecimento.logradouro.label" default="Logradouro" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="logradouro" required="" value="${estabelecimentoInstance?.logradouro}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: estabelecimentoInstance, field: 'numero', 'error')} required">
	<label for="numero">
		<g:message code="estabelecimento.numero.label" default="Numero" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="numero" required="" value="${estabelecimentoInstance?.numero}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: estabelecimentoInstance, field: 'complemento', 'error')} required">
	<label for="complemento">
		<g:message code="estabelecimento.complemento.label" default="Complemento" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="complemento" required="" value="${estabelecimentoInstance?.complemento}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: estabelecimentoInstance, field: 'bairro', 'error')} required">
	<label for="bairro">
		<g:message code="estabelecimento.bairro.label" default="Bairro" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="bairro" required="" value="${estabelecimentoInstance?.bairro}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: estabelecimentoInstance, field: 'cep', 'error')} required">
	<label for="cep">
		<g:message code="estabelecimento.cep.label" default="Cep" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="cep" required="" value="${estabelecimentoInstance?.cep}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: estabelecimentoInstance, field: 'fone1', 'error')} required">
	<label for="fone1">
		<g:message code="estabelecimento.fone1.label" default="Fone1" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="fone1" required="" value="${estabelecimentoInstance?.fone1}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: estabelecimentoInstance, field: 'fone2', 'error')} required">
	<label for="fone2">
		<g:message code="estabelecimento.fone2.label" default="Fone2" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="fone2" required="" value="${estabelecimentoInstance?.fone2}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: estabelecimentoInstance, field: 'fone3', 'error')} required">
	<label for="fone3">
		<g:message code="estabelecimento.fone3.label" default="Fone3" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="fone3" required="" value="${estabelecimentoInstance?.fone3}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: estabelecimentoInstance, field: 'horaabertura', 'error')} required">
	<label for="horaabertura">
		<g:message code="estabelecimento.horaabertura.label" default="Horaabertura" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="horaabertura" precision="minute"  value="${estabelecimentoInstance?.horaabertura}"  />

</div>

<div class="fieldcontain ${hasErrors(bean: estabelecimentoInstance, field: 'horafechamento', 'error')} required">
	<label for="horafechamento">
		<g:message code="estabelecimento.horafechamento.label" default="Horafechamento" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="horafechamento" precision="minute"  value="${estabelecimentoInstance?.horafechamento}"  />

</div>

<div class="fieldcontain ${hasErrors(bean: estabelecimentoInstance, field: 'avatar', 'error')} required">
	<label for="avatar">
		<g:message code="estabelecimento.avatar.label" default="Avatar" />
		<span class="required-indicator">*</span>
	</label>
	<input type="file" id="avatar" name="avatar" value="${estabelecimentoInstance?.avatar}" />

</div>

<div class="fieldcontain ${hasErrors(bean: estabelecimentoInstance, field: 'municipio', 'error')} required">
	<label for="municipio">
		<g:message code="estabelecimento.municipio.label" default="Municipio" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="municipio" name="municipio.id" from="${laricahunter.Municipio.list()}" optionKey="id" required="" value="${estabelecimentoInstance?.municipio?.id}" class="many-to-one"/>

</div>

