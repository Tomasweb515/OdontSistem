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
      String nombre=(String)sesion.getAttribute("usser");
  String rol = (String) sesion.getAttribute("rol");
        String foto = (String) sesion.getAttribute("foto");
 String passw = (String) sesion.getAttribute("pass");
        Integer cont = (Integer) sesion.getAttribute("cont");

String codigo = request.getParameter("id");
                        //String codigo="13";
                        int prueba = Integer.parseInt(codigo);
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
            <form class="user" id="form" method="post">
    <input type="hidden" class="form-control" id="listar" name="listar" value="cargar">
    <input type="hidden" class="form-control" id="idcita" name="idcita">
                        <label for="field-12" class="control-label">Pacientes</label>
            <input type="text" class="form-control form-control-user" id="nombre" name="pa_nombre" placeholder="Nombre" readonly>
                        <input type="hidden" class="form-control" id="idpaciente" name="idpaciente" >
                        <input class="form-control" type="text"  name="pa_ci" id="pa_ci" autocomplete="off" placeholder="Cedula" readonly="readonly" required><small><span class="symbol required"></span> </small>

                        
                    <div class="form-group">
                        <label for="field-12" class="control-label">Fecha de Registro</label>
                        <input class="form-control" type="text" name="fecharegistro" id="fecharegistro" onKeyUp="" autocomplete="off" placeholder="Ingrese Fecha" value="<%= fechaFormateada%>" readonly>

                    </div>
       
    <input type="button" class="btn btn-primary" id="boton-aceptar" name="boton-aceptar" class="close" data-dismiss="modal" value="Reagengar"/>
</form>
        <h1>Lista de compras</h1>
        <button type="button" class="btn btn-primary" onclick="location.href = 'cita.jsp'">Nueva Compra</button>
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
    <input type="hidden" class="form-control" id="listar" name="listar" value="prueba">
    <input type="text" class="form-control" id="idcita" name="idcita">
    <div class="form-group row">
        <div class="col-sm-6 mb-3 mb-sm-0">
        </div>
       
    </div>
        <div class="form-group row">

        <div class="col-sm-6">
                        <label for="field-12" class="control-label">Fecha de Registro</label>
  <input type="date" id="fechaReserva" name="fecharegistro">

                    </div>
<div class="form-group">
                        <label for="field-12" class="control-label">hora </label>
                        <input class="form-control" type="time" name="hora" id="hora" onKeyUp="" autocomplete="off" placeholder="Ingrese hora" max="22:30" min="10:00">

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
        llenadocompra();
        llenado();
        ci();
        
    });
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
    
</script>
<script type="text/javascript">
        fechaReserva.min = new Date().toISOString().split("T")[0];
    </script>