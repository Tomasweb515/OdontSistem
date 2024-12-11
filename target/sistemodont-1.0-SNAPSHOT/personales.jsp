
<%@page import="java.math.BigInteger"%>
<%@page import="java.security.MessageDigest"%>
<%
HttpSession sesion = request.getSession(false); 
%>

<%
if (sesion == null || sesion.getAttribute("logueado") == null || sesion.getAttribute("logueado").equals("0")) {
    %>
    <script>
        alert('Su sesión ha expirado. Por favor, inicie sesión nuevamente.');
        window.location.href = "login.jsp";
    </script>
    <%
    return; 
}
           String nombre=(String)sesion.getAttribute("usser");
  String rol = (String) sesion.getAttribute("rol");
        String foto = (String) sesion.getAttribute("foto");
 String passw = (String) sesion.getAttribute("pass");
        Integer cont = (Integer) sesion.getAttribute("cont");%>

<%@include file="header.jsp"%>

<div class="card-body p-0">
    <!-- Nested Row within Card Body -->
    <div class="col-lg-7">

        <div class="col">
            <div class="p-5">
                <div class="text-center">
                    <h1 class="h4 text-gray-900 mb-4">Nuevo personales</h1>
                </div>
                <form class="user" id="form" method="post">
    <input type="hidden" class="form-control" id="listar" name="listar" value="cargar">
    <input type="hidden" class="form-control" id="idpersonal" name="idpersonal">
    <div class="form-group row">
        <div class="col-sm-6 mb-3 mb-sm-0">
            <input type="text" class="form-control" id="per_nombre" name="per_nombre" placeholder="Nombre">
            <small id="error-msg-nombre" style="color: red; display: none;">Ponlo bien papu</small>
        </div>
        <div class="col-sm-6">
            <input type="text" class="form-control" id="per_apellido" name="per_apellido" placeholder="Apellido">
            <small id="error-msg-apellido" style="color: red; display: none;">Ponlo bien papu</small>
        </div>
    </div>
    <div class="form-group row">
        <div class="col-sm-6 mb-3 mb-sm-0">
            <input type="email" class="form-control" id="per_correo" name="per_correo" placeholder="Correo electrónico">
            <small id="error-msg-telefono" style="color: red; display: none;">Ponlo bien papu</small>
        </div>
        <div class="col-sm-6">
            <input type="text" class="form-control" id="per_ci" name="per_ci" placeholder="Cédula">
            <small id="error-msg-ci" style="color: red; display: none;">Ponlo bien papu</small>
        </div>
    </div>
    <div class="form-group row">
        <div class="col-sm-6 mb-3 mb-sm-0">
            <input type="text" class="form-control" id="per_telefono" name="per_telefono" placeholder="Teléfono">
            <small id="error-msg-correo" style="color: red; display: none;">Ponlo bien papu</small>
        </div>
        <div class="col-sm-6">
            <div class="dropdown mb-4">
                <div class="col-sm-12">
                    <div class="form-group row">
                        <label for="ciudad">Ciudad</label>
                        <select class="js-states form-control" id="idciudad" name="idciudad">
                            <!-- Opciones dinámicas aquí -->
                        </select>
                        <small id="error-msg-ciudad" style="color: red; display: none;">Ponlo bien papu</small>
                    </div>
                </div>
                <div class="dropdown-menu animated--fade-in" aria-labelledby="dropdownMenuButton">
                    <a class="dropdown-item" href="#">Action</a>
                </div>
            </div>
        </div>
    </div>
    <input type="button" class="btn btn-primary" id="boton-aceptar" name="boton-aceptar" value="Guardar" />
        <input type="button" onclick="cancelar()" class="btn btn-danger" id="boton-cancelar" name="boton"  value="Cancelar" href="container.jsp" />
</form>


                <div id="mensaje"></div>
                <hr>
            </div>

        </div>

    </div>

</div>

    <div class="card shadow mb-4">
        <div class="card-header py-3">
            <h6 class="m-0 font-weight-bold text-primary">DataTables Example</h6>
        </div>
        <div class="card-body">
            <div class="table-responsive">
<div class="contenedor">
  <div class="derecha">                               <input type="text" class="form-control form-control-user" id="buscar" onkeyup="buscar()" placeholder="Buscar en tabla" title="Empieza a escribir para buscar">
