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
                                    <label for="descripcion">Descripcion</label><br>
                                    <input type="text" name="descripcion" required value="" class="form-control" placeholder="Descripcion...">
                                </div>
                            </div>
                            <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                                <div class="form-group">
                                    <label>Categorias</label>
                                    <select name="idcategoria" class="form-control" id="">
                                        @foreach($categorias as $cat)
                                        <option value="{{$cat->idcategoria}}">{{$cat->nombre}}</option>
                                        @endforeach
                                    </select>
                                </div>
                            </div>
                            <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                                <div class="form-group">
                                    <label for="fechaElab">Fecha Elaboracion</label><br>
                                    <input type="date" name="fechaElab" required value="" class="form-control" placeholder="Fecha Elaboracion...">
                                </div>
                            </div>
                            <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                                <div class="form-group">
                                    <label for="fechaVenc">Fecha Vencimiento</label><br>
                                    <input type="date" name="fechaVenc" required value="" class="form-control" placeholder="Fecha Vencimiento...">
                                </div>
                            </div>
                            <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                                <div class="form-group">
                                    <label for="precioCosto">Precio Costo</label><br>
                                    <input type="number" name="precioCosto" value="" class="form-control" placeholder="Precio costo...">
                                </div>
                            </div>
                            <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                                <div class="form-group">
                                    <label for="precioVenta">Precio Venta</label><br>
                                    <input type="number" name="precioVenta" value="" class="form-control" placeholder="Precio venta...">
                                </div>
                            </div>
                            <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                                <div class="form-group">
                                    <label for="imagen">Imagen</label><br>
                                    <input type="file" name="imagen" class="form-control">
                                </div>
                            </div>
                            <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                                <div class="form-group">
                                    <button class="btn btn-primary" type="submit">Guardar</button>
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