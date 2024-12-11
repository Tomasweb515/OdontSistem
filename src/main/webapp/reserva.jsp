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
        Integer cont = (Integer) sesion.getAttribute("cont");
%><%@include file="header.jsp" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
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
        <h1>Lista de reserva cita
        </h1><a href="cita.jsp" class="btn btn-primary">Reservar cita</a>
  <form id="form" action="reportfactu_2.jsp" method="POST" class="form-horizontal form-groups-bordered">
    <div class="form-group row">
        <div class="col-sm-3">
            <input type="date" id="fechainicio" name="fechainicio" class="form-control" required>
        </div>
        <div class="col-sm-3">
            <input type="date" id="fechafinal" name="fechafinal" class="form-control" required>
        </div>
        <div class="col-sm-3">
            <select class="form-control" id="estado" name="estado" required>
                <option value="Pendiente">Pendiente</option>
                <option value="Finalizado">Finalizado</option>
                <option value="Cancelado">Cancelado</option>
            </select>
        </div>
        <div class="col-sm-3">
            <button type="submit" class="btn btn-primary">Generar Informe</button>
        </div>
    </div>
</form>

        <table class="table">
            <thead>
                <tr>
                    <th scope="col">Ref.</th>
                    <th scope="col">Estado</th>
                    <th scope="col">Paciente</th>
                    <th scope="col">Fecha Agendada</th>
                    <th scope="col">Hora Agendada</th>
                    <th scope="col">Accion</th>
                </tr>
            </thead>
            <tbody id="resultadocompra">

            </tbody>
        </table>
    </section>
</div>
<!-- Modal -->
<div class="modal fade" id="editModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Reagendar</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
               <form class="user" id="form" method="post">
    <input type="hidden" class="form-control" id="listar" name="listar" value="cargar">
    <input type="hidden" class="form-control" id="idcita" name="idcita">
    <div class="form-group row">
        <div class="col-sm-6 mb-3 mb-sm-0">
            <input type="text" class="form-control form-control-user" id="pa_nombre" name="pa_nombre" placeholder="Nombre" readonly>
        </div>
       
    </div>
        <div class="form-group row">

        <div class="col-sm-6">
                        <label for="field-12" class="control-label">Fecha de Registro</label>
  <input type="date" id="fechaReserva" name="fecharegistro">

                    </div>
<div class="form-group">
                        <label for="field-12" class="control-label">hora </label>
    <input type="text" class="form-control" name="hora" id="hora" required>

                    </div>
    </div>
    <input type="button" class="btn btn-primary" id="boton-aceptar" name="boton-aceptar" class="close" data-dismiss="modal" value="Reagengar"/>
</form>
            </div>
            
        </div>
    </div>
</div>


<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Eliminar Compra</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                Esta seguro de querer eliminar la compra?
                <input type="hidden" name="pkanul" id="pkanul"/>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">NO</button>
                <button type="button" class="btn btn-primary" data-dismiss="modal" id="cancelar-compra">SI</button>
            </div>
        </div>
    </div>
</div>

<%@include file="footer.jsp" %>
<script>
    $(document).ready(function () {
        llenadocompras();
    });
    function llenadocompras() {
        $.ajax({
            data: {listar: 'listarcompras'},
             url: 'jsp/control1.jsp',
            type: 'post',
            beforeSend: function () {
                //$("#resultado").html("Procesando, espere por favor...");
            },
            success: function (response) {
                $("#resultadocompra").html(response);
                //sumador();

            }
        });
    }

   $("#cancelar-compra").click(function () {
        $.ajax({
            data: {listar: 'cancelcompra'},
            url: 'jsp/control1.jsp',
            type: 'post',
            beforeSend: function () {
                //$("#resultado").html("Procesando, espere por favor...");
            },
            success: function (response) {
llenadocompras();
            }
        });
    });
    
      $("#boton-aceptar").on("click",function()
       {
           dato=$("#form").serialize();
           $.ajax({
            data:dato,
            url:'jsp/control1.jsp',
            type: 'post',
           
            success: function(response){
                $("#mensaje").html(response); 
llenadocompras();                 
                 
                 setTimeout(function(){
                     
                     $("#pa_nombre").val("");
                     $("#fechaReserva").val("");
                     $("#hora").val("");
                     
                      $("#listar").val("cargar");
                 },2000);
            } 
           });
           });
     function rellenaredit(a,b,c,e){
           $("#pa_nombre").val(b);
           $("#fechaReserva").val(c);
           $("#hora").val(e);
            $("#idcita").val(a);
           $("#listar").val("modificar");
    
       }
      $(function(){

  $('#hora').timepicker({
    timeFormat: 'HH:mm',
    interval: 30,
    minTime: '08:00',
    maxTime: '17:00',
   
    dynamic: true,
    dropdown: true,
    scrollbar: true,
    zindex: 9999999
  });



});
</script>
<script type="text/javascript">
        fechaReserva.min = new Date().toISOString().split("T")[0];
    </script>