</div>                                <table class="table table-bordered"  id="tabla" width="100%" data-sort="table">
                                 
                                    <a type="button" class="fa fa-print" href="rpaciente_4.jsp"></a>

                    <thead>
                        <tr>
                            <th>#</th>
                            <th>Nombre</th>
                            <th>Apellido</th><th>Telefono</th>
                            <th>Cedula</th>
                            
                            <th>Correo Electronico</th>
                            <th>Ciudad</th>
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
                    <input type="hidden" class="form-control " id="idpersonal_e" name="idpersonal_e">
                    desea eliminar
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">No</button>

                    <input type="button" class="btn btn-primary" data-bs-dismiss="modal" id="eliminaregistro" aria-label="Close" name="eliminaregistro" value="si"/>
                </div>
            </div>
        </div>
    </div>
    <%@include file="footer.jsp"%><!-- jQuery -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <!-- Select2 -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/js/select2.min.js"></script>

       <script>
      $("#idciudad").select2({
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
            rellenardatos();
            rellenarciudad();

        });
        function rellenarciudad() {

            $.ajax({
                data: {listar: 'listar'},
                url: 'jsp/ciudad.jsp',
                type: 'post',

                success: function (response) {
                    $("#idciudad").html('<option value="">Seleccionar ciudad</option>' + response);
                }
            });

        }
        function rellenardatos() {

            $.ajax({
                data: {listar: 'listar'},
                url: 'jsp/personalesM.jsp',
                type: 'post',

                success: function (response) {
                    $("#tabla tbody").html(response);
                }
            });

        }

        


   $("#eliminaregistro").on("click", function() {
    var listar = $("#listar_eliminar").val();
    var pk = $("#idpersonal_e").val();
    $.ajax({
        data: { listar: listar, idpersonal_e: pk },
        url: 'jsp/personalesM.jsp',
        type: 'post',
        success: function(response) {
            $("#mensaje").html(response);
            
            rellenardatos(); 
            setTimeout(function() {
                $("#mensaje").html("");
                $("#per_nombre").val("");
                     
                     
                $("#listar").val("cargar");
            }, 2000);
        }
    });
});

        function rellenaredit(a, b, c, f, e, d, r) {
            $("#idpersonal").val(a);
            $("#per_nombre").val(b);
            $("#per_apellido").val(c);
            $("#per_telefono").val(f);
            $("#per_ci").val(e);
            $("#per_correo").val(d);
            $("#idciudad").val(r);
            $("#listar").val("modificar");

        }

    </script>
    <script>
        $(document).ready(function() {
    function validateInput() {
        let isValid = true;

        const nombre = $('#per_nombre').val();
        if (!/^[A-Z][a-z]{2,}$/.test(nombre)) {
            $('#error-msg-nombre').text('El nombre debe empezar con mayúscula y tener al menos 3 letras.').show();
            isValid = false;
        } else {
            $('#error-msg-nombre').hide();
        }

        const apellido = $('#per_apellido').val();
        if (!/^[A-Z][a-z]{2,}$/.test(apellido)) {
            $('#error-msg-apellido').text('El apellido debe empezar con mayúscula y tener al menos 3 letras.').show();
            isValid = false;
        } else {
            $('#error-msg-apellido').hide();
        }

        const telefono = $('#per_telefono').val();
        if (!/^\d{10}$/.test(telefono)) {  
            $('#error-msg-telefono').text('El teléfono debe tener 10 dígitos.').show();
            isValid = false;
        } else {
            $('#error-msg-telefono').hide();
        }

        const ci = $('#per_ci').val();
        if (!/^\d{5,}$/.test(ci)) {  
            $('#error-msg-ci').text('La cédula debe tener al menos 5 dígitos.').show();
            isValid = false;
        } else {
            $('#error-msg-ci').hide();
        }

        const correo = $('#per_correo').val();
        if (!/^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$/.test(correo)) {
            $('#error-msg-correo').text('Por favor, ingresa un correo electrónico válido.').show();
            isValid = false;
        } else {
            $('#error-msg-correo').hide();
        }

        const ciudad = $('#idciudad').val();
        if (!ciudad) {
            $('#error-msg-ciudad').text('Debes seleccionar una ciudad.').show();
            isValid = false;
        } else {
            $('#error-msg-ciudad').hide();
        }

        $('#boton-aceptar').prop('disabled', !isValid);
    }

    $('#per_nombre, #per_apellido, #per_telefono, #per_ci, #per_correo, #idciudad').on('input change', function() {
        validateInput();
    });

  $("#boton-aceptar").on("click", function ()
        {
            dato = $("#form").serialize();
            $.ajax({
                data: dato,
                url: 'jsp/personalesM.jsp',
                type: 'post',

                success: function (response) {
                    $("#mensaje").html(response);
                    rellenardatos();
validateInput();

                    setTimeout(function () {

                        $("#mensaje").html("");
                        $("#per_nombre").val("");
                        $("#per_apellido").val("");
                        $("#per_telefono").val("");
                        $("#per_ci").val("");
                        $("#per_correo").val("");
                        $("#idciudad").val("");
                        $("#per_nombre").focus("");
                        $("#listar").val("cargar");
                    }, 2000);
                }
            });
        });
});

        
    </script>
   