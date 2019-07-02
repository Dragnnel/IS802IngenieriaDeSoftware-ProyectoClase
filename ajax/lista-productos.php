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
        /*En la primera posicion del arreglo json guardamos un atributo llamado 'categoriaProducto' 
        y le damos el valor que se encuentra en el arreglo $row con etiqueta 'descripcion'.  
        NOTA: 'descripcion' hace referencia a un campo de la base de datos */
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
//Con la funcion json_encode() convierto el arreglo $json a formato string pero con la sintaxis de json
$jsonString = json_encode($json);

echo $jsonString;
