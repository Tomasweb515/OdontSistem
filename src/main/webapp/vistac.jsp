
<%@page import="java.math.BigInteger"%>
<%@page import="java.security.MessageDigest"%>
<%
    HttpSession sesion = request.getSession(false); // Usa false para no crear una nueva sesi�n si no existe
%>

<%
    if (sesion == null || sesion.getAttribute("logueado") == null || sesion.getAttribute("logueado").equals("0")) {
%>
<script>
    alert('Su sesi�n ha expirado. Por favor, inicie sesi�n nuevamente.');
    window.location.href = "login.jsp";
</script>
<%
        return; // Detiene la ejecuci�n del c�digo JSP
    }
    String nombre = (String) sesion.getAttribute("usser");
    String rol = (String) sesion.getAttribute("rol");
    String foto = (String) sesion.getAttribute("foto");
    String passw = (String) sesion.getAttribute("pass");
String codigo = request.getParameter("id");
                        //String codigo="13";
                        int prueba = Integer.parseInt(codigo);
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
 <input type="text" class="form-control form-control-user" id="nombre" name="pa_nombre" placeholder="Nombre" readonly>
                        <input type="hidden" class="form-control" id="idpaciente" name="idpaciente" >
              
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
                                                <select class="js-states form-control" name="iddoctor" id="iddoctor" onchange="dividirproducto(this.value)" >

                                                </select>
                                            </div>
                                        </div>

                                        <div class="col-md-3">
                                            <div class="form-group">
                                                <label for="field-3" class="control-label">precio <span class="symbol required"></span></label>
                                                <input class="form-control" type="text" name="doc_ci" id="doc_ci" autocomplete="off" placeholder="precio" required onKeyUp="this.value = this.value.toUpperCase();" readonly="readonly">
                                            </div>
                                        </div>

                                        <!-- doctor -->
                                        <div class="col-md-5">
                                            <div class="form-group">
                                                <label for="field-5" class="control-label">especialidad <span class="symbol required"></span></label>
                                                <input type="hidden" id="codespecialidad" name="codespecialidad">
                                                <select class="js-states form-control" name="idespecialidad" id="idespecialidad" onchange="dividirdoctor(this.value)">

                                                </select>
                                            </div>
                                        </div>

                                        <div class="col-md-3">
                                            <div class="form-group">
                                                <label for="field-3" class="control-label">Doctor <span class="symbol required"></span></label>
                                                <input class="form-control" type="text" name="doc_especialidad" id="doc_especialidad" autocomplete="off" placeholder="doctor" required onKeyUp="this.value = this.value.toUpperCase();" readonly="readonly">
                                            </div>
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
            <div align="right" class="Estilo9">
                <label id="lbltotal"></label>
                <input type="" name="txtTotalCompra" id="txtTotalCompra" />
                <input type="" name="txtTotal" id="txtTotal" value="" />
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
<div class="modal fade" id="diente?id=" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="exampleModalLabel">Modal title</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <input type="hidden" class="form-control " id="listar_eliminar" name="listar_eliminar" value="eliminar">
                <input type="hidden" class="form-control " id="idusuario_e" name="idusuario_e">
                desea eliminar
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">No</button>

                <input type="button" class="btn btn-primary" data-bs-dismiss="modal" id="eliminaregistro" aria-label="Close" name="eliminaregistro" value="si"/>
            </div>
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
<%@include file="footer.jsp" %>
<!-- jQuery -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!-- Select2 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/js/select2.min.js"></script>

