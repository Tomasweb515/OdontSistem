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
        <h1>Lista de Consultas</h1>
          <form id="form" action="reportfactu_2_1.jsp" method="POST" class="form-horizontal form-groups-bordered">
    <div class="form-group row">
        <div class="col-sm-3">
            <input type="date" id="fechainicio" name="fechainicio" class="form-control" required>
        </div>
        <div class="col-sm-3">
            <input type="date" id="fechafinal" name="fechafinal" class="form-control" required>
        </div>
        <div class="col-sm-3">
            <select class="form-control" id="estado" name="estado" required>
                
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
                    <th scope="col">Fecha</th>
                    <th scope="col">Paciente</th>
                    <th scope="col">Total</th>
                    <th scope="col">Accion</th>
                </tr>
            </thead>
            <tbody id="resultadocompra">

            </tbody>
        </table>
    </section>
</div>
<div id="mensaje"></div>


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
              
                  <div class="form-group">
                        <label for="field-12" class="control-label">Metodo de pago</label>
                        <input type="text" class="form-control" id="hora" name="hora" value="<%= fechaFormateada%>" >
                        <input type="t" class="form-control" id="pagar" name=pagar">
                        
                        <input type="t" class="form-control" id="pa_motivo" name="pa_motivo" value="Pago de servicio odontologico" >
<select class="js-states form-control" name="" id="">
    <option value="">Seleccione una opcion</option>
        <option value="Efectivo">Efectivo</option>
    <option value="Tarjeta">Tarjeta de debito</option>

        
                                                </select>
                    </div>
                                                          <div class="form-group">
                        <label for="field-12" class="control-label">Condicion de pago</label>
<select class="js-states form-control" name="" id="">
    <option value="">Seleccione una opcion</option>
        <option value="Contado">Contado</option>
    <option value="Credito">Cuota</option>

        
                                                </select>                    </div>
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
 <div class="form-group">
                        <label for="field-12" class="control-label">Pagar</label>
                        <input type="hidden" class="form-control form-control-user" id="numero1" name="pa_precio" placeholder="pagar" onchange="sumar();">
                    </div>
                    <div class="form-group">
                        <label for="field-12" class="control-label">Vuelto</label>
                        <input type="text" class="form-control form-control-user" id="resultado" name="vuelto" placeholder="Vuelto"  readonly>
                    </div>


                    <hr>
                    <br>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">NO</button>
                <button type="button" class="btn btn-primary" data-dismiss="modal" id="compra">SI</button>
            </div>
        </div>
    </div>
</div>
<%@include file="footer.jsp" %>
<script>
    // si la respuesta que se espera es sumar
    function sumar(){
        var numero1 = document.getElementById('numero1').value;
        var numero2 = document.getElementById('numero2').value;

        if(numero1!=='' && numero2!==''){
            var resultado = parseInt(numero1)-((parseInt(numero2)));
            document.getElementById('resultado').value = resultado;
        }
    }
</script>
<script>
    $(document).ready(function () {
        llenadocompras();
        
    });
   
    function llenadocompras() {
        $.ajax({
            data: {listar: 'listarcompras'},
             url: 'jsp/control.jsp',
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
 function  pagar() {
        $.ajax({
                     
            data: {listar: 'listarpagar'},
            url: 'jsp/control_2.jsp',
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
        idpk = $("#caja").val();
        $.ajax({
            data: {listar: 'compras',idpkcompra:idpkcompra,idpk:idpk},
            url: 'jsp/control_1.jsp',
            type: 'post',
            beforeSend: function () {
                //$("#resultado").html("Procesando, espere por favor...");
            },
            success: function (response) {
                llenadocompras();
                
                $("#mensaje").html(response);
                  setTimeout(function() {
                $("#mensaje").html("");
                
            }, 2000);
                                 //sumador();

            }
        });
    });
     function esp() {
        $.ajax({
            data: {listar: 'esp'},
             url: 'jsp/precaja.jsp',
            type: 'post',
            beforeSend: function () {
                //$("#resultado").html("Procesando, espere por favor...");
            },
            success: function (response) {
                $("#caja").val(response);
                //sumador();

            }
        });
    }
</script>
