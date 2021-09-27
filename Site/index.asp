<!DOCTYPE html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    
<meta charset="windows-1252">
  <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Site Dinamico</title>

<!--#include file ="lib/Conexao.asp"-->   

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" type="text/css" href="assets/css/bootstrap.min.css" >
    <!-- Fonts -->
    <link rel="stylesheet" type="text/css" href="assets/fonts/font-awesome.min.css">
    <!-- Icon -->
    <link rel="stylesheet" type="text/css" href="assets/fonts/simple-line-icons.css">
    <!-- Slicknav -->
    <link rel="stylesheet" type="text/css" href="assets/css/slicknav.css">
    <!-- Menu CSS -->
    <link rel="stylesheet" type="text/css" href="assets/css/menu_sideslide.css">
    <!-- Slider CSS -->
    <link rel="stylesheet" type="text/css" href="assets/css/slide-style.css">
    <!-- Nivo Lightbox -->
    <link rel="stylesheet" type="text/css" href="assets/css/nivo-lightbox.css" >
    <!-- Animate -->
    <link rel="stylesheet" type="text/css" href="assets/css/animate.css">
    <!-- Main Style -->
    <link rel="stylesheet" type="text/css" href="assets/css/main.css">
    <!-- Responsive Style -->
    <link rel="stylesheet" type="text/css" href="assets/css/responsive.css">

  </head>
  <body>





    <!-- Header Area wrapper Starts -->
    <header id="header-wrap">
      <!-- Navbar Start -->
      <nav class="navbar navbar-expand-lg fixed-top scrolling-navbar indigo">
        <div class="container">
          <!-- Brand and toggle get grouped for better mobile display -->
          <div class="navbar-header">
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#main-navbar" aria-controls="main-navbar" aria-expanded="false" aria-label="Toggle navigation">
              <span class="navbar-toggler-icon"></span>
              <span class="icon-menu"></span>
              <span class="icon-menu"></span>
              <span class="icon-menu"></span>
            </button>

          </div>
          <div class="collapse navbar-collapse" id="main-navbar">
            <ul class="onepage-nev navbar-nav mr-auto w-100 justify-content-end clearfix">
              <li class="nav-item active">
                <a class="nav-link" href="index.asp">
                  Home
                </a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="#cursos">
                  Cursos
                </a>
              </li>

              <li class="nav-item">
                <a class="nav-link" href="#contato">
                  Contato
                </a>
              </li>
            </ul>
          </div>
        </div>

        <!-- Mobile Menu Start -->
        <ul class="onepage-nev mobile-menu">
          <li>
            <a href="index.asp">Home</a>
          </li>
          <li>
            <a href="#cursos">Cursos</a>
          </li>
          <li>
            <a href="#contato">Contato</a>
          </li>
        </ul>
        <!-- Mobile Menu End -->
      </nav>
      <!-- Navbar End -->

      <!-- Hero Area Start -->
      <div id="hero-area" class="hero-area-bg">
        <div class="overlay"></div>
        <div class="container">
          <div class="row">
            <div class="col-md-12 col-sm-12 text-center">
              <div class="contents">
                <h5 class="script-font wow fadeInUp" data-wow-delay="0.2s">Portal de</h5>
                <h2 class="head-title wow fadeInUp" data-wow-delay="0.4s">Gerenciamento de Cursos</h2>
                <ul class="social-icon wow fadeInUp" data-wow-delay="0.8s">
                  <li>
                    <a class="facebook" href="#"><i class="icon-social-facebook"></i></a>
                  </li>
                  <li>
                    <a class="twitter" href="#"><i class="icon-social-twitter"></i></a>
                  </li>
                  <li>
                    <a class="instagram" href="#"><i class="icon-social-instagram"></i></a>
                  </li>
                  <li>
                    <a class="linkedin" href="#"><i class="icon-social-linkedin"></i></a>
                  </li>
                  <li>
                    <a class="google" href="#"><i class="icon-social-google"></i></a>
                  </li>
                </ul>

              </div>
            </div>
          </div>
        </div>
      </div>
      <!-- Hero Area End -->

    </header>
    <!-- Header Area wrapper End -->

    <!-- Sessao Cursos -->
    <section id="cursos" class="services section-padding">
      <h2 class="section-title wow flipInX" data-wow-delay="0.4s">Cursos</h2>
      <div class="container">
        <div class="row">
          <!-- Services item -->
