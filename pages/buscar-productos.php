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
            <h3 class="box-title">Buscar producto</h3>
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

                <h3>Listado de productos <a href="insertar-productos.php"><button class=" h4 brn btn-success">Nuevo</button></a></h3>

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

                    <tbody id="productos">


                    </tbody>

                  </table>
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

<script src="../js/producto.js"></script>