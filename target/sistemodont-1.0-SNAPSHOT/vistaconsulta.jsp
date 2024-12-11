
<%@page import="java.math.BigInteger"%>
<%@page import="java.security.MessageDigest"%>
<%
HttpSession sesion = request.getSession(false); // Usa false para no crear una nueva sesión si no existe
%>

<%
if (sesion == null || sesion.getAttribute("logueado") == null || sesion.getAttribute("logueado").equals("0")) {
    %>
    <script>
        alert('Su sesión ha expirado. Por favor, inicie sesión nuevamente.');
        window.location.href = "login.jsp";
    </script>
    <%
    return; // Detiene la ejecución del código JSP
}            String rol = (String) sesion.getAttribute("rol");
        String foto = (String) sesion.getAttribute("foto");
 String passw = (String) sesion.getAttribute("pass");
        String nombre = (String) sesion.getAttribute("usser");
        Integer cont = (Integer) sesion.getAttribute("cont");

%>

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

                        <select class="js-states form-control" name="idpaciente" id="idpaciente" onchange="dividirproveedor(this.value)">

                        </select>
                    </div>
                        <input type="text" id="codpaciente" name="codpaciente">

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
                                                <select class="js-states form-control" name="iddoctor" id="iddoctor" onchange="dividirproducto(this.value)">

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
                        <label for="field-12" class="control-label">DOCTOR</label>

                                                <input class="form-control" type="text" name="doc_ci" id="iddocto" autocomplete="off" placeholder="doctor" required onKeyUp="this.value = this.value.toUpperCase();" readonly="readonly">

                        
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
                                            <div class="tooth" >                                                <input class="form-control"  type="checkbox" value="18" name="con_diente" id="con_diente" onKeyUp="this.value = this.value.toUpperCase();" readonly="readonly" placeholder="18">
<img src="dientes/18.jpg" alt="alt" width="25px"/>
                                                </div>
                                            
                                            <div class="tooth"><img src="dientes/17.jpg" alt="alt" width="25px"/>
                                                                                            <div><input class="form-control"  type="checkbox" value="17" name="con_diente" id="con_diente" onKeyUp="this.value = this.value.toUpperCase();" readonly="readonly" placeholder="18"></div>
</div>
                                            <div class="tooth"><img src="dientes/16.jpg" alt="alt" width="25px"/>
                                                                                            <div><input class="form-control"  type="checkbox" value="16" name="con_diente" id="con_diente" onKeyUp="this.value = this.value.toUpperCase();" readonly="readonly" placeholder="18"></div>
