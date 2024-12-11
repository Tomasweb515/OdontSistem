<%@include file="header.jsp" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<link rel="stylesheet" href="stile.css">

<%
    // Obtener la fecha actual
    Date fechaActual = new Date();

    // Crear un formateador de fecha
    SimpleDateFormat formateadorFecha = new SimpleDateFormat("dd-MM-yyyy");

    // Formatear la fecha
    String fechaFormateada = formateadorFecha.format(fechaActual);
    

%>
<div class="content-wrapper">
    <section class="content">
        <form action="#" id="form" enctype="multipart/form-data" method="POST" role="form" class="form-horizontal form-groups-bordered">
            <input type="hidden" id="listar" name="listar" value="cargar"/>
            <h3><i></i>Compras de Articulos</h3><br>


            <div class="row">
                <div class="col-lg-3 ds">
                    <!--COMPLETED ACTIONS DONUTS CHART-->
                    <h5>DATOS DEL PACIENTE

                    </h5>

                    <!-- First Action -->


                    <!-- First Action -->


                    <!-- First Action -->


                    <!-- Second Action -->

                    <div class="form-group">
                        <label for="field-12" class="control-label">Pacientes</label>

                        <select class="form-control" name="idpaciente" id="idpaciente" onchange="dividirproveedor(this.value)">

                        </select>
                    </div>

                    <div class="form-group">
                        <label for="field-12" class="control-label">Documento</label>
                        <input type="hidden" id="codpaciente" name="codpaciente">
                        <input class="form-control" type="text" value="" name="pa_ci" id="pa_ci" onKeyUp="this.value = this.value.toUpperCase();" autocomplete="off" placeholder="Cedula" readonly="readonly" required><small><span class="symbol required"></span> </small>
                    </div>

                    <div class="form-group">
                        <label for="field-12" class="control-label">Fecha de Registro</label>
                        <input class="form-control" type="text" name="fecharegistro" id="fecharegistro" onKeyUp="" autocomplete="off" placeholder="Ingrese Fecha" value="<%= fechaFormateada%>" readonly>

                    </div>

                    <hr>
                    <br>

                </div><!-- /col-lg-3 -->

                <div class="col-lg-9">

                    <div class="row">
                        <!-- TWITTER PANEL -->

                        <div class="col-lg-12">
                            <div class="panel panel-border panel-warning widget-s-1">
                                <div class="panel-heading">
                                    <h4 class="mb"><i class="fa fa-archive"></i> <strong>Detalle De La consulta</strong> </h4>
                                </div>
                                <div class="panel-body">
                                    <div class="row">


                                        <div class="col-md-5">
                                            <div class="form-group">
                                                <label for="field-5" class="control-label">servicio <span class="symbol required"></span></label>
                                                <input type="hidden" id="coddoctores" name="coddoctores">
                                                <select class="form-control" name="iddoctor" id="iddoctor" onchange="dividirproducto(this.value)">

                                                </select>
                                            </div>
                                        </div>

                                        <div class="col-md-3">
                                            <div class="form-group">
                                                <label for="field-3" class="control-label">precio <span class="symbol required"></span></label>
                                                <input class="form-control" type="text" name="doc_ci" id="doc_ci" autocomplete="off" placeholder="precio" required onKeyUp="this.value = this.value.toUpperCase();" readonly="readonly">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="field-12" class="control-label">Diente<span class="symbol required"></span></label>
                                        </div>

                                        <div class="form-group">
                                            <label for="field-12" class="control-label">tratamiento</label>
                                            <input class="form-control" type="text" name="con_tratamiento" id="con_tratamiento"  autocomplete="off" placeholder="Ingrese Tratamiento">
                                        </div>


                                    </div>
                                    <div id="error">
                                        <!-- error will be shown here ! -->
                                    </div>

                                    <div class="odontogram">
                                        <div class="row">
                                            <div class="tooth" >18
                                                <div><input class="form-control"  type="checkbox" value="18" name="con_diente" id="con_diente" onKeyUp="this.value = this.value.toUpperCase();" readonly="readonly" placeholder="18"></div>
                                                </div>
                                            
                                            <div class="tooth">17
                                                                                            <div><input class="form-control"  type="checkbox" value="17" name="con_diente" id="con_diente" onKeyUp="this.value = this.value.toUpperCase();" readonly="readonly" placeholder="18"></div>
</div>
                                            <div class="tooth">16
                                                                                            <div><input class="form-control"  type="checkbox" value="16" name="con_diente" id="con_diente" onKeyUp="this.value = this.value.toUpperCase();" readonly="readonly" placeholder="18"></div>
