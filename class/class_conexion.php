<?php

	class Conexion{

		private $usuario="root";
		private $contrasena="";
		private $host="localhost";
		private $baseDatos="db_farmacia";
		private $puerto="3306";
		private $link;

		public function __construct(){
			$this->establecerConexion();			
		}

		public function establecerConexion(){
			$this->link = mysqli_connect($this->host, $this->usuario, $this->contrasena, $this->baseDatos, $this->puerto);

			if (!$this->link){
				echo "No se pudo conectar con mysql";
				exit;
			}
		}

		public function cerrarConexion(){
			mysqli_close($this->link);
		}
		public function ejecutarInstruccion($sql){
			return mysqli_query($this->link, $sql);
		}

		public function obtenerFila($resultado){
			return mysqli_fetch_array($resultado);
		}
		public function liberarResultado($resultado){
			mysqli_free_result($resultado);
		}
		
	}
?>