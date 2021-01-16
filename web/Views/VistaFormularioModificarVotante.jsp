<%-- 
    Document   : VistaFormularioModificar
    Created on : 06-nov-2020, 15:39:00
    Author     : andre
--%>

<%@page import="Modelo.Direccion"%>
<%@page import="Modelo.Votante"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
        <link  rel="icon"   href="../images/logo/SVG/Recurso1.svg"/>
        <title>Votante</title>
    </head>
    <body class="bg-dark">
        <%
            Votante votante = (Votante) session.getAttribute("Persona");
            Direccion direccion = (Direccion) session.getAttribute("Direccion");
        %>
        <div class="container vh-100 d-flex align-items-center justify-content-center">
            <div class="card p-5 overflow-auto">
                <form action="../ControladorModificadorVotante">
                    <div class="form-row">
                        <h4>Datos Personales</h4>
                    </div>
                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <label for="nif">NIF</label>
                            <input type="text" class="form-control" name="nif" id="nif" maxlength="9" minlength="9" readonly value="<%=votante.getDni()%>">
                        </div>
                        <div class="form-group col-md-6">
                            <label for="contrasena">Contraseña</label>
                            <input type="password" class="form-control" id="contrasena" name="contrasena" required value="<%=votante.getPassword()%>">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="nombre">Nombre</label>
                        <input type="text" class="form-control" name="nombre" id="nombre" required value="<%=votante.getNombre()%>">
                    </div>
                    <div class="form-group">
                        <label for="apellidos">Apellidos</label>
                        <input type="text" class="form-control" name="apellidos" id="apellidos" required value="<%=votante.getApellidos()%>">
                    </div>
                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <label for="email">Correo Electrónico</label>
                            <div class="input-group">
                                <div class="input-group-prepend">
                                    <span class="input-group-text" id="basic-addon1">@</span>
                                </div>
                                <input type="text" class="form-control" id="email" name="email" aria-label="Username" aria-describedby="basic-addon1"value="<%=votante.getEmail()%>">
                            </div>
                        </div>
                        <div class="form-group col-md-6">
                            <label for="telefono">Teléfono</label>
                            <div class="input-group">
                                <div class="input-group-prepend">
                                    <span class="input-group-text" id="basic-addon1">+34</span>
                                </div>
                                <input type="text" class="form-control" id="telefono" name="telefono" minlength="9" maxlength="9" aria-label="Username" aria-describedby="basic-addon1" value="<%=votante.getTelefono().substring(3, 12)%>">
                            </div>
                        </div> 
                    </div>
                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <label for="fechanac">Fecha Nacimiento</label>
                            <input type="date" class="form-control" name="fechanac" id="fechanac" placeholder="" required value="<%=votante.getFecha_nac()%>">
                        </div>
                        <div class="form-group col-md-6">
                            <label for="sexo">Sexo</label>
                            <select id="sexo" name="sexo" class="form-control">
                                <%if (votante.getSexo() == 'M') {%>
                                <option selected>Masculino</option>
                                <option>Femenino</option>
                                <%} else {%>
                                <option>Masculino</option>
                                <option selected="">Femenino</option>
                                <%}%>
                            </select>
                        </div>
                    </div>
                    <div class="form-row py-3">
                        <h4>Dirección</h4>
                    </div>
                    <div class="form-row">
                        <div class="form-group col-md-2">
                            <label for="tipoCalle">Tipo</label>
                            <select id="tipoCalle" name="tipoCalle" class="form-control">
                                <%if (direccion.getTipo().equals("Calle")) {%>
                                <option selected>Calle</option>
                                <option>Avenida</option>
                                <option>Carretera</option>
                                <option>Plaza</option>
                                <%} else if (direccion.getTipo().equals("Avenida")) {%>
                                <option>Calle</option>
                                <option selected>Avenida</option>
                                <option>Carretera</option>
                                <option>Plaza</option>
                                <%} else if (direccion.getTipo().equals("Carretera")) {%>
                                <option>Calle</option>
                                <option>Avenida</option>
                                <option selected>Carretera</option>
                                <option>Plaza</option>
                                <%} else {%>
                                <option>Calle</option>
                                <option>Avenida</option>
                                <option>Carretera</option>
                                <option selected>Plaza</option>
                                <%}%>
                            </select>
                        </div>
                        <div class="form-group col-md-8">
                            <label for="nombreCalle">Nombre de la vía</label>
                            <input type="text" class="form-control" id="nombreCalle" name="nombreCalle" required value="<%=direccion.getNombre()%>">
                        </div>
                        <div class="form-group col-md-2">
                            <label for="numero">Numero</label>
                            <input type="text" class="form-control" id="numero" name="numero" required value="<%=direccion.getNumero()%>">
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="form-group col-md-3">
                            <label for="portal">Portal</label>
                            <input type="text" class="form-control" id="portal" name="portal" value="<%=direccion.getPortal()%>">
                        </div>
                        <div class="form-group col-md-3">
                            <label for="piso">Piso</label>
                            <input type="text" class="form-control" id="piso" name="piso" value="<%=direccion.getPiso()%>">
                        </div>
                        <div class="form-group col-md-3">
                            <label for="puerta">Puerta</label>
                            <input type="text" class="form-control" id="puerta" name="puerta" value="<%=direccion.getPuerta()%>">
                        </div>
                        <div class="form-group col-md-3">
                            <label for="cp">C.P.</label>
                            <input type="text" class="form-control" id="cp" minlength="5" maxlength="5" name="cp" required value="<%=direccion.getCp()%>">
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <label for="localidad">Localidad</label>
                            <input type="text" class="form-control" id="localidad" name="localidad" required value="<%=direccion.getLocalidad()%>">
                        </div>
                        <div class="form-group col-md-6">
                            <label for="provincia">Provincia</label>
                            <input type="tel" class="form-control" id="provincia" name="provincia" required value="<%=direccion.getProvincia()%>">
                        </div>
                    </div>
                    <a class="btn btn-danger" href="VistaMenuVotante.jsp" role="button">Cancelar</a>
                    <button type="submit" class="btn btn-success float-right">Realizar cambios</button>
                </form>
            </div>
        </div>
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.bundle.min.js" integrity="sha384-LtrjvnR4Twt/qOuYxE721u19sVFLVSA4hf/rRt6PrZTmiPltdZcI7q7PXQBYTKyf" crossorigin="anonymous"></script>
    </body>
</html>
