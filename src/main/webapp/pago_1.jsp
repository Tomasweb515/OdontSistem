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


<%@include file="header.jsp" %>
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
        <h1>Informe de Pago</h1>
                        <form action="#" id="form" enctype="multipart/form-data" method="POST" role="form" class="form-horizontal form-groups-bordered">
                    <input type="hidden" class="form-control " id="listar" name="listar" value="imforme">

         <div class="form-group row">
                        <div class="col-sm-3">
          <input type="date" id="fechainicio" name="fechainicio" class="form-control" onKeyUp="" autocomplete="off" placeholder="Ingrese Fecha">
                        </div>
                        <div class="col-sm-3">
  <input type="date" id="fechafinal" name="fechafinal" class="form-control" onKeyUp="" autocomplete="off" placeholder="Ingrese Fecha">
                        </div>
             <div class="col-sm-3">
                 <select class="form-control" id="estado" name="estado">
                                            <option value="Emitido">Emitido</option>
                                            <option value="Procesando">Procesando</option>

                                        </select>

</div>                    <input type="button" class="btn btn-primary" id="boton-aceptar" name="boton-aceptar" value="Guardar"/>

                    </div>

                </form>         <table class="table">
            <thead>
                <tr>
                    <th scope="col">Ref.</th>
                    <th scope="col">Fecha</th>
                    <th scope="col">Paciente</th>
                    <th scope="col">Total</th>
                    <th scope="col">Pagos Estado</th>
                    <th scope="col">Pago</th>
                    
                </tr>
            </thead>
            <tbody id="resultadocompra">

            </tbody>
        </table>
    </section>
</div>



<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Eliminar</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                Esta seguro de querer eliminar?
                <input type="hidden" name="pkanul" id="pkanul"/>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">NO</button>
                <button type="button" class="btn btn-primary" data-dismiss="modal" id="anulcompra">SI</button>
            </div>
        </div>
    </div>
</div>

<!-- Modal -->
<div class="modal fade" id="CompraModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Pago</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                Estas seguro que quieres confirmar el pago?
                <input type="hidden" name="pkanul" id="pkanul"/>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">NO</button>
                <button type="button" class="btn btn-primary" data-dismiss="modal" id="compra">SI</button>
            </div>
        </div>
    </div>
</div>
<!-- Buttons -->

<%@include file="footer.jsp" %>
<script>
    $(document).ready(function () {
    });
    function llenadocompras() {
        fechaini = $("#fechainicio").val();
        fechafin = $("#fechafinal").val();
        estado = $("#estado").val();
        $.ajax({
            data: {listar: 'informe',fechaini:fechaini,fechafin:fechafin,estado:estado},
             url: 'jsp/control_1.jsp',
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

    $("#anulcompra").click(function () {
        idpkcompra = $("#pkanul").val();
        $.ajax({
            data: {listar: 'anularcompras',idpkcompra:idpkcompra},
            url: 'jsp/control.jsp',
            type: 'post',
            beforeSend: function () {
                //$("#resultado").html("Procesando, espere por favor...");
            },
            success: function (response) {
                llenadocompras();
                //sumador();

            }
        });
    });
     $("#compra").click(function () {
        idpkcompra = $("#pkanul").val();
        $.ajax({
            data: {listar: 'compras',idpkcompra:idpkcompra},
            url: 'jsp/control_1.jsp',
            type: 'post',
            beforeSend: function () {
                //$("#resultado").html("Procesando, espere por favor...");
            },
            success: function (response) {
                llenadocompras();
                                //sumador();

            }
        });
    });
    $("#boton-aceptar").click(function () {
        fechaini = $("#fechainicio").val();
        fechafin = $("#fechafinal").val();
        estado = $("#estado").val();
        $.ajax({
            data: {listar: 'imforme',fechaini:fechaini,fechafin:fechafin,estado:estado
            },
            url: 'jsp/control_1.jsp',
            type: 'post',
            beforeSend: function () {
                //$("#resultado").html("Procesando, espere por favor...");
            },
            success: function (response) {
                
                              $("#resultadocompra").html(response);
                                //sumador();

            }
        });
    });
    
</script>
