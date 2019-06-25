<!DOCTYPE html>
<html lang="es">
  
  <!-- Comienzo del encabezado lo mas general de sitio web -->
  <head>

    <!-- Indicar que se utilizara caracteres especiales en la pagina-->
    <meta charset="utf-8">

    <!-- Indicar que nuestro sitio web esta diseñado para ser visto desde diferentes tamaños de pantalla--> 
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">

    <!-- Descripcion del proyecto y nombre de los autores -->
    <meta name="description" content="Proyecto de Ingenieria de Software IS802-2019 donde se creara un Sistema Web de una Farmacia con Gestion de Sistema de Puntos.">
    <meta name="author" content="  20151001598 Luis Estrada, 
                                   20131004866 Jheral Blanco, 
                                   20101600009 Bayrón Ayala,
                                   20131015994 Nicole Ortiz, 
                                   20141010053 Angie Argueta,
                                   20121012100 Evert Gonzalez">

    <!-- Icono o favicon de el sitio web y nombre de la pagina -->
    <link rel="icon" href="img/logo.png">
    <title>Inicio de Sección ~ Farmacia IS802</title>

    <!-- Importar las librerias de bootstrap -->
        <!-- Bootstrap 4.3.1 -->
        <link href="css/bootstrap.min.css" rel="stylesheet">
        
    <!--Posterior uso JS, Popper.js y jQuery -->
        <script src="js/bootstrap.js"></script>
        <script src="js/jquery-3.3.1.js"></script>

    <!-- Font Awesome -->
    <link rel="stylesheet" href="css/font-awesome.css">
    <!-- Theme style -->
    <link rel="stylesheet" href="css/AdminLTE.min.css">
    <!-- iCheck -->
    <link rel="stylesheet" href="blue.css">
    <!-- iCheck -->
    <script src="js/icheck.min.js"></script>

  </head>
  <body class="hold-transition login-page">
    <div class="login-box">
      <div class="login-logo">
        <a href="#"><b>Farmacia IS802</b></a>
      </div><!-- /.login-logo -->
      <div class="login-box-body">
        <p class="login-box-msg">Ingrese sus datos de Acceso</p>
        <form action="#" method="post">
          <div class="form-group has-feedback">
            <input type="email" class="form-control" placeholder="Email">
            <span class="glyphicon glyphicon-envelope form-control-feedback"></span>
          </div>
          <div class="form-group has-feedback">
            <input type="password" class="form-control" placeholder="Password">
            <span class="glyphicon glyphicon-lock form-control-feedback"></span>
          </div>
          <div class="row">
            <div class="col-xs-8">
              <div class="checkbox icheck">
                <label>
                  <input type="checkbox"> Recordar 
                </label>
              </div>
            </div><!-- /.col -->
            <hr>
            <div class="col-xs-4">
              <button type="submit" class="btn btn-primary btn-block btn-flat"><a  class="btn " href="pages/inicio.php"> Iniciar Sesión </a></button>
            </div><!-- /.col -->
          </div>
        </form>

        
        <a href="#">Olvidé mi password</a><br>
        

      </div><!-- /.login-box-body -->
    </div><!-- /.login-box -->


    <script>
      $(function () {
        $('input').iCheck({
          checkboxClass: 'icheckbox_square-blue',
          radioClass: 'iradio_square-blue',
          increaseArea: '20%' // optional
        });
      });
    </script>
  </body>
</html>
