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
                        <h3 class="box-title">Ingresar nuevo producto</h3>
                        <div class="box-tools pull-right">
                            <button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>

                            <button class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
                        </div>
                    </div>

                    <!-- /.box-header -->
                    <div class="box-body">
                        <div class="row">
                            
                            
                            <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                                <div class="form-group">
                                    <label for="nombre">Nombre</label><br>
                                    <input type="text" id="nombre" required value="" class="form-control" placeholder="Nombre del producto...">
                                </div>
                            </div>
                            <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                                <div class="form-group">
                                    <label for="fechaElab">Fecha Elaboracion</label><br>
                                    <input type="date" id="fechaElaboracion" required value="" class="form-control" placeholder="Fecha Elaboracion...">
                                </div>
                            </div>
                            <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                                <div class="form-group">
                                    <label for="fechaVenc">Fecha Vencimiento</label><br>
                                    <input type="date" id="fechaVencimiento" required value="" class="form-control" placeholder="Fecha Vencimiento...">
                                </div>
                            </div>
                            <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                                <div class="form-group">
                                    <label for="precioCosto">Serie</label><br>
                                    <input type="text" id="txt-serie" required value="" class="form-control" placeholder=" ">
                                </div>
                            </div>
                            <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                                <div class="form-group">
                                    <label for="precioCosto">Inventario</label><br>
                                    <select name="slc-inventario" id="slc-inventario">
                                        
                                    </select>
                                </div>
                            </div>
                            <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                                <div class="form-group">
                                    <label for="fechaRegistro">Fecha Registro</label><br>
                                    <input type="date" id="fechaRegistro" required value="" class="form-control" placeholder="Fecha Registro...">
                                </div>
                            </div>
                            <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                                <div class="form-group">
                                    <label for="fechaRegistro">Indicaciones:</label><br>
                                    <textarea name="txt-indicacion" id="txt-indicacion" class="form-control"></textarea>
                                </div>
                            </div>
                            <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                                <div class="form-group">
                                    <label for="fechaRegistro">Elaboracion</label><br>
                                    <textarea name="txt-elaboracion" id="txt-elaboracion" class="form-control"></textarea>
                                </div>
                            </div>
                            <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                                <div class="form-group">
                                    <label for="precioCosto">Precio de costo</label><br>
                                    <input type="text" id="precioCosto" required value="" class="form-control" placeholder=" ">
                                </div>
                            </div>
                            <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                                <div class="form-group">
                                    <label for="precioVenta">Precio de venta</label><br>
                                    <input type="text" id="precioVenta" required value="" class="form-control" placeholder=" ">
                                </div>
                            </div>
                            
                            
                            <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                                <div class="form-group">
                                    <label for="lote">Lote</label><br>
                                    <input type="text" id="lote" required value="" class="form-control" placeholder="Cantidad...">
                                </div>
                            </div>

                            <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                                <div class="form-group">
                                    <label for="cantidad">Cantidad</label><br>
                                    <input type="text" id="cantidad" required value="" class="form-control" placeholder="Cantidad...">
                                </div>
                            </div>

                            <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                                <div class="form-group">
                                    <label for="imagen">Imagen</label><br>
                                    <input type="file" id="imagen" class="form-control">
                                </div>
                            </div>
                            
                            <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                                <div class="form-group">
                                    <button class="btn btn-primary" type="submit">Guardar</button>
                                    <button class="btn btn-primary" type="submit">Limpiar</button>
                                    <button class="btn btn-danger" type="reset">Cancelar</button>
                                </div>
                            </div>
                        </div>

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