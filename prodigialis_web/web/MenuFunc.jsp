<%@page import="br.cefetmg.inf.prodigialis.controller.Login"%>
<%@page import="br.cefetmg.inf.prodigialis.model.dao.impl.ProcessoSeletivoDAO"%>
<%@page import="br.cefetmg.inf.prodigialis.model.dao.impl.FuncionarioDAO"%>
<%@page import="br.cefetmg.inf.prodigialis.model.domain.ProcessoSeletivo"%>

<%  Character cod = (Character)request.getSession().getAttribute("codUsuario");
    if(cod != '1'){
        request.getSession().setAttribute("codUsuario", null);
    }
    Login.validarSessao(request,response);%>


<head>

    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link href="bootstrap3/css/bootstrap.css" rel="stylesheet" />
    <link href="assets/css/ct-paper.css" rel="stylesheet"/>
    <meta charset="UTF-8">
    <!--     Fonts and icons     -->
    <link href="http://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
    <link href='http://fonts.googleapis.com/css?family=Montserrat' rel='stylesheet' type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300' rel='stylesheet' type='text/css'>
    <link rel="stylesheet" href="http://netdna.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.css">
    <link href='http://fonts.googleapis.com/css?family=Grand+Hotel' rel='stylesheet' type='text/css'>
    
    <script src="assets/js/jquery-1.10.2.js"></script>
    <script src="x_login-register modal/bootstrap3/js/bootstrap.js" type="text/javascript"></script>
    <meta name="viewport" content="width=device-width, user-scalable=no">
    <script src="assets/js/ct-paper.js"></script>
    
	<script src="assets/js/custom.js"></script> 
	
    <script src="x_login-register modal/login-register.js"></script>
    <link href="assets/css/custom.css" rel="stylesheet"/>
	<script src="assets/js/bootstrap-datepicker.js"></script>
	<script>
		$('.datepicker').datepicker({

             weekStart:1,

             color: '{color}'

		});
	</script>
</head>

