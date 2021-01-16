<%-- 
    Document   : VistaMenuAdmin
    Created on : 12-nov-2020, 0:48:47
    Author     : andre
--%>

<%@page import="Modelo.Convocatoria"%>
<%@page import="Modelo.Votante"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
        <link rel="stylesheet" href="../css/styles.css">
        <link  rel="icon"   href="../images/logo/SVG/Recurso1.svg" />
        <script type="module" src="https://unpkg.com/ionicons@5.2.3/dist/ionicons/ionicons.esm.js"></script><title>Administrador</title>
    </head>
    <body class="text-center fondo-top">
        <%
            Convocatoria convocatoria = (Convocatoria) session.getAttribute("Convocatoria");
        %>
        <nav class="navbar sticky-top navbar-expand-lg navbar-dark bg-danger">
            <a class="navbar-brand active" href="VistaMenuAdmin.jsp">Administrador <span class="sr-only">(current)</span></a>
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
        <div class="container vh-100 d-flex align-items-center justify-content-center">
            <%String mensajeError = (String) session.getAttribute("MensajeError");
                if (mensajeError != null) {
            %>
            <div class="container">
                <div class="alert alert-danger formulario" role="alert">
                    <%=mensajeError%>
                </div>
            </div>
            <%
                }
                session.setAttribute("MensajeError", null);
            %>
            <%String mensajeExito = (String) session.getAttribute("MensajeExito");
                if (mensajeExito != null) {
            %>
            <div class="container">
                <div class="alert alert-success formulario" role="alert">
                    <%=mensajeExito%>
                </div>
            </div>
            <%
                }
                session.setAttribute("MensajeExito", null);
            %>

            <div class="card shadow-lg border-0 rounded-lg my-5">
                <div class="card-header border-danger text-center bordered">
                    <img class="my-4" src="../images/logo/SVG/Recurso1.svg" alt="" width="100" height="auto">
                </div>
                <div class="card-body mx-5">
                    <div class="starter-template my-5">
                        <h1>Elecciones <%=convocatoria.getTipo()%></h1>
                        <p class="lead">En la provincia de <%=convocatoria.getCircunscripcion()%><br>Estado actual :</p>
                        <p class=" lead text-info"><%=convocatoria.getEstado()%></p>
                    </div>
                </div>
                <div class="card-footer text-center">
                </div>
            </div>
        </div>
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.bundle.min.js" integrity="sha384-LtrjvnR4Twt/qOuYxE721u19sVFLVSA4hf/rRt6PrZTmiPltdZcI7q7PXQBYTKyf" crossorigin="anonymous"></script>
    </body>
</html>