<script>
                                         $("#iddocto").select2({
                                             placeholder: "Selecciona una opcion",
                                             allowClear: true
                                         });
                                         $("#multiple").select2({
                                             placeholder: "Selecciona una opcion",
                                             allowClear: true
                                         });

                                         $("#idpacient").select2({
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
        llenadocompras();
       
       
        llenado();
        ci();
        tele();
        buscarespe();
        buscardoctor();
    });
     function buscarespe() {
        $.ajax({
            data: {listar: 'buscarespe'},
            url: 'jsp/buscar.jsp',
            type: 'post',
            beforeSend: function () {
                // $("#resultado").html("Procesando, espere por favor...");
            },
            success: function (response) {
                $("#idespecialidad").html(response);
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
    
     
function onChange (select) {
  const value = select.value;
  let option = select.querySelector(`option[value="${value}"]`);
  option.disabled = true;
}
    function dividirdoctor(a) {
        //alert(a);
        datos = a.split(',');
        // alert(datos[0]);
        // alert(datos[1]);
        $("#codespecialidad").val(datos[0]);
        $("#doc_especialidad").val(datos[1]);
    }
    function buscardoctor() {
        $.ajax({
            data: {listar: 'buscardoctores'},
            url: 'jsp/buscar.jsp?id=<%out.print(prueba);%>',
            type: 'post',
            beforeSend: function () {
                // $("#resultado").html("Procesando, espere por favor...");
            },
            success: function (response) {
                $("#iddoctor").html(response);
                llenadocompras();
            }
        });
    }
 function llenadocompras() {
        $.ajax({
            data: {listar: 'listar1'},
             url: 'jsp/control1.jsp?id=<%out.print(prueba);%>',
            type: 'post',
            beforeSend: function () {
                //$("#resultado").html("Procesando, espere por favor...");
            },
            success: function (response) {
                $("#resultadocompra").html(response);
               

            }
        });
    }
  
 function llenado() {
        $.ajax({
            data: {listar: 'paciente'},
             url: 'jsp/paccontrol.jsp?id=<% out.print(prueba);%>',
            type: 'post',
            beforeSend: function () {
                //$("#resultado").html("Procesando, espere por favor...");
            },
            success: function (response) {
                $("#nombre").val(response);
                //sumador();

            }
        });
    }
     function ci() {
        $.ajax({
            data: {listar: 'ci'},
             url: 'jsp/paccontrol.jsp?id=<% out.print(prueba);%>',
            type: 'post',
            beforeSend: function () {
                //$("#resultado").html("Procesando, espere por favor...");
            },
            success: function (response) {
                $("#pa_ci").val(response);
                //sumador();

            }
        });
    }
    
    function tele() {
        $.ajax({
            data: {listar: 'telefono'},
             url: 'jsp/paccontrol.jsp?id=<% out.print(prueba);%>',
            type: 'post',
            beforeSend: function () {
                //$("#resultado").html("Procesando, espere por favor...");
            },
            success: function (response) {
                $("#pa_telefono").val(response);
                //sumador();

            }
        });
    }
     function llenadocompra() {
        $.ajax({
            data: {listar: 'idpaciente'},
             url: 'jsp/paccontrol.jsp?id=<% out.print(prueba);%>',
            type: 'post',
            beforeSend: function () {
                //$("#resultado").html("Procesando, espere por favor...");
            },
            success: function (response) {
                $("#idpaciente").val(response);
                //sumador();

            }
        });
    }
   
    
    $("#AgregaProductoCompra").click(function () {
        datosform = $("#form").serialize();
        $.ajax({
            data: datosform,
            url: 'jsp/control.jsp?id=<%out.print(prueba);%>',
            type: 'post',
            beforeSend: function () {
                //$("#resultado").html("Procesando, espere por favor...");
            },
            success: function (response) {
                $("#respuesta").html(response);
                cargardetalle();
                buscardoctor();
                   


            }
        });
    });

    function cargardetalle() {
        $.ajax({
            data: {listar: 'listar'},
            url: 'jsp/control.jsp?id=<% out.print(prueba);%>',
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
  function sumador() {
    var prueba = <% out.print(prueba); %>;

    $.ajax({
        data: {listar: 'listarsuma'},
        url: 'jsp/control.jsp?id=' + prueba,
        type: 'post',
        beforeSend: function () {
            // Puedes a�adir c�digo aqu� si es necesario para antes de enviar la solicitud
        },
        success: function (response) {
            // Aqu� se manejan los valores devueltos por el servidor
            $("#lbltotal").html(response); // Muestra la respuesta en el elemento con id 'lbltotal'
            $("#txtTotalCompra").val(response); // Establece el valor de la caja de texto 'txtTotalCompra'
        },
        error: function (xhr, status, error) {
            // Manejo de errores
            console.error('Error en la solicitud AJAX:', error);
        }
    });
}

    $("#delcompra").click(function () {
        pkd = $("#pkdel").val();
        $.ajax({
            data: {listar: 'elimregcompra', pkd: pkd},
            url: 'jsp/control.jsp?id=<% out.print(prueba);%>',
            type: 'post',
            beforeSend: function () {
                //$("#resultado").html("Procesando, espere por favor...");
            },
            success: function (response) {
                cargardetalle();
                sumador();
                 buscardoctor();
$("#doc_ci").val("");
            }
        });
    });
 $("#tercompra").click(function () {
        pkd = $("#pkmod").val();
        $.ajax({
            data: {listar: 'termincompra', pkd: pkd},
            url: 'jsp/control.jsp?id=<% out.print(prueba);%>',
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
            url: 'jsp/control.jsp?id=<% out.print(prueba);%>',
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
    var total = $("#txtTotalCompra").val();
    var prueba = <% out.print(prueba); %>; // Obt�n el valor de prueba din�micamente

    $.ajax({
        data: {listar: 'finalcompra', total: total},
        url: 'jsp/control.jsp?id=' + prueba,
        type: 'post',
        beforeSend: function () {
            // Puedes a�adir c�digo aqu� si es necesario antes de enviar la solicitud
        },
        success: function (response) {
            alert(response); // Muestra la respuesta del servidor en una alerta
        },
        error: function (xhr, status, error) {
            // Manejo de errores
            console.error('Error en la solicitud AJAX:', error);
        }
    });
});


</script>