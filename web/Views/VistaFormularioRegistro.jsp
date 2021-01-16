<%-- 
    Document   : VistaFormularioRegistro
    Created on : 04-nov-2020, 9:23:58
    Author     : andre
--%>

<!DOCTYPE html>
<html lang="es">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
        <link rel="stylesheet" href="../css/styles.css">
        <link  rel="icon"   href="../images/logo/SVG/Recurso1.svg" />
        <title>e-Vote</title>
    </head>
    <body class="fondo">
        <div class="container d-flex align-items-center justify-content-center">
            <div class="card shadow-lg border-0 rounded-lg my-5">
                <div class="card-header bg-info text-light">
                    <h3 class="text-center my-4">Registro</h3>
                </div>
                <div class="card-body shadow-lg p-5 overflow-auto">
                    <form action="../ControladorRegistro">
                        <div class="form-row">
                            <h4>Datos Personales</h4>
                        </div>
                        <div class="form-row">
                            <div class="form-group col-md-6">
                                <label for="nif">NIF</label>
                                <input type="text" class="form-control" name="nif" id="nif" maxlength="9" minlength="9" placeholder="NIF">
                            </div>
                            <div class="form-group col-md-6">
                                <label for="contrasena">Contraseña</label>
                                <input type="password" class="form-control" id="contrasena" name="contrasena" placeholder="" required>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="nombre">Nombre</label>
                            <input type="text" class="form-control" name="nombre" id="nombre" placeholder="Nombre" required>
                        </div>
                        <div class="form-group">
                            <label for="apellidos">Apellidos</label>
                            <input type="text" class="form-control" name="apellidos" id="apellidos" placeholder="Apellidos" required>
                        </div>
                        <div class="form-row">
                            <div class="form-group col-md-6">
                                <label for="email">Correo Electrónico</label>
                                <div class="input-group">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text" id="basic-addon1">@</span>
                                    </div>
                                    <input type="text" class="form-control" id="email" name="email" placeholder="e-mail" aria-label="Username" aria-describedby="basic-addon1">
                                </div>
                            </div>
                            <div class="form-group col-md-6">
                                <label for="telefono">Teléfono</label>
                                <div class="input-group">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text" id="basic-addon1">+34</span>
                                    </div>
                                    <input type="text" class="form-control" id="telefono" name="telefono" placeholder="xxxxxxxxx" minlength="9" maxlength="9" aria-label="Username" aria-describedby="basic-addon1">
                                </div>
                            </div> 
                        </div>
                        <div class="form-row">
                            <div class="form-group col-md-6">
                                <label for="fechanac">Fecha Nacimiento</label>
                                <input type="date" class="form-control" name="fechanac" id="fechanac" placeholder="Apellidos" required>
                            </div>
                            <div class="form-group col-md-6">
                                <label for="sexo">Sexo</label>
                                <select id="sexo" name="sexo" class="form-control">
                                    <option selected>Masculino</option>
                                    <option>Femenino</option>
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
                                    <option selected>Calle</option>
                                    <option>Avenida</option>
                                    <option>Carretera</option>
                                    <option>Plaza</option>
                                </select>
                            </div>
                            <div class="form-group col-md-8">
                                <label for="nombreCalle">Nombre de la vía</label>
                                <input type="text" class="form-control" id="nombreCalle" name="nombreCalle" placeholder="Nombre" required>
                            </div>
                            <div class="form-group col-md-2">
                                <label for="numero">Numero</label>
                                <input type="text" class="form-control" id="numero" name="numero" placeholder="Numero" required>
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="form-group col-md-3">
                                <label for="portal">Portal</label>
                                <input type="text" class="form-control" id="portal" name="portal" placeholder="Portal">
                            </div>
                            <div class="form-group col-md-3">
                                <label for="piso">Piso</label>
                                <input type="text" class="form-control" id="piso" name="piso" placeholder="Piso">
                            </div>
                            <div class="form-group col-md-3">
                                <label for="puerta">Puerta</label>
                                <input type="text" class="form-control" id="puerta" name="puerta" placeholder="Puerta">
                            </div>
                            <div class="form-group col-md-3">
                                <label for="cp">C.P.</label>
                                <input type="text" class="form-control" id="cp" minlength="5" maxlength="5" name="cp" placeholder="C.P." required>
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="form-group col-md-6">
                                <label for="localidad">Localidad</label>
                                <input type="text" class="form-control" id="localidad" name="localidad" placeholder="Localidad" required>
                            </div>
                            <div class="form-group col-md-6">
                                <label for="provincia">Provincia</label>
                                <input type="tel" class="form-control" id="provincia" name="provincia" placeholder="Provincia" required>
                            </div>
                        </div>
                        <a class="btn btn-primary" href="../index.jsp" role="button">Atras</a>
                        <button type="submit" class="btn btn-primary float-right">Registrarme</button>
                    </form>
                </div>
            </div>
        </div>
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.bundle.min.js" integrity="sha384-LtrjvnR4Twt/qOuYxE721u19sVFLVSA4hf/rRt6PrZTmiPltdZcI7q7PXQBYTKyf" crossorigin="anonymous"></script>
    </body>
</html>
