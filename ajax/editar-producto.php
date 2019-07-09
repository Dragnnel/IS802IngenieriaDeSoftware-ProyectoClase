<?php
include_once('../class/class_conexion.php');

$conexion = new Conexion();

switch ($_GET["accion"]) {
    case '1'://Lista de productos
    $sql = "SELECT * FROM Producto";

    $resultado = $conexion->ejecutarInstruccion($sql);

    $json = array();
    while ($fila= $conexion->obtenerFila($resultado)) { 
    $json[] = array(
        'idProducto' => $fila['idProducto'],
        'nombreProducto' => $fila['nombreProducto'],
        'fechaElaboracion' => $fila['fechaElaboracion'],
        'fechaVencimiento' => $fila['fechaVencimiento'],
        'serie' => $fila['serie'],
        'lote' => $fila['lote'],
        'precioVenta' => $fila['precioVenta'],
        'precioCosto' => $fila['precioCosto'],
        'direccionImagen' => $fila['direccionImagen'],
        'inventario' => $fila['idInventario'],
        'fechaRegistro' => $fila['fechaRegistro']
    );   
    }

    $jsonString = json_encode($json);
    echo $jsonString;

    $conexion->cerrarConexion();
        break;
    case '2':// producto a editar desde el modal
    $idProducto = $_POST['idProducto'];
    $sql = "SELECT * FROM Producto
            WHERE idProducto= $idProducto;";

    $resultado = $conexion->ejecutarInstruccion($sql);

    $json = array();
    while ($fila= $conexion->obtenerFila($resultado)) { 
    $json[] = array(
        'idProducto' => $fila['idProducto'],
        'nombreProducto' => $fila['nombreProducto'],
        'fechaElaboracion' => $fila['fechaElaboracion'],
        'fechaVencimiento' => $fila['fechaVencimiento'],
        'serie' => $fila['serie'],
        'lote' => $fila['lote'],
        'precioVenta' => $fila['precioVenta'],
        'precioCosto' => $fila['precioCosto'],
        'direccionImagen' => $fila['direccionImagen'],
        'inventario' => $fila['idInventario'],
        'fechaRegistro' => $fila['fechaRegistro']
    );   
    }

    $jsonString = json_encode($json);
    echo $jsonString;

    $conexion->cerrarConexion();
        break;
    case '3':// editar producto
        $cadena = "";
        if ($_POST['idProducto']== "" && $_POST['idProducto']== NULL) {
            $cadena = "idProducto, ";
        }
        if ($_POST['txt-fechaElaboracion'] == "" && $_POST['txt-fechaElaboracion'] == NULL) {
            $cadena += "fecha de elaboracion, ";
        }
        if ($_POST['txt-fechaVencimiento'] == "" && $_POST['txt-fechaVencimiento'] == NULL) {
            $cadena += "fecha de vencimiento, ";
        }
        if ($_POST['txt-serie'] == "" && $_POST['txt-serie'] == NULL) {
            $cadena += "serie, ";
        }
        if ($_POST['txt-lote'] == "" && $_POST['txt-lote'] == NULL) {
            $cadena += "lote, ";
        }
        if ($_POST['txt-precioVenta'] == "" && $_POST['txt-precioVenta'] == NULL) {
            $cadena += " precio venta, ";
        }
        if ($_POST['txt-precioCosto'] == "" && $_POST['txt-precioCosto'] == NULL) {
            $cadena += "precio costo, ";
        }
        if ($_POST['txt-inventario'] == "" && $_POST['txt-inventario'] == NULL) {
            $cadena += "inventario, ";
        }
        if ($_POST['txt-imagen'] == "" && $_POST['txt-imagen'] == NULL) {
            $cadena += "direccion de la imagen, ";
        }
        if ($_POST['txt-fechaRegistro'] == "" && $_POST['txt-fechaRegistro'] == NULL) {
            $cadena += "fecha de registro. ";
        }
        if ($cadena <>"") {
            $resultado = "Pendiente llenar los siguientes campos: ". $cadena ;
            echo $resultado;
        }
        else if ($cadena == "") {
            $idProducto = $_POST['idProducto'];
            $nombreProducto = $_POST['txt-nombre'];
            $fechaElaboracion = $_POST['txt-fechaElaboracion'];
            $fechaVencimiento = $_POST['txt-fechaVencimiento'];
            $serie = $_POST['txt-serie'];
            $lote = $_POST['txt-lote'];
            $precioVenta = $_POST['txt-precioVenta'];
            $precioCosto = $_POST['txt-precioCosto'];
            $inventario = $_POST['txt-inventario'];
            $imagen = $_POST['txt-imagen'];
            $fechaRegistro = $_POST['txt-fechaRegistro'];
            
            /*echo "id". $idProducto.  
                 "<br>nombre". $nombreProducto . 
                 "<br>fecha elaboracion".$fechaElaboracion . 
                 "<br>fecha vencimiento". $fechaVencimiento . 
                 "<br>Serie". $serie . 
                 "<br>Lote". $lote . 
                 "<br>Precio ventaq" . $precioVenta .
                 "<br>Precio Costo". $precioCosto .
                 "<br>Inventario" . $inventario . 
                 "<br>Imagen" . $imagen . 
                 "<br>Fecha registro". $fechaRegistro;*/
            

            $sql = "UPDATE producto 
                    SET nombreProducto='$nombreProducto',
                        fechaElaboracion='$fechaElaboracion',
                        fechaVencimiento='$fechaVencimiento',
                        serie='$serie',
                        lote='$lote',
                        precioVenta='$precioVenta',
                        precioCosto='$precioCosto',
                        direccionImagen='$imagen',
                        idInventario='$inventario',
                        fechaRegistro='$fechaRegistro' 
                    WHERE idProducto = '$idProducto'";

            $conexion->ejecutarInstruccion($sql);

            echo 'true';
            $conexion->cerrarConexion();
        }
        
    break;
    default:
        # code...
        break;
}
?>