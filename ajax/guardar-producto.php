<?php

	include("../class/class-conexion.php");
    $conexion = new Conexion();
    
    /*
        INSERT INTO producto(codigoProducto, nombre, precioCosto, precioVenta, fechaElaboracion, fechaVencimiento, fechaRegistro, lote, imagen, codigoCategoria) VALUES ([value-1],[value-2],[value-3],[value-4],[value-5],[value-6],[value-7],[value-8],[value-9],[value-10]);
    */

	$sql =  sprintf("INSERT INTO tbl_usuarios(codigo_tipo_de_usuario, nombre, apellido, email, password, url_image_perfil) VALUES (%s,'%s','%s','%s',sha1('%s'),'img/profile/foto_perfil_predeterminado.png')",
        3,
        $conexion->antiInyeccion($_POST["nombre"]),
        $conexion->antiInyeccion($_POST["apellido"]),
        $conexion->antiInyeccion($_POST["email"]),
        $conexion->antiInyeccion($_POST["password"])
        );
           

    $resultado = $conexion->ejecutarConsulta($sql);
    if ($resultado){
        //Se agrego con exito

        $sql = sprintf("SELECT codigo_usuario, nombre, apellido, email, password, url_image_perfil FROM tbl_usuarios WHERE codigo_usuario = %s",
		$conexion->ultimoId());


        $resultadoT = $conexion->ejecutarConsulta($sql);
        $fila = $conexion->obtenerFila($resultadoT);
        $fila["codigo_resultado"] = 0;
        $fila["mensaje_resultado"] = "Usuario registrado con éxito";
        echo json_encode($fila);

    }else{
        //Fallo
        $respuesta["codigo_resultado"] = 1;
        $respuesta["mensaje_resultado"] = "No se pudo registrar el usuario";
        $respuesta["sql"] = $sql;
        echo json_encode($respuesta);
    }

    $conexion->cerrarConexion();

?>