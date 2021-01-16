<%-- 
    Document   : VistaMenuAdministrador
    Created on : 07-nov-2020, 18:50:29
    Author     : andre
--%>

<%@page import="Modelo.Votante"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Modelo.Partido"%>
<%@page import="Modelo.Convocatoria"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
        <link rel="stylesheet" href="../css/styles.css">
        <link  rel="icon"   href="../images/logo/SVG/Recurso1.svg"/>
        <title>Votante</title>
    </head>
    <body>
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
        <section id="featured-services" class="featured-services mt-5">
            <div class="container-fluid px-5 mt-5" data-aos="fade-up">
                <form class="row justify-content-center my-5" action="../ControladorRegistroVoto">
                    <%
                        ArrayList<Partido> partidos = (ArrayList) session.getAttribute("Partidos");
                        for (Partido aux : partidos) {
                    %>
                    <div class="custom-control custom-radio col">
                        <input type="radio" id="cajaPartido<%=aux.getSiglas()%>" name="cajaRadio" class="custom-control-input" value="<%=aux.getSiglas()%>">
                        <label class="custom-control-label d-block" for="cajaPartido<%=aux.getSiglas()%>">
                            <div class="d-block mb-5 mb-lg-3">
                                <div class="icon-box" data-aos="fade-up" data-aos-delay="200">
                                    <img src="<%=aux.getLogo()%>" alt="<%=aux.getSiglas()%>" width="100%">
                                    <div class="icon"><i class="bx bx-file"></i></div>
                                    <h4 class="title"><%=aux.getNombre()%></h4>
                                    <p class="description"><%=aux.getEslogan()%></p>
                                </div>
                            </div>
                        </label>
                    </div>
                    <%
                        }
                    %>
                    <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                        <div class="modal-dialog" role="document">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="exampleModalLabel">Atención</h5>
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                                <div class="modal-body">
                                    ¿Está apunto de enviar su voto, está seguro que su voto está en la opción deseada? Una vez se envíe el voto, ya no se podrá modificar.
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
                                    <button class="btn btn-info" type="submit">Enviar</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
                <div class="container pb-5 d-flex justify-content-end">
                    <a class="btn btn-info btn-lg" href="" data-toggle="modal" data-target="#exampleModal">
                        Enviar
                    </a>

                </div>
            </div>
        </section>
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.bundle.min.js" integrity="sha384-LtrjvnR4Twt/qOuYxE721u19sVFLVSA4hf/rRt6PrZTmiPltdZcI7q7PXQBYTKyf" crossorigin="anonymous"></script>
    </body>
</html>
