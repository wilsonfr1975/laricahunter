<%@ page import="laricahunter.Home" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'home.label', default: 'Home')}" />
		<title>Larica Hunter - Grails</title>
	</head>
	<body>
	<nav class="navbar navbar-default">
	  <div class="container-fluid">
	    <div class="navbar-header">
	      <a class="navbar-brand" href="#">Larica Hunter</a>
	    </div>
	    <div>
	     	<ul class="nav navbar-nav">
		        <li><a id="home-link" href="#"><g:message code="default.home.label"/></a></li>
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
				<sec:ifAllGranted roles="ROLE_USER">
					<li><a href="${createLink(uri: '/cardapio')}">Cardápio</a></li>
					<li><a href="${createLink(controller: 'logout')}"> Logout</a></li>
				</sec:ifAllGranted>
				<sec:ifNotLoggedIn>
					<li><g:link controller='login' action='auth'>Login</g:link></li>
				</sec:ifNotLoggedIn>
				<li><a id="city-search" href="${createLink(uri: '/home')}">Pesquisando em...</a></li>
	      	</ul>
	    </div>
	  </div>
	</nav>
		<div id="list-home" class="container" style="margin-top:50px;">
				<div class="well" background:#F5F5F5;">
                	<center>
                		<h3 style="padding-bottom:10px;">ÁREA DE BUSCA</h3>
                	</center>
                	<g:form accept-charset="UTF-8" controller="home" action="list" method="GET" name="search-form">
                		<div style="display:none">
                			<input name="utf8" type="hidden" value="&#x2713;" />
                		</div>
                		<div class="input-group" style="width: 100%;height:50px;text-align: center;">
                    		<input class="form-control" id="search" name="search" placeholder="Busca por Estabelecimento ou prato" style="height:50px;text-align: center;" type="text" />
                    	</div>
                        <br/>
                        <center>
                        	<input class="btn btn-warning" name="commit" style="width: 30%;height:50px; margin-top: 20px; outline: 1px solid #000;" type="submit" value="PESQUISAR" />
                        </center>
                    </g:form>
            	</div>
				<p></p>
				<div class="row">
					<g:each in="${estabelecimentoList}" status="i" var="estabelecimentoInstance">
						<div class="col-md-4">
							<div class="panel panel-default">
								<div class="panel-heading">
									<h3><g:link action="show" controller="estabelecimento" id="${estabelecimentoInstance.id}">${fieldValue(bean: estabelecimentoInstance, field: "nomefantasia")}</g:link></h3>
								</div>
								<div class="panel-body">
									<center>
										<p>
											<g:link class="img-thumbnail" action="show" controller="estabelecimento" id="${estabelecimentoInstance.id}"><img width="150" height="150" src="${createLink(controller:'estabelecimento', action:'image', id: estabelecimentoInstance?.id)}"/> </g:link>
										</p>
										<h5><strong>${estabelecimentoInstance.fone1}</strong></h5>
										<g:link class="btn btn-warning" action="index" controller="cardapio" id="${estabelecimentoInstance.id}">Ver Cardápio</g:link>
										<br>
										<h10><strong>Endereço: ${estabelecimentoInstance.logradouro} - ${estabelecimentoInstance.numero} - CEP: ${estabelecimentoInstance.cep}</strong></h10>
										<br>
										<h10><strong>Atendimento: <g:formatDate date="${estabelecimentoInstance?.horaabertura}" type="time" style="SHORT"/> até <g:formatDate date="${estabelecimentoInstance?.horafechamento}" type="time" style="SHORT"/></strong></h10>
									</center>
								</div>	
							</div>
						</div>
					</g:each>
				</div>
				<center>
                		<h3 style="padding-bottom:10px;">Pratos Típicos</h3>
                </center>				
				<p></p>
				<div class="row">
					<g:each in="${cardapioList}" status="i" var="cardapioInstance">
						<div class="col-md-4">
							<div class="panel panel-default">
								<div class="panel-heading">
									<h3><g:link action="show" controller="home" id="${cardapioInstance.id}">${fieldValue(bean: cardapioInstance, field: "descricao")}</g:link></h3>
								</div>
								<div class="panel-body">
									<center>
										<p>
											<g:link class="img-thumbnail" action="show" controller="home" id="${cardapioInstance.id}"><img width="150" height="150" src="${createLink(controller:'cardapio', action:'image', id: cardapioInstance?.id)}"/> </g:link>
										</p>										
									</center>
								</div>	
							</div>
						</div>
					</g:each>
				</div>
				<g:each in="${homeInstanceList}" status="i" var="homeInstance">
				</g:each>
				<div class="pagination">
					<g:paginate total="${homeInstanceCount ?: 0}" />
				</div>
		</div>

	</body>
</html>