</div>
                                            <div class="tooth">15<div><input class="form-control"  type="checkbox" value="15" name="con_diente" id="con_diente" onKeyUp="this.value = this.value.toUpperCase();" readonly="readonly" placeholder="18"></div></div>
                                            <div class="tooth">14
                                            <div><input class="form-control"  type="checkbox" value="14" name="con_diente" id="con_diente" onKeyUp="this.value = this.value.toUpperCase();" readonly="readonly" placeholder="18"></div></div>
                                            <div class="tooth">13
                                   <div><input class="form-control"  type="checkbox" value="13" name="con_diente" id="con_diente" onKeyUp="this.value = this.value.toUpperCase();" readonly="readonly" placeholder="18"></div>
                                            </div>
                                            <div class="tooth">12
                                            <div><input class="form-control"  type="checkbox" value="12" name="con_diente" id="con_diente" onKeyUp="this.value = this.value.toUpperCase();" readonly="readonly" placeholder="18"></div></div>
                                            <div class="tooth">11<div><input class="form-control"  type="checkbox" value="11" name="con_diente" id="con_diente" onKeyUp="this.value = this.value.toUpperCase();" readonly="readonly" placeholder="18"></div></div>
                                        </div>
                                        <div class="row">
                                            <div class="tooth">21<div><input class="form-control"  type="checkbox" value="21" name="con_diente" id="con_diente" onKeyUp="this.value = this.value.toUpperCase();" readonly="readonly" placeholder="18"></div></div>
                                            <div class="tooth">22<div><input class="form-control"  type="checkbox" value="22" name="con_diente" id="con_diente" onKeyUp="this.value = this.value.toUpperCase();" readonly="readonly" placeholder="18"></div></div>
                                            <div class="tooth">23<div><input class="form-control"  type="checkbox" value="23" name="con_diente" id="con_diente" onKeyUp="this.value = this.value.toUpperCase();" readonly="readonly" placeholder="18"></div></div>
                                            <div class="tooth">24<div><input class="form-control"  type="checkbox" value="24" name="con_diente" id="con_diente" onKeyUp="this.value = this.value.toUpperCase();" readonly="readonly" placeholder="18"></div></div>
                                            <div class="tooth">25<div><input class="form-control"  type="checkbox" value="25" name="con_diente" id="con_diente" onKeyUp="this.value = this.value.toUpperCase();" readonly="readonly" placeholder="18"></div></div>
                                            <div class="tooth">26<div><input class="form-control"  type="checkbox" value="26" name="con_diente" id="con_diente" onKeyUp="this.value = this.value.toUpperCase();" readonly="readonly" placeholder="18"></div></div>
                                            <div class="tooth">27<div><input class="form-control"  type="checkbox" value="27" name="con_diente" id="con_diente" onKeyUp="this.value = this.value.toUpperCase();" readonly="readonly" placeholder="18"></div></div>
                                            <div class="tooth">28<div><input class="form-control"  type="checkbox" value="28" name="con_diente" id="con_diente" onKeyUp="this.value = this.value.toUpperCase();" readonly="readonly" placeholder="18"></div></div>
                                        </div>
                                        <div class="row">
                                            <div class="tooth">48<div><input class="form-control"  type="checkbox" value="48" name="con_diente" id="con_diente" onKeyUp="this.value = this.value.toUpperCase();" readonly="readonly" placeholder="18"></div></div>
                                            <div class="tooth">47<div><input class="form-control"  type="checkbox" value="47" name="con_diente" id="con_diente" onKeyUp="this.value = this.value.toUpperCase();" readonly="readonly" placeholder="18"></div></div>
                                            <div class="tooth">46<div><input class="form-control"  type="checkbox" value="46" name="con_diente" id="con_diente" onKeyUp="this.value = this.value.toUpperCase();" readonly="readonly" placeholder="18"></div></div>
                                            <div class="tooth">45<div><input class="form-control"  type="checkbox" value="45" name="con_diente" id="con_diente" onKeyUp="this.value = this.value.toUpperCase();" readonly="readonly" placeholder="18"></div></div>
                                            <div class="tooth">44<div><input class="form-control"  type="checkbox" value="44" name="con_diente" id="con_diente" onKeyUp="this.value = this.value.toUpperCase();" readonly="readonly" placeholder="18"></div></div>
                                            <div class="tooth">43<div><input class="form-control"  type="checkbox" value="43" name="con_diente" id="con_diente" onKeyUp="this.value = this.value.toUpperCase();" readonly="readonly" placeholder="18"></div></div>
                                            <div class="tooth">42<div><input class="form-control"  type="checkbox" value="42" name="con_diente" id="con_diente" onKeyUp="this.value = this.value.toUpperCase();" readonly="readonly" placeholder="18"></div></div>
                                            <div class="tooth">41<div><input class="form-control"  type="checkbox" value="41" name="con_diente" id="con_diente" onKeyUp="this.value = this.value.toUpperCase();" readonly="readonly" placeholder="18"></div>
                                        </div></div>
                                        <div class="row">
                                            <div class="tooth">31<div><input class="form-control"  type="checkbox" value="31" name="con_diente" id="con_diente" onKeyUp="this.value = this.value.toUpperCase();" readonly="readonly" placeholder="18"></div></div>
                                            <div class="tooth">32<div><input class="form-control"  type="checkbox" value="32" name="con_diente" id="con_diente" onKeyUp="this.value = this.value.toUpperCase();" readonly="readonly" placeholder="18"></div></div>
                                            <div class="tooth">33<div><input class="form-control"  type="checkbox" value="33" name="con_diente" id="con_diente" onKeyUp="this.value = this.value.toUpperCase();" readonly="readonly" placeholder="18"></div></div>
                                            <div class="tooth">34<div><input class="form-control"  type="checkbox" value="34" name="con_diente" id="con_diente" onKeyUp="this.value = this.value.toUpperCase();" readonly="readonly" placeholder="18"></div></div>
                                            <div class="tooth">35<div><input class="form-control"  type="checkbox" value="35" name="con_diente" id="con_diente" onKeyUp="this.value = this.value.toUpperCase();" readonly="readonly" placeholder="18"></div></div>
                                            <div class="tooth">36<div><input class="form-control"  type="checkbox" value="36" name="con_diente" id="con_diente" onKeyUp="this.value = this.value.toUpperCase();" readonly="readonly" placeholder="18"></div></div>
                                            <div class="tooth">37<div><input class="form-control"  type="checkbox" value="37" name="con_diente" id="con_diente" onKeyUp="this.value = this.value.toUpperCase();" readonly="readonly" placeholder="18"></div></div>
                                            <div class="tooth">38<div><input class="form-control"  type="checkbox" value="38" name="con_diente" id="con_diente" onKeyUp="this.value = this.value.toUpperCase();" readonly="readonly" placeholder="18"></div>
                                        </div>
