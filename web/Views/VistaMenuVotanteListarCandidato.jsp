<%-- 
    Document   : VistaMenuVotanteListarCandidato
    Created on : 19-nov-2020, 2:01:53
    Author     : andre
--%>

<%@page import="Modelo.Convocatoria"%>
<%@page import="Modelo.Votante"%>
<%@page import="Modelo.Partido"%>
<%@page import="Modelo.Candidato"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Modelo.PersonaDireccion"%>
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
        <div class="container-fluid">
            <div class="row">
                <div class="col">
                    <table class="table table-striped table-hover my-4">
                        <thead>
                            <tr>
                                <th scope="col">Nombre</th>
                                <th scope="col">Apellidos</th>
                                <th scope="col">Numero Lista</th>
                                <th scope="col">Partido</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                Candidato candidato = null;
                                Partido partido = null;
                                ArrayList<Candidato> lista = (ArrayList<Candidato>) session.getAttribute("CandidatosSeleccionados");
                                ArrayList<Partido> listaP = (ArrayList<Partido>) session.getAttribute("Partidos");
                                for (int i = 0; i < lista.size(); i++) {
                                    candidato = lista.get(i);
                            %>
                            <tr>
                                <td><%=candidato.getNombre()%></td>
                                <td><%=candidato.getApellido()%></td>
                                <td><%=candidato.getnLista()%></td>
                                <%
                                    for (int j = 0; j < listaP.size(); j++) {
                                        if (listaP.get(j).getSiglas().equals(lista.get(i).getPartido())) {

                                %>
                                <td><img src="<%=listaP.get(j).getLogo()%>" alt="Pp" height="100px" width="auto"></td>
                                    <%
                                            }
                                        }
                                    %>
                            </tr>
                            <%
                                }
                            %>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.bundle.min.js" integrity="sha384-LtrjvnR4Twt/qOuYxE721u19sVFLVSA4hf/rRt6PrZTmiPltdZcI7q7PXQBYTKyf" crossorigin="anonymous"></script>
    </body>
</html>