</div>
                                            <div class="tooth"><img src="dientes/15.jpg" alt="alt" width="25px"/><div><input class="form-control"  type="checkbox" value="15" name="con_diente" id="con_diente" onKeyUp="this.value = this.value.toUpperCase();" readonly="readonly" placeholder="18"></div></div>
                                            <div class="tooth"><img src="dientes/14.jpg" alt="alt" width="25px"/>
                                            <div><input class="form-control"  type="checkbox" value="14" name="con_diente" id="con_diente" onKeyUp="this.value = this.value.toUpperCase();" readonly="readonly" placeholder="18"></div></div>
                                            <div class="tooth"><img src="dientes/13.jpg" alt="alt" width="25px"/>
                                   <div><input class="form-control"  type="checkbox" value="13" name="con_diente" id="con_diente" onKeyUp="this.value = this.value.toUpperCase();" readonly="readonly" placeholder="18"></div>
                                            </div>
                                            <div class="tooth"><img src="dientes/12.jpg" alt="alt" width="25px"/>
                                            <div><input class="form-control"  type="checkbox" value="12" name="con_diente" id="con_diente" onKeyUp="this.value = this.value.toUpperCase();" readonly="readonly" placeholder="18"></div></div>
                                            <div class="tooth"><img src="dientes/11.jpg" alt="alt" width="25px"/><div><input class="form-control"  type="checkbox" value="11" name="con_diente" id="con_diente" onKeyUp="this.value = this.value.toUpperCase();" readonly="readonly" placeholder="18"></div></div>
                                       
                                            <div class="tooth"><img src="dientes/21.jpg" alt="alt" width="25px"/><div><input class="form-control"  type="checkbox" value="21" name="con_diente" id="con_diente" onKeyUp="this.value = this.value.toUpperCase();" readonly="readonly" placeholder="18"></div></div>
                                            <div class="tooth"><img src="dientes/22.jpg" alt="alt" width="25px"/><div><input class="form-control"  type="checkbox" value="22" name="con_diente" id="con_diente" onKeyUp="this.value = this.value.toUpperCase();" readonly="readonly" placeholder="18"></div></div>
                                            <div class="tooth"><img src="dientes/23.jpg" alt="alt" width="25px"/><div><input class="form-control"  type="checkbox" value="23" name="con_diente" id="con_diente" onKeyUp="this.value = this.value.toUpperCase();" readonly="readonly" placeholder="18"></div></div>
                                            <div class="tooth"><img src="dientes/24.jpg" alt="alt" width="25px"/><div><input class="form-control"  type="checkbox" value="24" name="con_diente" id="con_diente" onKeyUp="this.value = this.value.toUpperCase();" readonly="readonly" placeholder="18"></div></div>
                                            <div class="tooth"><img src="dientes/25.jpg" alt="alt" width="25px"/><div><input class="form-control"  type="checkbox" value="25" name="con_diente" id="con_diente" onKeyUp="this.value = this.value.toUpperCase();" readonly="readonly" placeholder="18"></div></div>
                                            <div class="tooth"><img src="dientes/26.jpg" alt="alt" width="25px"/><div><input class="form-control"  type="checkbox" value="26" name="con_diente" id="con_diente" onKeyUp="this.value = this.value.toUpperCase();" readonly="readonly" placeholder="18"></div></div>
                                            <div class="tooth"><img src="dientes/27.jpg" alt="alt" width="25px"/><div><input class="form-control"  type="checkbox" value="27" name="con_diente" id="con_diente" onKeyUp="this.value = this.value.toUpperCase();" readonly="readonly" placeholder="18"></div></div>
                                            <div class="tooth"><img src="dientes/28.jpg" alt="alt" width="25px"/><div><input class="form-control"  type="checkbox" value="28" name="con_diente" id="con_diente" onKeyUp="this.value = this.value.toUpperCase();" readonly="readonly" placeholder="18"></div></div>
                                        </div>
                                        <div class="row">
                                            <div class="tooth"><img src="dientes/48.jpg" alt="alt" width="25px"/><div><input class="form-control"  type="checkbox" value="48" name="con_diente" id="con_diente" onKeyUp="this.value = this.value.toUpperCase();" readonly="readonly" placeholder="18"></div></div>
                                            <div class="tooth"><img src="dientes/47.jpg" alt="alt" width="25px"/><div><input class="form-control"  type="checkbox" value="47" name="con_diente" id="con_diente" onKeyUp="this.value = this.value.toUpperCase();" readonly="readonly" placeholder="18"></div></div>
                                            <div class="tooth"><img src="dientes/46.jpg" alt="alt" width="25px"/><div><input class="form-control"  type="checkbox" value="46" name="con_diente" id="con_diente" onKeyUp="this.value = this.value.toUpperCase();" readonly="readonly" placeholder="18"></div></div>
                                            <div class="tooth"><img src="dientes/45.jpg" alt="alt" width="25px"/><div><input class="form-control"  type="checkbox" value="45" name="con_diente" id="con_diente" onKeyUp="this.value = this.value.toUpperCase();" readonly="readonly" placeholder="18"></div></div>
                                            <div class="tooth"><img src="dientes/44.jpg" alt="alt" width="25px"/><div><input class="form-control"  type="checkbox" value="44" name="con_diente" id="con_diente" onKeyUp="this.value = this.value.toUpperCase();" readonly="readonly" placeholder="18"></div></div>
                                            <div class="tooth"><img src="dientes/43.jpg" alt="alt" width="25px"/><div><input class="form-control"  type="checkbox" value="43" name="con_diente" id="con_diente" onKeyUp="this.value = this.value.toUpperCase();" readonly="readonly" placeholder="18"></div></div>
                                            <div class="tooth"><img src="dientes/42.jpg" alt="alt" width="25px"/><div><input class="form-control"  type="checkbox" value="42" name="con_diente" id="con_diente" onKeyUp="this.value = this.value.toUpperCase();" readonly="readonly" placeholder="18"></div></div>
                                            <div class="tooth"><img src="dientes/41.jpg" alt="alt" width="25px"/><div><input class="form-control"  type="checkbox" value="41" name="con_diente" id="con_diente" onKeyUp="this.value = this.value.toUpperCase();" readonly="readonly" placeholder="18"></div>
                                        </div>
                                            <div class="tooth"><img src="dientes/31.jpg" alt="alt" width="25px"/><div><input class="form-control"  type="checkbox" value="31" name="con_diente" id="con_diente" onKeyUp="this.value = this.value.toUpperCase();" readonly="readonly" placeholder="18"></div></div>
                                            <div class="tooth"><img src="dientes/32.jpg" alt="alt" width="25px"/><div><input class="form-control"  type="checkbox" value="32" name="con_diente" id="con_diente" onKeyUp="this.value = this.value.toUpperCase();" readonly="readonly" placeholder="18"></div></div>
                                            <div class="tooth"><img src="dientes/33.jpg" alt="alt" width="25px"/><div><input class="form-control"  type="checkbox" value="33" name="con_diente" id="con_diente" onKeyUp="this.value = this.value.toUpperCase();" readonly="readonly" placeholder="18"></div></div>
                                            <div class="tooth"><img src="dientes/34.jpg" alt="alt" width="25px"/><div><input class="form-control"  type="checkbox" value="34" name="con_diente" id="con_diente" onKeyUp="this.value = this.value.toUpperCase();" readonly="readonly" placeholder="18"></div></div>
                                            <div class="tooth"><img src="dientes/35.jpg" alt="alt" width="25px"/><div><input class="form-control"  type="checkbox" value="35" name="con_diente" id="con_diente" onKeyUp="this.value = this.value.toUpperCase();" readonly="readonly" placeholder="18"></div></div>
                                            <div class="tooth"><img src="dientes/36.jpg" alt="alt" width="25px"/><div><input class="form-control"  type="checkbox" value="36" name="con_diente" id="con_diente" onKeyUp="this.value = this.value.toUpperCase();" readonly="readonly" placeholder="18"></div></div>
                                            <div class="tooth"><img src="dientes/37.jpg" alt="alt" width="25px"/><div><input class="form-control"  type="checkbox" value="37" name="con_diente" id="con_diente" onKeyUp="this.value = this.value.toUpperCase();" readonly="readonly" placeholder="18"></div></div>
                                            <div class="tooth"><img src="dientes/38.jpg" alt="alt" width="25px"/><div><input class="form-control"  type="checkbox" value="38" name="con_diente" id="con_diente" onKeyUp="this.value = this.value.toUpperCase();" readonly="readonly" placeholder="18"></div>
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