<%
call abreConexao
sql = "select * from AU_Curso order by id_Curso "
set rs = conn.execute(sql)
do while not rs.eof
%>

          <div class="col-md-6 col-lg-3 col-xs-12">
            <div class="services-item wow fadeInDown" data-wow-delay="0.3s">
              <div class="icon">
                <i class="icon-grid"></i>
              </div>
              <div class="services-content">
                <h3><a href="index.asp?cod=<%=rs("id_Curso")%>#about"><%=rs("descricao")%></a></h3>
                <p><%=rs("resumo")%> </p>
              </div>
            </div>
          </div>
<%
rs.movenext
loop
call fechaConexao
%>
        </div>
      </div>
    </section>
    <!-- Fim Sessao cursos -->

<%
cod  = request.querystring("cod")
if cod <> "" then
function idade(datanascimento)
	ano_atual=year(date())'Extrai ano do atual
	mes_atual=month(date())'Extrai mes atual
	ano_niver=year(datanascimento)'Extrai ano do nascimento
	mes_niver=month(datanascimento)'Extrai mês do nascimento
	dif_ano=cint(ano_atual)-cint(ano_niver)'Faz a diferença dos anos
	dif_mes=cint(mes_atual)-cint(mes_niver)'Faz a diferença dos meses
	'Verifica se a diferença dos meses é negativa, 
	'se for e pq ainda não fez aniversário
	if (dif_mes<0) then
		idade=cint(dif_ano)-1
	else
		idade=dif_ano
	end if
end function
call abreConexao
sql = "	select * from AU_Professor inner join AU_Curso on AU_Curso.id_professor = AU_Professor.id_professor inner join AU_Modulo on AU_Modulo.id_curso = AU_Curso.id_Curso where AU_Curso.id_Curso = "&cod
set rs = conn.execute(sql)

%>    
    <!-- Sessao About -->
    <section id="about" class="section-padding">
      <div class="container">
        <div class="row">
          <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
            <div class="img-thumb wow fadeInLeft" data-wow-delay="0.3s">
              <img class="img-fluid" src="assets/img/fotos/<%=rs("foto")%>" alt="">
            </div>
          </div> 
          <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
            <div class="profile-wrapper wow fadeInRight" data-wow-delay="0.3s">

              <h3><%=rs("descricao")%></h3>
              <p><%=rs("resumo")%></p>
              <div class="about-profile">
                <ul class="admin-profile">
                  <li><span class="pro-title"> Nome </span> <span class="pro-detail"><%=rs("Nome")%></span></li>
                  <li><span class="pro-title"> Idade </span> <span class="pro-detail"><%=idade(rs("DataNasci"))%></span></li>
                  <li><span class="pro-title"> Cidade </span> <span class="pro-detail"><%=rs("Endereco")%></span></li>
                  <li><span class="pro-title"> e-mail </span> <span class="pro-detail"><%=rs("email")%></span></li>
                  <li><span class="pro-title"> Curriculo </span> <span class="pro-detail"><%=rs("Curriculo")%></span></li>

                </ul>
              </div>
            </div>
          </div>   
        </div>
      </div>
    </section>
    <%call fechaConexao%>
    <!-- Fim about -->

    <!-- Sessao detalhes curso -->
    <section id="detalhes" class="section-padding">
      <div class="container">
        <div class="row">
          <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
            <div class="profile-wrapper wow fadeInRight" data-wow-delay="0.3s">
              <h3>Detalhes</h3>
<%
call abreConexao
sql = "select * from AU_Modulo where id_curso = "&cod
set rs = conn.execute(sql)
%>              
              <div class="about-profile">
                <ul class="admin-profile">
<%do while not rs.eof %>
                  <li>
                  <span class="pro-title"> <%=rs("descricao")%> </span> 
                  <span class="pro-detail"><%=rs("Texto")%> </span>
                  <br>
                  <span class="pro-title"> Anexo </span> 
                  <span class="pro-detail"><a href="../upload/<%=rs("anexo")%>" target="_blank">Link anexo </a></span>                  
                  
                  </li>
<%
rs.movenext
loop
call fechaConexao
%>                  
                </ul>
              </div>
            </div>
          </div>   


        </div>
      </div>
    </section>
    <!-- Fim detalhes -->

