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


<%@include file="header.jsp"%>
<div class="card-body p-0">
    <!-- Nested Row within Card Body -->
    <div class="col-lg-7">

        <div class="col">
            <div class="p-5">
                <div class="text-center">
                    <h1 class="h4 text-gray-900 mb-4">Nuevo especialidad</h1>
                </div>
                <form class="user" name="form" id="form" method="post">
                    <input type="hidden" class="form-control" id="listar" name="listar" value="cargar">
                    <input type="hidden" class="form-control" id="idespecialidad" name="idespecialidad">

                    <div class="form-group row">
                        <div class="col-sm-6 mb-3 mb-sm-0">
                            <input type="text" class="form-control" validation-type="letters" alert-message="Ponlo bien papu" id="esp_nombre" name="esp_nombre" placeholder="Nombre">
                            <small id="error-msg-nombre" style="color: red; display: none;">Ponlo bien papu</small>
                        </div>
                    </div>



                    <input type="button" class="btn btn-primary" id="boton-aceptar" name="boton-aceptar" value="Guardar"/>
        <input type="button" onclick="cancelar()" class="btn btn-danger" id="boton-cancelar" name="boton"  value="Cancelar" href="container.jsp" />
                </form>



                <div id="mensaje"></div>
                <hr>
            </div>

        </div>

    </div>

</div><div class="container-fluid">

    <div class="card shadow mb-4">
        <div class="card-header py-3">
            <h6 class="m-0 font-weight-bold text-primary">DataTables Example</h6>
        </div>
        <div class="card-body">
            <div class="table-responsive">
<div class="contenedor">
  <div class="derecha">                               <input type="text" class="form-control form-control-user" id="buscar" onkeyup="buscar()" placeholder="Buscar en tabla" title="Empieza a escribir para buscar">
</div>                                <table class="table table-bordered"  id="tabla" width="100%" data-sort="table">
                                 
                                    <a type="button" class="fa fa-print" href="rpaciente_7.jsp"></a>

                    <thead>
                        <tr>
                            <th>#</th>
                            <th>Nombre</th>

                            <th>Opciones</th>
                        </tr>
                    </thead>

                    <tbody>

                    </tbody>
                </table>
            </div>
        </div>
    </div>
    <!-- Modal -->
    <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h1 class="modal-title fs-5" id="exampleModalLabel">Modal title</h1>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <input type="hidden" class="form-control " id="listar_eliminar" name="listar_eliminar" value="eliminar">
                    <input type="hidden" class="form-control " id="idespecialidad_e" name="idespecialidad_e">
                    desea eliminar
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">No</button>

                    <input type="button" class="btn btn-primary" data-bs-dismiss="modal" id="eliminaregistro" aria-label="Close" name="eliminaregistro" value="si"/>
                </div>
            </div>
        </div>
    </div>
    <%@include file="footer.jsp"%>
    <script>
        $(document).ready(function(){
        rellenardatos();
        });
        
        function rellenardatos(){

        $.ajax({
        data: {listar:'listar' },
                url:'jsp/especialidadesM.jsp',
                type: 'post',
                success: function(response){
                $("#tabla tbody").html(response);
                }
        });
        }



        $("#eliminaregistro").on("click", function() {
        var listar = $("#listar_eliminar").val();
        var pk = $("#idespecialidad_e").val();
        $.ajax({
        data: { listar: listar, idespecialidad_e: pk },
                url: 'jsp/especialidadesM.jsp',
                type: 'post',
                success: function(response) {
                $("#mensaje").html(response);
                rellenardatos();
                setTimeout(function() {
                $("#mensaje").html("");
                $("#esp_nombre").val("");
                $("#listar").val("cargar");
                }, 2000);
                }
        });
        });
        function rellenaredit(a, b){
        $("#idespecialidad").val(a);
        $("#esp_nombre").val(b);
        $("#listar").val("modificar");
        }

    </script>	
    <script>
        $(document).ready(function() {
        function validateInput() {
        let isValid = true;
        const nombre = $('#esp_nombre').val();
        if (!/^[A-Za-z\s]+$/.test(nombre)) {
        $('#error-msg-nombre').text('Ponlo bien papu').show();
        isValid = false;
        } else {
        $('#error-msg-nombre').hide();
        }


        $('#boton-aceptar').prop('disabled', !isValid);
        }

        $('#esp_nombre').on('input change', function() {
                validateInput();
        });
        $("#boton-aceptar").on("click", function()
        {
        dato = $("#form").serialize();
        $.ajax({
        data:dato,
                url:'jsp/especialidadesM.jsp',
                type: 'post',
                success: function(response){
                $("#mensaje").html(response);
                rellenardatos();
                setTimeout(function(){

                $("#mensaje").html("");
                $("#esp_nombre").val("");
                $("#esp_nombre").focus("");
                $("#listar").val("cargar");
                }, 2000);
                }
        });
        });
        });

    </script>