</div>
                                    </div>


                                    <div align="right">
                                        <button type="button" name="agregar" value="agregar" id="AgregaProductoCompra" class="btn btn-primary" onclick=""><span class="fa fa-shopping"></span> Agregar</button>
                                        <div id="respuesta"></div>
                                    </div>
                                    <hr>



                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="table-responsive">
                                                <table class="table table-striped table-bordered dt-responsive nowrap" id="carrito">
                                                    <thead>
                                                        <tr>
                                                            <th>
                                                                <div align="center">Accion</div>
                                                            </th>
                                                            <th>
                                                                <div align="center">REF.</div>
                                                            </th>
                                                            <th>
                                                                <div align="center">Tratamiento</div>
                                                            </th>
                                                            <th>
                                                                <div align="center">Diente</div>
                                                            </th>
                                                            <th>                                                                
                                                                <div align="center">Precio</div>

                                                            </th>
                                                            <th>
                                                                <div align="center">Estado</div>
                                                            </th>


                                                        </tr>
                                                    </thead>

                                                    <tbody id="resultados">



                                                    </tbody>

                                                </table>
                                                <table width="302" id="carritototal">

                                                    <tr>
                                                        <td><span class="Estilo9"><label>Total:</label></span></td>
                                                        <td>
                                                            <div align="right" class="Estilo9"><label id="lbltotal" name="lbltotal"></label><input type="hidden" name="txtTotal" id="txtTotal" value="0.00" />
                                                                <input type="hidden" name="txtTotalCompra" id="txtTotalCompra" value="" />
                                                            </div>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </div>
                                        </div>
                                    </div>


                                    



                                        <div class="modal-footer">
                                            <button class="btn btn-danger" type="reset" onclick="#" id="cancelar-compra"><span class="fa fa-times"></span> Cancelar</button>
                                            <button type="button" name="btn-submit" id="final-compra" class="btn btn-primary" onclick="#"><span class="fa fa-save"></span> Registrar</button>
                                        </div>



                                    </div>
                                </div>
                            </div>



                        </div><!-- /row -->
                    </div><!-- /col-lg-9 END SECTION MIDDLE -->

                </div>
                <!-- **********************************************************************************************************************************************************
              RIGHT SIDEBAR CONTENT
              *********************************************************************************************************************************************************** -->
        </form>
    </section>
</div>


<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Eliminar Registro</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                Esta seguro de querer eliminar el registro?
                <input type="hidden" name="pkdel" id="pkdel"/>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">NO</button>
                <button type="button" class="btn btn-primary" data-dismiss="modal" id="delcompra">SI</button>
            </div>
        </div>
    </div>