<body>


    <div id="navbar">
        <div id="includedContent">
            <nav class="navbar navbar-default" style="background-color:#36312B;padding-top:0px;margin-bottom:5px;padding-bottom:0px" role="navigation" id="navbar">
                <div class="container">
                    <!-- Brand and toggle get grouped for better mobile display -->
                    <div class="navbar-header">
                        <button type="button" class="navbar-toggle" data-toggle="collapse">
                            <span class="sr-only">Toggle navigation</span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </button>
                        <a class="navbar-brand" style="color:#D1D1D1" href="#">Prodigialis RH</a>
                    </div>


                    <div class="collapse navbar-collapse" id="navigation-example-2">
                        <ul class="nav navbar-nav navbar-right">
                            <li>
                                <a href="Saiba.jsp" class="btn btn-simple">Sobre a empresa</a>
                            </li>
                            <li>
                                <div class="dropdown">

								  <button class="btn btn-simple dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown">
									
									<i class="fa fa-user-circle fa-1x" aria-hidden="true"></i><span>Nome Usuário</span>

									<span class="caret"></span>

								  </button>

								  <ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu1">

									<li role="presentation"><a role="menuitem" tabindex="-1" href="#">Informaçõe֥s da conta</a></li>

									<li role="presentation" class="divider"></li>

									<li role="presentation"><a href="index.html" tabindex="-1" role="menuitem">Sair</a></li>

								  </ul>

								</div>
                            </li>
                        </ul>
                    </div><!-- /.navbar-collapse -->
                </div><!-- /.container-->
            </nav>
        </div>  
    </div>

    <div class="main">
        <div class="nav-tabs-navigation">
            <div class="nav-tabs-wrapper">
                <ul id="tabs" class="nav nav-tabs" data-tabs="tabs">
                    <li class="active"><a href="#CriarProcesso" data-toggle="tab">Criar processo</a></li>
                    <li><a href="#AcompanharProcesso"  data-toggle="tab">Acompanhar processo</a></li>
                    <li><a href="#verCurriculo" data-toggle="tab">Ver curriculos</a></li>
                    
                </ul>
            </div>
        </div>
        <div id="my-tab-content" class="tab-content">
            <div class="tab-pane active" id="CriarProcesso">
				    <div class="container">

						<div class="row">

							<h3 class="header">Criar Novo Processo Seletivo</h3>
							
						</div>

						<div class="row">

							<div class="form-group col-md-6">
								
								<label>Nome do Processo</label>
								<input id="nome_proc" type="text" class="form-control default-cursor">
								

							</div>
							
							<div class="form-group col-md-6">
								
								<label>Número de vagas</label>
								<input id="n_vagas" type="text" class="form-control default-cursor">
								

							</div>

						</div>
							
						<div class="row">
							
							<div class="form-group col-md-6">
								<label>Data de início</label>
								<input type="text" id="data_ini" class="datepicker form-control">
							</div>

							<div class="form-group col-md-6">

								<label>Data de fim</label>
								<input type="text" id="data_fim" class="datepicker form-control">

							</div>
						
						</div>

						<div class="row">

							<div class="form-group col-md-12">
								
								<label>Descrição</label>
								<textarea id="desc" class="form-control" style="height:150px"></textarea>
								
							</div>

						</div>
							
						<div class="row">
							<label>Especificações</label>
						</div>
						<div class="row">
							<div class="form-group  col-sm-11" style="padding-right:0px">
								<input id="NewSpec" type="text" class="form-control">
							</div>
							<div class="form-group col-sm-1" style="padding-left:0px;text-align:left">
								<button  id="AddSpecs" class="btn btn-success btn-circle btn-simple pull-right" style="text-align:left"><i class="fa fa-plus adicionar" style="vertical-align:center;text-align:left"></i></button>
							</div>
						</div>
						<div class="row">
							<div class="form-group col-md-12">
								<ul class="list-group" id="SpecsList">
								  <!--<li class="list-group-item">Cras justo odio	<button  class="btn btn-danger btn-circle btn-simple pull-right btn-deleter"><i class="fa fa-times" style="vertical-align:center"></i></button></li>
								  -->
								</ul>
							</div>
						</div>
						
						<div class="row">
							<label>Prova</label>
							<div class="form-group col-md-12" >
								<input type="file" name="file-7[]" id="ArquivoProva" style="display:hidden" class="inputfile inputfile-6" data-multiple-caption="{count} arquivos selecionados" multiple="">
								<label for="ArquivoProva" class="width" >
									<a id="btnInput"  class="btn btn-fill" style="padding-left:60px;padding-right:60px;"> Prova</a> 
									<span id="DirArquivoProva"></span>
								</label>

							</div>

						</div>
						
						<div class="row">
							<div class="form-group col-md-12" >
								<input type="file" name="file-7[]" id="ArquivoGabarito" style="display:hidden" class="inputfile inputfile-6" data-multiple-caption="{count} arquivos selecionados" multiple="">
								<label for="ArquivoGabarito" class="width" >
									<a id="btnInput"  class="btn btn-fill" style="padding-left:60px;padding-right:60px;"> Gabarito</a> 
									<span id="DirArquivoGabarito"></span>
								</label>

							</div>

						</div>
						
						

						<div class="row">

							<div id="submit" class="form-group col-md-4 pull-right ">
								<form id="form1" action="" method="post">
									<button style="width:100%"  type="submit" name="action" class="btn btn-fill ">Criar Processo
									  <i class="fa fa-plus" ></i> 
									</button>
								</form>

							</div>

						</div>

					</div>

				</div>
			
            <div class="tab-pane" id="AcompanharProcesso">
				
				<div class="container">
					<h3 class="header">Ver Processo Seletivo</h3>
					<div class="row">
					
						<div class="form-group col-md-10">
							
							<select class="form-control default-cursor">
							
								<option value="" disabled selected>Escolha um processo</option>
								<option value="1">123 - 22</option>
								<option value="2">322 - 22</option>
								<option value="3">434 - 33</option>
								
							</select>
							
							<!--<div id="d1" class="wrapper-dropdown" tabindex="1">
									<span>Processo...</span>
									<ul class="select-dropdown">
										<li><a href="#"><i class="icon-envelope icon-large"></i>123 - 22</a></li>
										<li><a href="#"><i class="icon-truck icon-large"></i>322 - 22</a></li>
										<li><a href="#"><i class="icon-plane icon-large"></i>434 - 33</a></li>
									</ul>
								</div>-->
						
						</div>
						
						<div class="form-group col-md-2 ">
							<button  class="btn btn-fill" style="width:100%" type="submit" onclick="pesquisar()">Listar Dados
							<i class=" fa fa-list-alt"></i>
							</button>
								
						</div>
						
					
					</div>
					
				</div>
				
							<hr/>
				<div class="container">	
					
					<div class="row" id="proc" >
						
						<div class="form-group col-md-4 ">
							
							<label>Nome do Processo</label>
							<input readonly value="123 - 22"  type="text" class="form-control default-cursor">
							
						</div>
						
						<div class="form-group col-md-4 ">
							<label>Vagas de</label>
							<input readonly value="Programador"  type="text" class="form-control default-cursor">
						</div>
						
						<div class="form-group col-md-4 ">
							<label>Número de vagas</label>
							<input readonly value="32"  type="text" class="form-control default-cursor">
						</div>
					
					</div>
							
					<div class="row">
					
						<div class="form-group col-md-6 ">
							
							<label>Data de Início</label>
							<input readonly value="12/04/2016"  type="text" class="form-control default-cursor">
							
						</div>
						
						<div class="form-group col-md-6 ">
						
							<label>Data de Fim</label>
							<input readonly value="21/04/2016"  type="text" class="form-control default-cursor">
							
						</div>
					
					</div>
							
					<div class="row">
						<div class="form-group col-md-12 ">
							<label id="Specs" data-toggle="collapse" data-target="#demo">Especificações  </label><i id="Caret" class="fa fa-caret-right CaretRight" aria-hidden="true"></i>
							<div id="demo" class="collapse">
							<ul class="list-group">
								<li class="list-group-item">Especificação 1</li>
								<li class="list-group-item">Especificação 2</li>
								<li class="list-group-item">Especificação 3</li>
								<li class="list-group-item">Especificação 4</li>
								<li class="list-group-item">Especificação 5</li>
								<li class="list-group-item">Especificação 6</li>
							</ul>
							</div>
							
							
						</div>
					</div>
				</div>
				<hr/>
				<div class="container">
								
					<div class="row">
						<div class="form-group col-md-12">
						
							<label>Curriculos recebidos</label>
							<select class="form-control">
									
								<option value="" disabled selected>Escolha um curriculo</option>
								<option value="1">Jose</option>
								<option value="2">Maria</option>
								<option value="3">Heitor</option>
								
							</select>
							
							
						</div>
					</div>
					<div class="row">
						
						<div class="form-group col-md-12">
							<label>Nome do Candidato</label>
							<input value="José da Silva Santos" readonly type="text" class="form-control default-cursor">
						</div>
						
					</div>
					
					<div class="row">
					
						<div class="form-group col-md-8">
							<label>E-mail</label>
							<input value="jsilva@hotmail.com" type="text" readonly class="form-control default-cursor">
						</div>
						
						<div class="form-group col-md-4">
							<label>Telefone</label>
							<input value="(31)98888-8888" type="text" readonly class="form-control default-cursor">
						</div>
						
					</div>
					
					<div class="row">
					
						<div class="col-md-8">
							<label>Curriculo:</label>
						</div>
					</div>
					
					<div class="row">
						
						<div class="form-group col-md-8 ">
							<input value="83217428 " readonly type="text" class="form-control default-cursor camuflado">
						</div>	
						
						<div class="form-group pull-right col-md-4">
							<button  class="btn btn-fill" style="width:100%" type="submit" onclick="pesquisar()">Download
								<i class=" fa fa-list-alt"></i>
							</button>
						</div>
						
					</div>	

					<div class="row">
					
							<div class="form-group col-md-12">
								<label>Enviar email para candidato escolhido</label>
								<textarea placeholder="e-mail..." class="form-control"></textarea>
						</div>
						
					</div>
					
					<div class="row">
						
						<div class="form-group pull-right col-md-4">
							
							<form id="form1" action="" method="post">
								<button type="submit" style="width:100%"  id="btnSubmit"  class=" btn btn-fill">
									Aprovar candidato <span class="fa fa-check" aria-hidden="true"></span>
								</button>
							</form>
						
						</div>
			
					</div>	
					
				</div>
				
			</div>
			
            <div class="tab-pane" id="verCurriculo">
	
					<div class="container">
						<h3 class="header">Ver Currículo</h3>
						<div class="row">
							<div class="form-group col-md-8">
								<input placeholder="Codigo do candidato" id="disabled" type="text" class="form-control">
							</div>
							<div class="form-group pull-right col-md-4">
									<button  class="btn btn-fill" style="width:100%" type="submit" id="PesquisarCurriculo">Pesquisar</button>
							</div>
						</div>			
					</div>
					
					<hr/>
					
					<div class="container" id="InformacoesCurriculo" style="padding-bottom:40px">
					
						<div class="row">
							
							<div class="form-group col-md-12 ">
								<label>Nome do Candidato</label>
								<input value="José da Silva Santos" readonly type="text" class="form-control default-cursor">
							</div>
							
						</div>
						
						<div class="row">
						
							<div class="form-group col-md-8 ">
								<label>E-mail</label>
								<input value="jsilva@hotmail.com" type="text" readonly class="form-control default-cursor">
							</div>
							
							<div class="form-group col-md-4 ">
								<label>Telefone</label>
								<input value="(31)98888-8888" type="text" readonly class="form-control default-cursor">
							</div>
							
						</div>
						
						<div class="row">
						
							<div class="col-md-8">
								<label>Curriculo:</label>
							</div>
						</div>
						
						<div class="row">
							
							<div class="form-group col-md-8 ">
								<input value="83217428 " readonly type="text" class="form-control default-cursor">
							</div>	
							
							<div class="form-group pull-right col-md-4">
								<button  class="btn btn-fill" style="width:100%" type="submit" >Download
									<i class=" fa fa-download"></i>
								</button>
							</div>
							
						</div>	
					
						
						<div class="row" style="padding-top:30px">
								
							<div class="form-group col-md-12">
								<button  class="btn btn-fill" style="width:100%" type="submit" onclick="pesquisar()">Solicitar Contratação
									<span class="fa fa-check" aria-hidden="true"></span>
								</button>
							</div>	
								
						</div>
					
				</div>
        </div>

        
    </div>
	</div>
    <footer class="footer" style="background-color:#36312B;color:#d1d1d1;text-align:center;padding-top:30px;padding-bottom:30px;">
        <div class="container">
            <div>Prodigialis RH<span>  ·  </span>Trabalho de conclusão de curso</div>
            <div>Centro Federal de Educação Tecnológica de Minas Gerais</div>
            <div>Já nos conhece? Conheça a <a href="" style="color:#777;">staff</a></div>
            <div>Publicado sob a licença de <a href="http://www.creative-tim.com/license" style="color:#777;">Creative Tim</a></div>
        </div>
    </footer>
</body>