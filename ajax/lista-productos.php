<?php

include('../class/class-conexion.php');

$query = "SELECT * FROM producto INNER JOIN categoriaProducto 
                        ON producto.codigoCategoria = categoriaProducto.codigoCategoria";
$resultado = mysqli_query($conexion, $query);

if (!$resultado) {
    die('Fallo la consulta' . mysqli_error($conexion));
}

$json = array();
while ($row = mysqli_fetch_array($resultado)) {
    $json[] = array(
        'categoriaProducto' => $row['descripcion'],
        'codigoProducto' => $row['codigoProducto'],
        'fechaElaboracion' => $row['fechaElaboracion'],
        'fechaRegistro' => $row['fechaRegistro'],
        'fechaVencimiento' => $row['fechaVencimiento'],
        'lote' => $row['lote'],
        'nombre' => $row['nombre'],
        'precioCosto' => $row['precioCosto'],
        'precioVenta' => $row['precioVenta'],
        'imagen' => $row['imagen']
    );
}

$jsonString = json_encode($json);

echo $jsonString;