<%end if%>
    <!-- Contact Section Start -->
    <section id="contact" class="section-padding">      
      <div class="contact-form">
        <div class="container">
          <div class="row contact-form-area wow fadeInUp" data-wow-delay="0.4s">          
            <div class="col-md-6 col-lg-6 col-sm-12">
              <div class="contact-block">
                <h2>Contato</h2>
                <form id="contactForm" action="envia_mensagem.asp" method="post">
                  <div class="row">
                    <div class="col-md-6">
                      <div class="form-group">
                        <input type="text" class="form-control" " name="nome" placeholder="Nome" required data-error="Nome">
                        <div class="help-block with-errors"></div>
                      </div>                                 
                    </div>
                    <div class="col-md-6">
                      <div class="form-group">
                        <input type="text" placeholder="Email" id="email" class="form-control" name="email" required data-error="E-mail">
                        <div class="help-block with-errors"></div>
                      </div> 
                    </div>
                     <div class="col-md-12">
                      <div class="form-group">
                        <input type="text" placeholder="Assunto" name="assunto" class="form-control" required data-error="Texto">
                        <div class="help-block with-errors"></div>
                      </div>
                    </div>
                    <div class="col-md-12">
                      <div class="form-group"> 
                        <textarea class="form-control" name="mensagem" placeholder="Mensagem" rows="5" data-error="Mensagem" required></textarea>
                        <div class="help-block with-errors"></div>
                      </div>
                      <div class="submit-button">
                        <button class="btn btn-common" id="submit" type="submit">Enviar</button>
                        <div id="msgSubmit" class="h3 text-center hidden"></div> 
                        <div class="clearfix"></div> 
                      </div>
                    </div>
                  </div>            
                </form>
              </div>
            </div>
            <div class="col-md-6 col-lg-6 col-sm-12">
              <div class="footer-right-area wow fadeIn">
                <h2>Endereço Contato</h2>
                <div class="footer-right-contact">

                  <div class="single-contact">
                    <div class="contact-icon">
                      <i class="fa fa-envelope"></i>
                    </div>
                    <p><a href="#">ianleandro87@gmail.com</a></p>

                  </div>
                  <div class="single-contact">
                    <div class="contact-icon">
                      <i class="fa fa-phone"></i>
                    </div>
                    <p><a href="#">(63) 99286-3557</a></p>
                  </div>
                </div>
              </div>
            </div>

        </div>
      </div>   
    </section>
    <!-- Contact Section End -->

    <!-- Footer Section Start -->
    <footer class="footer-area section-padding">
      <div class="container">
        <div class="row">
          <div class="col-md-12">
            <div class="footer-text text-center wow fadeInDown" data-wow-delay="0.3s">
              <ul class="social-icon">
                <li>
                  <a class="facebook" href="#"><i class="icon-social-facebook"></i></a>
                </li>
                <li>
                  <a class="twitter" href="#"><i class="icon-social-twitter"></i></a>
                </li>
                <li>
                  <a class="instagram" href="#"><i class="icon-social-instagram"></i></a>
                </li>
                <li>
                  <a class="instagram" href="#"><i class="icon-social-linkedin"></i></a>
                </li>
                <li>
                  <a class="instagram" href="#"><i class="icon-social-google"></i></a>
                </li>
              </ul>
              <p>© ADAPEC-TO / 2021</p>
            </div>
          </div>
        </div>
      </div>
    </footer>
    <!-- Footer Section End -->

    <!-- Go to Top Link -->
    <a href="#" class="back-to-top">
      <i class="icon-arrow-up"></i>
    </a>

    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="assets/js/jquery-min.js"></script>
    <script src="assets/js/popper.min.js"></script>
    <script src="assets/js/bootstrap.min.js"></script>
    <script src="assets/js/jquery.mixitup.js"></script>
    <script src="assets/js/jquery.counterup.min.js"></script>
    <script src="assets/js/waypoints.min.js"></script>
    <script src="assets/js/wow.js"></script>
    <script src="assets/js/jquery.nav.js"></script>
    <script src="assets/js/jquery.easing.min.js"></script>  
    <script src="assets/js/nivo-lightbox.js"></script>
    <script src="assets/js/jquery.slicknav.js"></script>
    <script src="assets/js/main.js"></script>
    <script src="assets/js/form-validator.min.js"></script>
    <script src="assets/js/contact-form-script.min.js"></script>
    <script src="assets/js/map.js"></script>
      
  </body>
</html>
