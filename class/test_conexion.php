<?php	
	
	include_once("class_conexion.php");
	$conexion = new Conexion();	

    $resultado = $conexion->ejecutarInstruccion(
        'SELECT idProducto, nombreProducto FROM producto'
        );
	echo '<table border="1px">';
	while($fila = $conexion->obtenerFila($resultado)){
        echo "<tr>";
		echo "<td>". $fila["idProducto"]. "</td>";
		echo "<td>". $fila["nombreProducto"]. "</td>";  
		echo "</tr>";
	}
    echo "</table>";
    
	$conexion->cerrarConexion();

?>