<input data-modal="myModal" class="boton" type="button" id="myBtn" value="Abrir Modal">
<!-- The Modal --> 
<div class="modal" id="myModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">

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
  
<input data-modal="myModa2" class="boton"  type="button" id="myBtn2" value="Abrir Modal">

<div id="myModa2" class="modal">
  <div class="modal-content">
    <span class="close">&times;</span>
    <p>Detección de fugas eléctricas con meghómetro, instalaciones eléctricas en general, cableados, mediciones eléctricas, tableros thermomagnéticas, balanceos de carga, instalaciones de MT,BT. Protocolos de mediciones eléctricas.</p>
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

    <button href="dientes.jsp" data-toggle="modal" data-target="#miModal">Open One</button>
    <button href="dientes.jsp" data-toggle="modal" data-target="#miModal">Open Two</button>

  <div id="miModal" class="modal fade text-center">
    <div class="modal-dialog">
      <div class="modal-content">
      </div>
    </div>
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
                <input type="hidden" name="pkmod" id="pkmod"/>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">NO</button>
                <button type="button" class="btn btn-primary" data-dismiss="modal" id="tercompra">SI</button>
            </div>
        </div>
    </div>
</div>
<style>
    #myModal{
       
         height: 500px;
         width: 500px;
  top: 25%;
  left: 30%;


  
    }
    
</style>
<%@include file="footer.jsp" %>
 <!-- jQuery -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <!-- Select2 -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/js/select2.min.js"></script>

       <script>
      $("#iddoctor").select2({
          placeholder: "Selecciona una opcion",
          allowClear: true
      });
      $("#multiple").select2({
          placeholder: "Selecciona una opcion",
          allowClear: true
      });
    </script>
      <script>
      $("#idpaciente").select2({
          placeholder: "Selecciona una opcion",
          allowClear: true
      });
      $("#multiple").select2({
          placeholder: "Selecciona una opcion",
          allowClear: true
      });
    </script>
<script>
    $(document).ready(function () {
        buscarproveedor();
        buscardoctor();
        rellenarper();
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
   function rellenarper(){
           
            $.ajax({
                data: {listar:'eliminar' },
            url:'jsp/control_1.jsp',
            type: 'post',
           
            success: function(response){
            $("#codpaciente").html('<option value="">Seleccionar personal</option>' + response);
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
        $("#iddocto").val(datos[2]);
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
            url: 'jsp/newjsp.jsp',
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
            url: 'jsp/newjsp.jsp',
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
    function rellenaredit(a){
           $("#idpaciente").val(a);
           
     
    
       }
var modal = $('#myModal, #myModal2');
var btn = $('#myBtn, #myBtn2');
var span = document.getElementsByClassName("close")[0];

$('.boton').click(function(){
		var id = $(this).attr('data-modal');
    $("#"+id).css('display','block');
});

$(".close").click(function(){
		$(this).parent().parent().css('display','none');
})

$('span').click(function() {
    modal.css('display','none');
});
$(".modal").click(function(event) {
        $(this).css('display','none')
})
$(document).on('hidden.bs.modal', '.modal', function () {
    $(this).removeData('bs.modal');
    $(this).find(".modal-content").empty();
});
</script>
