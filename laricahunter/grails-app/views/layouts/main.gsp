<!DOCTYPE html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> <html lang="en" class="no-js"><!--<![endif]-->
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<title>Larica Hunter - Grails</title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<link rel="shortcut icon" href="${resource(dir: 'images', file: 'favicon.ico')}" type="image/x-icon">
		<link rel="apple-touch-icon" href="${resource(dir: 'images', file: 'apple-touch-icon.png')}">
		<link rel="apple-touch-icon" sizes="114x114" href="${resource(dir: 'images', file: 'apple-touch-icon-retina.png')}">
		<link rel="stylesheet" href="${resource(dir: 'css', file: 'css.css')}" type="text/css">
		<link rel="stylesheet" href="${resource(dir: 'css', file: 'mobile.css')}" type="text/css">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
		<script src="${resource(dir: 'js', file: 'geolocation.js')}"></script>
		<script src="${resource(dir: 'js', file: 'js.cookie.js')}"></script>
		<script src="${resource(dir: 'js', file: 'bootbox.min.js')}"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
		<script src="https://maps.googleapis.com/maps/api/js"></script>
		<g:layoutHead/>
		<g:javascript library="application"/>		
		<r:layoutResources />
	</head>
	<body>
		
		<nav class="navbar navbar-default">
		  <div class="container-fluid">
			<div >
				<ul class="nav navbar-nav">
			        <sec:ifAllGranted roles="ROLE_ADMIN">
			        	<li><a id="home-link" href="#">Principal</a></li>
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
						<li><a id="home-link" href="#">Principal</a></li>
						<li><a href="${createLink(uri: '/cardapio')}">Cardápio</a></li>
						<li><a href="${createLink(controller: 'logout')}"> Logout</a></li>
					</sec:ifAllGranted>
					<sec:ifNotLoggedIn>
						<li><a id="home-link" href="#">Principal</a></li>
						<li><g:link controller='login' action='auth'>Login</g:link></li>
					</sec:ifNotLoggedIn>
					<li><a id="city-search" href="${createLink(uri: '/home')}">Cidade: </a></li>
					
				</ul>
			</div>
		   </div>
		</nav>	
		
		<div id="grailsLogo" role="banner"><a id="home-link2" href="#"><img src="${resource(dir: 'images', file: 'logo-larica-hunter.png')}" alt="Larica Hunter"/></a></div>

		<g:layoutBody/>
		<div class="footer" style="border-top: 1px solid #53777a; padding-top: 10px;" role="contentinfo"><center><p>Equipe Larica Hunter - 2015</p></center></div>
		<div id="spinner" class="spinner" style="display:none;"><g:message code="spinner.alt" default="Loading&hellip;"/></div>
		<r:layoutResources />
	</body>
	
</html>