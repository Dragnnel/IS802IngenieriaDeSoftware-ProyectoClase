<?php

include('../class/class-conexion.php');

$search = $_POST['search'];

if(!empty($search)){

    $query = "SELECT * FROM producto INNER JOIN categoriaProducto 
                        ON producto.codigoCategoria = categoriaProducto.codigoCategoria
                        WHERE nombre LIKE '$search%'";

    $resultado = mysqli_query($conexion, $query);

    if(!$resultado){
        die ('Error en la consulta '.mysqli_error($conexion));
    }

    $json = array();

    //mysql_fetch_array() convierte la variable $resultado en un arreglo, luego lo guarda en la variable $row
    //luego se recorre usando el while
    while($row = mysqli_fetch_array($resultado)){
        $json[] = array(
            //en la primera posicion del arreglo json guardamos un atributo llamado 'categoriaProducto' 
            //y le damos el valor que se encuentra en el arreglo $row con etiqueta descripcion  
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
    $jsonstring = json_encode($json);
    echo $jsonstring;
}

?>