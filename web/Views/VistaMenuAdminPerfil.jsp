<%-- 
    Document   : VistaMenuAdminPerfil
    Created on : 12-nov-2020, 1:14:38
    Author     : andre
--%>

<%@page import="Modelo.Convocatoria"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
        <link rel="stylesheet" href="../css/styles.css">
        <link  rel="icon"   href="../images/logo/SVG/Recurso1.svg" />
        <title>Votante</title>
    </head>
    <body class="">
        <%
            Convocatoria convocatoria = (Convocatoria) session.getAttribute("Convocatoria");
        %>
        <nav class="navbar sticky-top navbar-expand-lg navbar-dark bg-danger">
            <a class="navbar-brand" href="VistaMenuAdmin.jsp">Administrador <span class="sr-only">(current)</span></a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
                <ul class="navbar-nav">
                    <li class="nav-item">
                        <a class="nav-link" href="VistaMenuAdminPerfil.jsp">Perfil</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="../ControladorAdministradorListaVotantes">Listar Votantes<span class="sr-only">(current)</span></a>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            Estado Escrutinio
                        </a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                            <%
                                if (convocatoria.getEstado().equalsIgnoreCase("Cerrado")) {
                            %>
                            <a class="dropdown-item" href="../ControladorEscrutinio?Escrutinio=Abrir">Abrir</a>
                            <a class="dropdown-item" href="../ControladorEscrutinio?Escrutinio=Finalizar">Finalizar</a>
                            <%
                                }
                                if (convocatoria.getEstado().equalsIgnoreCase("Abierto")) {
                            %>
                            <a class="dropdown-item" href="../ControladorEscrutinio?Escrutinio=Finalizar">Finalizar</a>
                            <%
                                }
                            %>
                        </div>
                    </li>
                    <%
                        if (convocatoria.getEstado().equalsIgnoreCase("Finalizado")) {
                    %>
                    <li class="nav-item">
                        <a class="nav-link" href="../ControladorAdministradorListarResultados">Listar Candidatos<span class="sr-only">(current)</span></a>
                    </li>
                    <%
                        }
                    %>
                </ul>
            </div>
            <form class="form-inline">
                <a class="btn btn-outline-light my-2 my-sm-0" href="../ControladorCerrarSesion">Cerrar Sesión</a>
            </form>
        </nav>

        <section id="featured-services" class="featured-services mt-5">
            <div class="container mt-5" data-aos="fade-up">
                <div class="row my-5">
                    <div class="col-md-6 col-lg-6 d-flex align-items-stretch mb-5 mb-lg-3">
                        <div class="icon-box" data-aos="fade-up" data-aos-delay="200">
                            <div class="icon"><i class="bx bx-file"><ion-icon src="../images/partidos/person-outline.svg"></ion-icon></i></div>
                            <h4 class="title"><a href="VistaFormularioModificarAdministrador.jsp">Visualizar o Modificar</a></h4>
                            <p class="description">Aquí podrá accerder y ver su perfil y si lo prefiere, también puede modificarlo.</p>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <script src="https://unpkg.com/ionicons@5.2.3/dist/ionicons.js"></script>
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.bundle.min.js" integrity="sha384-LtrjvnR4Twt/qOuYxE721u19sVFLVSA4hf/rRt6PrZTmiPltdZcI7q7PXQBYTKyf" crossorigin="anonymous"></script>
    </body>
</html>
