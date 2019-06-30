<?php
include('../../../templates/conexion.php');

if(isset($_POST['id'])){

    $id = $_POST['id'];

    $query = "DELETE FROM producto WHERE codigoProducto= $id";

    $resultado = mysqli_query($conexion, $query);

    if(!$resultado){
        die('Consulta ha fallado.');
    }

    echo "Tarea eliminada correctamente";

}


