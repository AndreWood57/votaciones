<%-- 
    Document   : VistaMenuVotanteInicio
    Created on : 11-nov-2020, 12:37:39
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
        <script type="module" src="https://unpkg.com/ionicons@5.2.3/dist/ionicons/ionicons.esm.js"></script>
        <title>Votante</title>
    </head>
    <body class="text-center fondo-top">
        <%
            Convocatoria convocatoria = (Convocatoria) session.getAttribute("Convocatoria");
            Votante votante = (Votante) session.getAttribute("Persona");
        %>
        <nav class="navbar sticky-top navbar-expand-lg navbar-light bg-info">
            <a class="navbar-brand" href="VistaMenuVotante.jsp">Votante</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
                <div class="navbar-nav">
                    <%
                        if (convocatoria.getEstado().equals("Cerrado")) {
                    %>
                    <a class="nav-item nav-link" href="VistaMenuVotantePerfil.jsp">Perfil <span class="sr-only">(current)</span></a>
                    <%
                        }
                    %>
                    <%
                        if (convocatoria.getEstado().equals("Abierto") && votante.getVotado() == 'N') {
                    %>
                    <a class="nav-item nav-link" href="../ControladorVistaPartidos" >Realizar voto</a>
                    <%
                        }
                    %>
                    <%
                        if (convocatoria.getEstado().equals("Finalizado")) {
                    %>
                    <a class="nav-item nav-link" href="../ControladorVotanteListarResultados" >Ver Resultados</a>
                    <%
                        }
                    %>
                </div>
            </div>
            <form class="form-inline">
                <a class="btn btn-outline-light my-2 my-sm-0" href="../ControladorCerrarSesion">Cerrar Sesión</a>
            </form>
        </nav>
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
        <div class="container vh-100 d-flex align-items-center justify-content-center">
            <div class="card shadow-lg border-0 rounded-lg my-5">
                <div class="card-header border-info text-center bordered">
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
