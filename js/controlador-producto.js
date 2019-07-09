$(function () {

    obtenerProductos(); 
  
    //fUNCION PARA MOSTRAR LOS PRODUCTOS EXISTENTES
    function obtenerProductos() {
        //console.log("probando el JS");

        $.ajax({ 
            url:"../ajax/editar-producto.php?accion=1",
            method: 'POST',
			success:function(resultado){
                //$("#div_respuesta").html(resultado);
                let productos = JSON.parse(resultado);
                let plantilla = '';
                productos.forEach(producto => {
                plantilla += `  <tr id-producto = "${producto.idProducto}">
                                    <td>${producto.idProducto}</td>
                                    <td>${producto.nombreProducto}</td>
                                    <td>${producto.fechaElaboracion}</td>
                                    <td>${producto.fechaVencimiento}</td>
                                    <td>${producto.serie}</td>
                                    <td>${producto.lote}</td>
                                    <td>${producto.precioVenta}</td>
                                    <td>${producto.precioCosto}</td>
                                    <td>${producto.direccionImagen}</td>
                                    <td>${producto.inventario}</td>
                                    <td>${producto.fechaRegistro}</td>
                                    <td>
                                    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal" data-whatever="@getbootstrap" onclick="llenarProducto(${producto.idProducto});">Editar</button>
                                    <button class="eliminar-producto btn btn-danger">Eliminar</button>
                                    </td>
                                </tr>`
                });

                $('#tbodyProductos').html(plantilla);
            }
            
        });//ajax
    }

    //Llenar producto que editara desde el modal
    llenarProducto = function(idProducto){
        document.getElementById("div-error").style.display = 'none';
        document.getElementById("div-success").style.display = 'none';

        window.idProducto = idProducto;
        let parametros= "idProducto= " + idProducto;
        $.ajax({
            url:"../ajax/editar-producto.php?accion=2",
            method: 'POST',
            data: parametros,
            success:function(resultado){
                let productos = JSON.parse(resultado);
                productos.forEach(producto =>{
                    $("#txt-nombre").val(producto.nombreProducto);
                    $("#txt-fechaElaboracion").val(producto.fechaElaboracion);
                    $("#txt-fechaVencimiento").val(producto.fechaVencimiento);
                    $("#txt-serie").val(producto.serie);
                    $("#txt-lote").val(producto.lote);
                    $("#txt-precioVenta").val(producto.precioVenta);
                    $("#txt-precioCosto").val(producto.precioCosto);
                    $("#txt-inventario").val(producto.inventario);
                    $("#txt-imagen").val(producto.direccionImagen);
                    $("#txt-fechaRegistro").val(producto.fechaRegistro);
                });/*
                */

            }
        });//ajax
    }
    

    //EditarProducto en el modal
    editarProducto = function(){
        let idProducto= window.idProducto;
        
        let parametros = "txt-nombre=" + $("#txt-nombre").val()+
                        "&txt-fechaElaboracion="+$("#txt-fechaElaboracion").val()+
                        "&txt-fechaVencimiento="+$("#txt-fechaVencimiento").val() +
                        "&txt-serie="+$("#txt-serie").val() +
                        "&txt-lote="+$("#txt-lote").val() +
                        "&txt-precioVenta="+$("#txt-precioVenta").val() +
                        "&txt-precioCosto="+$("#txt-precioCosto").val() +
                        "&txt-inventario="+$("#txt-inventario").val() +
                        "&txt-imagen="+$("#txt-imagen").val() +
                        "&txt-fechaRegistro="+$("#txt-fechaRegistro").val()+
                        "&idProducto="+ idProducto; 

        $.ajax({
            url:"../ajax/editar-producto.php?accion=3",
            method: "POST",
            data: parametros,
            success:function(resultado){
                alert(resultado);
                if (resultado != 'true') {
                    document.getElementById("div-error").style.display = 'block';
                    $("#div-error").val(resultado);
                    
                }
                else{
                    document.getElementById("div-success").style.display = 'block';
                    obtenerProductos();
                    
                }
            }


        });//ajax

    }

    

});
  
  
  
  