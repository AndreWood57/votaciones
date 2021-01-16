<%-- 
    Document   : index
    Created on : 04-nov-2020, 0:45:07
    Author     : andre
--%>

<!DOCTYPE html>
<html lang="es">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
        <link rel="stylesheet" href="css/styles.css">
        <link  rel="icon"   href="images/logo/SVG/Recurso1.svg"/>
        <title>e-vote</title>
    </head>
    <body class="fondo">
        <div class="container vh-100 d-flex align-items-center justify-content-center">
            <div class="card shadow-lg border-0 rounded-lg my-5">
                <div class="card-header border-info text-center bordered">
                    <img class="my-4" src="images/logo/SVG/Recurso1.svg" alt="" width="100" height="auto">
                    <h1 class="h3 mb-3">e-Vote</h1>
                    <p>Gracias por confiar en nuestra plataforma online para realizar sus votos de forma segura.</p>
                </div>
                <div class="card-body">
                    <form class="form-signin" action="ControladorLogin">
                        <div class="container">
                            <%String mensajeError = (String) session.getAttribute("MensajeError");
                                if (mensajeError != null) {
                            %>
                            <div class="alert alert-danger formulario" role="alert">
                                <%=mensajeError%>
                            </div>
                            <%
                                }
                                session.setAttribute("MensajeError", null);
                            %>
                        </div>
                        <div class="container">
                            <%String mensajeExito = (String) session.getAttribute("MensajeExito");
                                if (mensajeExito != null) {
                            %>
                            <div class="alert alert-success formulario" role="alert">
                                <%=mensajeExito%>
                            </div>
                            <%
                                }
                                session.setAttribute("MensajeExito", null);
                            %>
                        </div>
                        <div class="form-label-group py-3">
                            <input type="text" id="nif" name="nif" class="form-control" placeholder="NIF" required autofocus>
                            <label for="nif">NIF</label>
                        </div>

                        <div class="form-label-group py-3">
                            <input type="password" id="inputPassword" name="password" class="form-control" placeholder="Contraseña" required>
                            <label for="inputPassword">Contraseña</label>
                        </div>
                        <button class="btn btn-lg btn-info btn-block" type="submit">Entrar</button>
                    </form>
                </div>
                <div class="card-footer text-center">
                    <div class="small">Si aún no estás registrado. <a class="text-info" href="ControladorEnlaceRegistro">Registrate!</a></div>
                </div>
            </div>
        </div>
    </body>
</html>
