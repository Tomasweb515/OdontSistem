
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
}           String nombre=(String)sesion.getAttribute("usser");
 String rol = (String) sesion.getAttribute("rol");
        String foto = (String) sesion.getAttribute("foto");
 String passw = (String) sesion.getAttribute("pass");

String codigo = request.getParameter("id");
                        //String codigo="13";
                        int prueba = Integer.parseInt(codigo);
%>
<%@include file="header.jsp"%>
<%@ page import="java.sql.Time" %>
<%@ page import="java.time.LocalTime" %>
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

    Date date = new Date();
    // Hora que obtendrías de la base de datos.
    Time time = new Time(date.getTime());
%>
<div class="content-wrapper">
    <section class="content">
        <form action="#" id="form" enctype="multipart/form-data" method="POST" role="form" class="form-horizontal form-groups-bordered">
            <input type="hidden" id="listar" name="listar" value="cargar"/>
           


            <div class="row">
                <div class="col-lg-2 ds">
                    <!--COMPLETED ACTIONS DONUTS CHART-->
                    <h5>DATOS DEL PACIENTE

                    </h5>

                    <!-- First Action -->


                    <!-- First Action -->


                    <!-- First Action -->


                    <!-- Second Action -->

                    <div class="form-group">
                        <label for="field-12" class="control-label">Nombre del Paciente</label>
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
                        <input class="form-control" type="text" name="pa_fecha" id="fecharegistro" onKeyUp="" autocomplete="off" placeholder="Ingrese Fecha" value="<%= fechaFormateada%>" readonly>

                    </div>

                    <hr>
                    <br>

                </div><!-- /col-lg-3 -->
  

                  
               
                <div class="col-lg-5 ds">

                    <div class="row">
                        <!-- TWITTER PANEL -->

                        <div class="col-lg-12 ds">
                            <div class="panel panel-border panel-warning widget-s-1">
                                <div class="panel-heading">
                                    <h4 class="mb"><i class=""></i> <strong></strong> </h4>
                                </div>
                                <div class="panel-body">
                                    <div class="row">


                                        <div class="col-md-7">
                                            <div class="form-group">
                                                <label for="field-5" class="control-label">Telefono <span class="symbol required"></span></label>
                                                <input type="text" class="form-control" id="pa_telefono" name="pa_telefono" readonly>
                  
                                            </div>
                                        </div>

                                        <div class="col-md-5">
                                            <div class="form-group">
                                                <label for="field-3" class="control-label"> <span class="symbol required">Direccion</span></label>
                                                <input class="form-control" type="text" name="" id="" autocomplete="off" placeholder="precio" required onKeyUp="this.value = this.value.toUpperCase();" readonly="readonly">
                                            </div>
                                        </div>
                              

                                        <div class="col-md-5"> 
                                            <label for="field-12" class="control-label">Especialidad</label>

                                                <input class="form-control" type="text" name="doc_ci" id="iddocto" autocomplete="off" placeholder="doctor" required onKeyUp="this.value = this.value.toUpperCase();" readonly="readonly">

                        
                                           </div>
 <div class="col-md-5"> 
                                            <label for="field-12" class="control-label">Nombre del Doctor</label>

                                                <input class="form-control" type="text" name="doc_ci" id="docnombredel" autocomplete="off" placeholder="doctor" required onKeyUp="this.value = this.value.toUpperCase();" readonly="readonly">

                        
                                              </div>

                                    </div>
                                  
                                    <div id="error">
                                        <!-- error will be shown here ! -->
                                    </div>
    
                                   


                                    <div align="right">
                                        <div id="respuesta"></div>
                                    </div>
                                    <hr>



                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="table-responsive">
                                                 <div class="accordion accordion-flush" id="accordionFlushExample">
  <div class="accordion-item">
    <h2 class="accordion-header">
      <button class="btn btn-primary" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseOne" aria-expanded="false" aria-controls="flush-collapseOne">
<i class="fa fa-plus" aria-hidden="true"></i> Detalle
      </button>
    </h2>
    <div id="flush-collapseOne" class="accordion-collapse collapse" data-bs-parent="#accordionFlushExample">
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
                                                
                                            </div>
                                        </div>
                                    </div>    </div>
  </div>
 
  
