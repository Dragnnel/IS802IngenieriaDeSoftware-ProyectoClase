<?php
include '../templates/documento-apertura.php';
include '../templates/header.php';
include '../templates/sidebar.php';
?>


<!--Contenido-->
<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">

  <!-- Main content -->
  <section class="content">

    <div class="row">
      <div class="col-md-12">
        <div class="box">
          <div class="box-header with-border">
            <h3 class="box-title">Modificar producto en el inventario</h3>
            <div class="box-tools pull-right">
              <button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>

              <button class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
            </div>
          </div>

          <!-- /.box-header -->
          <div class="box-body">
            <div class="row">
              <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">

                <!--Contenido------------------------------------------------------------------------------------->

                <h3>Listado de productos <a href="articulo/create"><button class=" h4 brn btn-success">Nuevo</button></a></h3>

                <div class="from-group">
                  <div class="input-group">
                    <input type="text" id="search" class="form-control" name="searchText" placeholder="Buscar.." value="">
                    <span class="input-group-btn">
                      <button type="submit" class="btn btn-primary">Buscar</button>
                    </span>
                  </div>
                </div>
              </div>
            </div>

            <div class="row">
              <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <div class="table-responsive">
                  <table class="table table-striped table-bordered table-condensed table-hover">
                    <thead>
                      <th>ID</th>
                      <th>Categoria</th>
                      <th>Descripcion</th>
                      <th>Fecha Reg.</th>
                      <th>Fecha Elab.</th>
                      <th>Fecha Venc.</th>
                      <th>P Costo</th>
                      <th>P Venta</th>
                      <th>Lote</th>
                      <th>Imagen</th>
                      <th>Opciones</th>
                    </thead>

                    <tbody id="tbodyProductos">


                    </tbody>

                  </table>
                </div>
              </div>
                <div id="div-contenido" >
                </div>
              <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Editar Producto</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form>
                        <div class="form-group">
                            <label for="recipient-name" class="col-form-label">Nombre:</label>
                            <input type="text" class="form-control" id="txt-nombre">
                        </div>
                        <div class="form-group">
                            <label for="recipient-name" class="col-form-label">Fecha Elaboracion:</label>
                            <input type="date" class="form-control" id="txt-fechaElaboracion">
                        </div>
                        <div class="form-group">
                            <label for="recipient-name" class="col-form-label">Fecha Vencimiento:</label>
                            <input type="date" class="form-control" id="txt-fechaVencimiento">
                        </div>
                        <div class="form-group">
                            <label for="recipient-name" class="col-form-label">Serie:</label>
                            <input type="text" class="form-control" id="txt-serie">
                        </div>
                        <div class="form-group">
                            <label for="recipient-name" class="col-form-label">Lote:</label>
                            <input type="text" class="form-control" id="txt-lote">
                        </div>
                        <div class="form-group">
                            <label for="recipient-name" class="col-form-label">Precio Venta:</label>
                            <input type="text" class="form-control" id="txt-precioVenta">
                        </div>
                        <div class="form-group">
                            <label for="recipient-name" class="col-form-label">Precio Costo:</label>
                            <input type="text" class="form-control" id="txt-precioCosto">
                        </div>
                        <div class="form-group">
                            <label for="recipient-name" class="col-form-label">Inventario:</label>
                            <input type="text" class="form-control" id="txt-inventario">
                        </div>
                        <div class="form-group">
                            <label for="recipient-name" class="col-form-label">Imagen:</label>
                            <input type="text" class="form-control" id="txt-imagen">
                        </div>
                        <div class="form-group">
                            <label for="recipient-name" class="col-form-label">Fecha Registro:</label>
                            <input type="date" class="form-control" id="txt-fechaRegistro">
                        </div>
                        <div  id="div-success" class="alert alert-success" role="alert">
                            El producto fue modificado con exito
                        </div>
                        <div  id="div-error" class="alert alert-danger" role="alert">
                            
                        </div>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-danger" data-dismiss="modal">Cancelar</button>
                        <button type="button" class="btn btn-primary" onclick="editarProducto();">Guardar</button>
                    </div>
                    </div>
                </div>
            </div>
            </div>
            <!--Fin Contenido------------------------------------------------------------------------------------>

          </div>
        </div>

      </div>
    </div><!-- /.row -->
</div><!-- /.box-body -->
</div><!-- /.box -->
</div><!-- /.col -->
</div><!-- /.row -->

</section><!-- /.content -->
</div><!-- /.content-wrapper -->
<!--Fin-Contenido-->

<?php

include '../templates/documento-cierre.php';

?>

<script src="../js/controlador-producto.js"></script>