</div>
<!-- Modal -->
<div class="modal fade" id="edit" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Tratamiento terminado</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                Ya has terminado el tratamiento?
                <input type="text" name="pkmod" id="pkmod"/>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">NO</button>
                <button type="button" class="btn btn-primary" data-dismiss="modal" id="tercompra">SI</button>
            </div>
        </div>
    </div>
</div>
<%@include file="footer.jsp" %>
<script>
    $(document).ready(function () {
        buscarproveedor();
        buscardoctor();
    });
    function buscarproveedor() {
        $.ajax({
            data: {listar: 'buscarproveedor'},
            url: 'jsp/buscar.jsp',
            type: 'post',
            beforeSend: function () {
                // $("#resultado").html("Procesando, espere por favor...");
            },
            success: function (response) {
                $("#idpaciente").html(response);
            }
        });
    }
    function buscardoctor() {
        $.ajax({
            data: {listar: 'buscardoctores'},
            url: 'jsp/buscar.jsp',
            type: 'post',
            beforeSend: function () {
                // $("#resultado").html("Procesando, espere por favor...");
            },
            success: function (response) {
                $("#iddoctor").html(response);
            }
        });
    }

    function dividirproducto(a) {
        //alert(a);
        datos = a.split(',');
        // alert(datos[0]);
        // alert(datos[1]);
        $("#coddoctores").val(datos[0]);
        $("#doc_ci").val(datos[1]);
    }
    function dividirproveedor(a) {
        //alert(a);
        datos = a.split(',');
        // alert(datos[0]);
        // alert(datos[1]);
        $("#codpaciente").val(datos[0]);
        $("#pa_ci").val(datos[1]);
    }
    $("#AgregaProductoCompra").click(function () {
        datosform = $("#form").serialize();
        $.ajax({
            data: datosform,
            url: 'jsp/control.jsp',
            type: 'post',
            beforeSend: function () {
                //$("#resultado").html("Procesando, espere por favor...");
            },
            success: function (response) {
                $("#respuesta").html(response);
                cargardetalle();
            }
        });
    });

    function cargardetalle() {
        $.ajax({
            data: {listar: 'listar'},
            url: 'jsp/control.jsp',
            type: 'post',
            beforeSend: function () {
                // $("#resultado").html("Procesando, espere por favor...");
            },
            success: function (response) {
                $("#resultados").html(response);
                sumador();

            }
        });
    }
    function  sumador() {
        $.ajax({
            data: {listar: 'listarsuma'},
            url: 'jsp/control.jsp',
            type: 'post',
            beforeSend: function () {
                //$("#resultado").html("Procesando, espere por favor...");
            },
            success: function (response) {
                $("#lbltotal").html(response);
                $("#txtTotalCompra").val(response);


            }
        });
    }

    $("#delcompra").click(function () {
        pkd = $("#pkdel").val();
        $.ajax({
            data: {listar: 'elimregcompra', pkd: pkd},
            url: 'jsp/control.jsp',
            type: 'post',
            beforeSend: function () {
                //$("#resultado").html("Procesando, espere por favor...");
            },
            success: function (response) {
                cargardetalle();
                sumador();

            }
        });
    });
 $("#tercompra").click(function () {
        pkd = $("#pkmod").val();
        $.ajax({
            data: {listar: 'termincompra', pkd: pkd},
            url: 'jsp/control.jsp',
            type: 'post',
            beforeSend: function () {
                //$("#resultado").html("Procesando, espere por favor...");
            },
            success: function (response) {
                cargardetalle();
                sumador();

            }
        });
    });
    $("#cancelar-compra").click(function () {
        $.ajax({
            data: {listar: 'cancelcompra'},
            url: 'jsp/control.jsp',
            type: 'post',
            beforeSend: function () {
                //$("#resultado").html("Procesando, espere por favor...");
            },
            success: function (response) {
                location.href = 'listar.jsp';

            }
        });
    });
    $("#final-compra").click(function () {
        total = $("#txtTotalCompra").val();
        $.ajax({
            data: {listar: 'finalcompra', total: total},
            url: 'jsp/control.jsp',
            type: 'post',
            beforeSend: function () {
                //$("#resultado").html("Procesando, espere por favor...");
            },
            success: function (response) {
                location.href = 'listar.jsp';

            }
        });
    });

   function rellenaredit(a,b,c,d,r){
           $("#idservicio").val(a);
           $("#ser_nombre").val(b);
           $("#ser_precio").val(c);
           $("#ser_estado").val(d);
           
           $("#iddoctor").val(r);
           $("#listar").val("modificar");
    
       }
</script>
