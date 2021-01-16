<%-- 
    Document   : VistaMensajesError
    Created on : 08-nov-2020, 16:34:09
    Author     : andre
--%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
        <link rel="stylesheet" href="../css/styles.css">
        <link  rel="icon"   href="../images/logo/SVG/Recurso1.svg" />
        <title>e-Vote</title>

    </head>
    <body>
        <div class="container my-5">
            <%
                String mensaje = request.getParameter("Mensaje");
                if (mensaje != null) {
                    if (mensaje.equalsIgnoreCase("El voto no se ha realizado correctamente. Vuelva a intentarlo mas tarde.")) {
            %>
            <div class="alert alert-danger formulario" role="alert">
                <%=mensaje%>
            </div>
            <a class="btn btn-outline-danger btn-rounded my-4 waves-effect z-depth-0" href="VistaMenuVotante.jsp" >Volver a Inicio</a>
            <%
                }
                if (mensaje.equalsIgnoreCase("El campo NIF no se corresponde con un NIF. Vuelva a intentarlo.")) {
            %>
            <div class="alert alert-danger formulario" role="alert">
                <%=mensaje%>
            </div>
            <a class="btn btn-outline-danger btn-rounded my-4 waves-effect z-depth-0" href="VistaFormularioRegistro.jsp" >Volver a Inicio</a>
            <%
                }
                if (mensaje.equalsIgnoreCase("El voto se ha realizado correctamente. Gracias.")) {
            %>
            <div class="alert alert-success formulario" role="alert">
                <%=mensaje%>
            </div>
            <a class="btn btn-outline-success btn-rounded my-4 waves-effect z-depth-0" href="VistaMenuVotante.jsp" >Volver a Inicio</a>
            <%
            } else {
            %>
            <div class="alert alert-danger formulario" role="alert">
                <%=mensaje%>
            </div>
            <a class="btn btn-outline-danger btn-rounded my-4 waves-effect z-depth-0" href="../index.jsp" >Volver a Inicio</a>
            <%
                    }
                }
            %>
        </div>
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.bundle.min.js" integrity="sha384-LtrjvnR4Twt/qOuYxE721u19sVFLVSA4hf/rRt6PrZTmiPltdZcI7q7PXQBYTKyf" crossorigin="anonymous"></script>
    </body>
</html>