</div> 
                                                        <table width="302" id="carritosubtotal">

                                                    <tr>
                                                        <td><span class="Estilo9"><label>SubTotal:</label></span></td>
                                                        <td>
                                                            <div align="right" class="Estilo9"><label id="lblsubtotal" name="lblsubtotal"></label><input type="hidden" name="txtsubTotal" id="txtsubTotal" value="0.00" />
                                                                <input type="hidden" name="txtsubTotalCompra" id="txtTotalCompra" value="" />
                                                            </div>
                                                        </td>
                                                    </tr>
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


                                    



                                        


 
                                    </div>
                                
                                </div>
                            </div>


                        </div><!-- /row -->
                         
                    </div><!-- /col-lg-9 END SECTION MIDDLE -->
 
                        <!-- TWITTER PANEL -->

                        <div class="col-lg-5">
                                <div class="panel-heading">
                                    <h4 class="mb"><i class=""></i> <strong></strong> </h4>
                                </div>
                                <div class="panel-body">
                                    <div class="row">
 <div class="col-lg-9">
                                         <div class="col-lg-9 ds">
                    <!--COMPLETED ACTIONS DONUTS CHART-->
                    <h5>DATOS DEL PAGO

                    </h5>

                  
                    <div class="form-group">
                        <label for="field-12" class="control-label">Metodo de pago</label>
                        <input type="text" class="form-control form-control-user" id="" name="" placeholder="Nombre" readonly>
                        <input type="hidden" class="form-control" id="hora" name="hora" value="<%= time%>" >
                                      <input type="hidden" class="form-control" id="pa_motivo" name="pa_motivo" value="Pago de servicio odontologico" >

                    </div>
                    <div class="form-group">
                        <label for="field-12" class="control-label">Total</label>
                        <input type="text" class="form-control form-control-user" id="numero2"  placeholder="precio" onchange="sumar();">
                    </div>
 <div class="form-group">
                        <label for="field-12" class="control-label">Pagar</label>
                        <input type="text" class="form-control form-control-user" id="numero1"  placeholder="pagar" onchange="sumar();">
                    </div>
                    <div class="form-group">
                        <label for="field-12" class="control-label">Vuelto</label>
                        <input type="text" class="form-control form-control-user" id="resultado" name="pa_precio" placeholder="Vuelto"  readonly>
                    </div>


                    <hr>
                    <br>

                </div><!-- /col-lg-3 -->
                                  
                     
                         
                    </div><!-- /col-lg-9 END SECTION MIDDLE -->

                </div>  </div><!-- /row -->
                         
                    </div><!-- /col-lg-9 END SECTION MIDDLE -->

                </div><div class="modal-footer">
                                            <button class="btn btn-danger" onclick="#"><span class="fa fa-times"></span> Cancelar</button>
                                            <button type="button" name="btn-submit" id="final-compra" class="btn btn-primary" onclick="#"><span class="fa fa-save"></span> Registrar</button>
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
<script>
    // si la respuesta que se espera es sumar
    function sumar(){
        var numero1 = document.getElementById('numero1').value;
        var numero2 = document.getElementById('numero2').value;

        if(numero1!=='' && numero2!==''){
            var resultado = parseInt(numero1)-(+(parseInt(numero2)));
            document.getElementById('resultado').value = resultado;
        }
    }
</script>
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
        llenadocompras();
        cargardetalle();
        buscardoctor();
        llenado();
        ci();
        tele();
        esp();
        doct();
    });
    
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
 function llenadocompras() {
        $.ajax({
            data: {listar: 'listar1'},
             url: 'jsp/control1.jsp?id=<% out.print(prueba);%>',
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
    
     function esp() {
        $.ajax({
            data: {listar: 'esp'},
             url: 'jsp/paccontrol.jsp?id=<% out.print(prueba);%>',
            type: 'post',
            beforeSend: function () {
                //$("#resultado").html("Procesando, espere por favor...");
            },
            success: function (response) {
                $("#iddocto").val(response);
                //sumador();

            }
        });
    }
      function doct() {
        $.ajax({
            data: {listar: 'doct'},
             url: 'jsp/paccontrol.jsp?id=<% out.print(prueba);%>',
            type: 'post',
            beforeSend: function () {
                //$("#resultado").html("Procesando, espere por favor...");
            },
            success: function (response) {
                $("#docnombredel").val(response);
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
            url: 'jsp/control.jsp?id=<% out.print(prueba);%>',
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
            url: 'jsp/control_2.jsp?id=<% out.print(prueba);%>',
            type: 'post',
            beforeSend: function () {
                // $("#resultado").html("Procesando, espere por favor...");
            },
            success: function (response) {
                $("#resultados").html(response);
                sumador();
ssubsumador();
pagar();
            }
        });
    }
    function  sumador() {
        $.ajax({
            data: {listar: 'listarsuma'},
            url: 'jsp/control_2.jsp?id=<% out.print(prueba);%>',
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
   function  pagar() {
        $.ajax({
            data: {listar: 'listarpagar'},
            url: 'jsp/control_2.jsp?id=<% out.print(prueba);%>',
            type: 'post',
            beforeSend: function () {
                //$("#resultado").html("Procesando, espere por favor...");
            },
            success: function (response) {
                $("#lblsubtotal").html(response);
                $("#numero2").val(response);


            }
        });
    }
    function  ssubsumador() {
        $.ajax({
            data: {listar: 'listarsubsuma'},
            url: 'jsp/control_2.jsp?id=<% out.print(prueba);%>',
            type: 'post',
            beforeSend: function () {
                //$("#resultado").html("Procesando, espere por favor...");
            },
            success: function (response) {
                $("#lblsubtotal").html(response);
                $("#txtsubTotalCompra").val(response);


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
                ssubsumador();

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
                ssubsumador();

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
        total = $("#resultado").val();
        hora = $("#hora").val();
fechas= $("#fecharegistro").val();
motivo= $("#pa_motivo").val();
        $.ajax({
            data: {listar: 'Emitido', total: total, hora: hora, fechas: fechas, motivo: motivo},
            url: 'jsp/control.jsp?id=<% out.print(prueba);%>',
            type: 'post',
            beforeSend: function () {
                //$("#resultado").html("Procesando, espere por favor...");
                
            },
            success: function (response) {
                 location.href = 'pago.jsp';
                 alert(response);

            }
        });
    });


</script>
<script>
        function calcularResta() {
            var num1 = parseFloat(document.getElementById('num1').value) || 0;
            var num2 = parseFloat(document.getElementById('num2').value) || 0;
            var resultado = num1 - num2;
            document.getElementById('resultado112').textContent = resultado;
        }
    </script>