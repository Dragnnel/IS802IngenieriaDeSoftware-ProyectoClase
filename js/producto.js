$(function () {

  obtenerProductos();

  $('#search').keyup(function (e) {
    if ($('#search').val()) {

      let search = $('#search').val();

      $.ajax({
        url: 'buscar-producto.php',
        type: 'POST',
        data: { search },
        success: function (respuesta) {

          let productos = JSON.parse(respuesta);
          let plantilla = '';

          productos.forEach(producto => {
            plantilla += `<tr id-producto="${producto.codigoProducto}">
                            <td>${producto.codigoProducto}</td>
                            <td>${producto.categoriaProducto}</td>
                            <td>${producto.nombre}</td>
                            <td>${producto.fechaRegistro}</td>
                            <td>${producto.fechaElaboracion}</td>
                            <td>${producto.fechaVencimiento}</td>
                            <td>${producto.precioCosto}</td>
                            <td>${producto.precioVenta}</td>
                            <td>${producto.lote}</td>
                            <td>${producto.imagen}</td>
                            <td>
                              <button class="editar-producto btn btn-info">Editar</button>
                              <button class="eliminar-producto btn btn-danger">Eliminar</button>
                            </td>
                          </tr>`

          })

          $('#productos').html(plantilla);
        }
      })
    } else {//si el campo esta vacio 

      obtenerProductos();
      //$('#search').trigger('reset');
    }
  })//fin search()


  //fUNCION PARA MOSTRAR LOS PRODUCTOS EXISTENTES
  function obtenerProductos() {
    $.ajax({
      url: 'lista-productos.php',
      type: 'GET',
      success: function (respuesta) {
        let productos = JSON.parse(respuesta);
        let plantilla = '';
        productos.forEach(producto => {
          plantilla += `<tr id-producto = "${producto.codigoProducto}">
                            <td>${producto.codigoProducto}</td>
                            <td>${producto.categoriaProducto}</td>
                            <td>${producto.nombre}</td>
                            <td>${producto.fechaRegistro}</td>
                            <td>${producto.fechaElaboracion}</td>
                            <td>${producto.fechaVencimiento}</td>
                            <td>${producto.precioCosto}</td>
                            <td>${producto.precioVenta}</td>
                            <td>${producto.lote}</td>
                            <td>${producto.imagen}</td>
                            <td>
                              <button class="editar-producto btn btn-info">Editar</button>
                              <button class="eliminar-producto btn btn-danger">Eliminar</button>
                            </td>
                          </tr>`

        })
  
        $('#productos').html(plantilla);

      }

    })

  }


  //Funcion para eliminar producto al presionar el boton ELIMINAR
  
    $(document).on('click', '.eliminar-producto', function () {
  
      if (confirm('¿Quieres eliminar este producto?')) {
  
        //this selecciona el elemento que ha sido clickeado
        let element = $(this)[0].parentElement.parentElement;
        let id = $(element).attr('id-producto');
        console.log(id);
        $.post('eliminar-producto.php', {id }, function (respuesta) {
          obtenerProductos(); //llamo al la funcion obtenerTreas() para refrescar la lista
        })
      }
  
    })
  



});



