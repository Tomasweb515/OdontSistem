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
}
  String rol = (String) sesion.getAttribute("rol");
        String foto = (String) sesion.getAttribute("foto");
 String passw = (String) sesion.getAttribute("pass");
        String nombre = (String) sesion.getAttribute("usser");
        Integer cont = (Integer) sesion.getAttribute("cont");
%>
<style>
    .ui-timepicker-container{position:absolute;overflow:hidden;box-sizing:border-box}.ui-timepicker,.ui-timepicker-viewport{box-sizing:content-box;height:205px;display:block;margin:0}.ui-timepicker{list-style:none;padding:0 1px;text-align:center}.ui-timepicker-viewport{padding:0;overflow:auto;overflow-x:hidden}.ui-timepicker-standard{font-family:Verdana,Arial,sans-serif;font-size:1.1em;background-color:#FFF;border:1px solid #AAA;color:#222;margin:0;padding:2px}.ui-timepicker-standard a{border:1px solid transparent;color:#222;display:block;padding:.2em .4em;text-decoration:none}.ui-timepicker-standard .ui-state-hover{background-color:#DADADA;border:1px solid #999;font-weight:400;color:#212121}.ui-timepicker-standard .ui-menu-item{margin:0;padding:0}.ui-timepicker-corners,.ui-timepicker-corners .ui-corner-all{-moz-border-radius:4px;-webkit-border-radius:4px;border-radius:4px}.ui-timepicker-hidden{display:none}.ui-timepicker-no-scrollbar .ui-timepicker{border:none}/*# sourceMappingURL=jquery.timepicker.min.css.map */
    
</style>
<%@include file="header.jsp" %>
<div class="content-wrapper">
    <section class="content">
        <form action="#" id="form" enctype="multipart/form-data" method="POST" role="form" class="form-horizontal form-groups-bordered">
            <input type="hidden" id="listar" name="listar" value="cargar"/>
            <h3><i></i>Reservar cita</h3><br>


            <div class="row">
                <div class="col-lg-3 ds">
                    <!--COMPLETED ACTIONS DONUTS CHART-->
                    <h5>DATOS DEL PACIENTE<i title="agregar" class="fas fa-plus" data-toggle="modal" data-target="#exampleModal"></i>

                    </h5>

                    <!-- First Action -->

                    <!-- First Action -->


                    <!-- First Action -->


                    <!-- Second Action -->

                    <div class="form-group">
                        <label for="field-12" class="control-label">Pacientes</label>
                               <select id="single" class="js-states form-control" name="idpaciente" onchange="dividirproveedor(this.value)">                         

                        </select>
                    </div>

                    <div class="form-group">
                        <label for="field-12" class="control-label">Documento</label>
                        <input type="hidden" id="codpaciente" name="codpaciente">
                        <input class="form-control" type="text" value="" name="pa_ci" id="pa_ci" onKeyUp="this.value = this.value.toUpperCase();" autocomplete="off" placeholder="Cedula" readonly="readonly" required><small><span class="symbol required"></span> </small>
                    </div>

                    <div class="form-group">
                        <label for="field-12" class="control-label">Fecha de Registro</label>
  <input type="date" id="fechaReserva" name="fecharegistro"  onKeyUp="" autocomplete="off" placeholder="Ingrese Fecha">

                    </div>
<div class="form-group">
                        <label for="field-12" class="control-label">hora </label>
    <input type="text" class="form-control" name="hora" id="hora" required>

                    </div>
                    <hr>
                    <br>
<div align="right">
                                        <button type="button" name="AgregaProductoCompra" value="agregar" id="AgregaProductoCompra" class="btn btn-primary" onclick=""><span class="fa fa-shopping"></span> Agregar</button>
                                       <div id="respuesta"></div>
                                    </div>
                </div><!-- /col-lg-3 -->

          
            </div>
            <!-- **********************************************************************************************************************************************************
          RIGHT SIDEBAR CONTENT
          *********************************************************************************************************************************************************** -->
        </form>
    </section>

</div>
<!-- Modal -->

<%@include file="footer.jsp" %>

<script src="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.js"></script>
<script>

    $(document).ready(function () {
        buscarproveedor();
        buscardoctor();
        rellenarciudad();
    });
    

    function rellenarciudad(){
           
            $.ajax({
                data: {listar:'listar' },
            url:'jsp/ciudad.jsp',
            type: 'post',
           
            success: function(response){
            $("#idciudad").html('<option value="">Seleccionar ciudad</option>' + response);
            }          
        });
    
       }
       // JavaScript para mostrar TimePicker en input llamado "hora"

    function buscarproveedor() {
        $.ajax({
            data: {listar: 'buscarproveedor'},
            url: 'jsp/buscar1.jsp',
            type: 'post',
            beforeSend: function () {
                // $("#resultado").html("Procesando, espere por favor...");
            },
            success: function (response) {
                $("#single").html(response);
            }
        });
    }
    $(function(){

  $('#hora').timepicker({
    timeFormat: 'HH:mm',
    interval: 30,
    minTime: '08:00',
    maxTime: '17:00',
    startTime: '12:00',
    dynamic: true,
    dropdown: true,
    scrollbar: true,
    zindex: 9999999
  });



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
                $("#singl").html(response);
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
            url: 'jsp/control1.jsp',
            type: 'post',
            beforeSend: function () {
                //$("#resultado").html("Procesando, espere por favor...");
            },
            success: function (response) {
                $("#respuesta").html(response);
               location.href = 'reserva.jsp';
                cargardetalle();
                
                                      $("#idpaciente").select2("");
    
                                          $("#fecharegistro").datepicker("");

                     $("#codpaciente").select2("");
                     $("#hora").val("");
                     $("#pa_ci").val("");
location.href = 'reserva.jsp';
            }
        });
    });

    function cargardetalle() {
        $.ajax({
            data: {listar: 'listar'},
            url: 'jsp/control1.jsp',
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
            url: 'jsp/control1.jsp',
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
            url: 'jsp/control1.jsp',
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
            url: 'jsp/control1.jsp',
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
            url: 'jsp/control1.jsp',
            type: 'post',
            beforeSend: function () {
                //$("#resultado").html("Procesando, espere por favor...");
            },
            success: function (response) {
                location.href = 'listar.jsp';

            }
        });
    });
</script>
<script type="text/javascript">
        fechaReserva.min = new Date().toISOString().split("T")[0];
    </script>