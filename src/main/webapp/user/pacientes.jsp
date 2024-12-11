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
%>


<%@include file="header.jsp"%>
<div class="card-body p-0">
                <!-- Nested Row within Card Body -->
                <div class="col-lg-7">
                   
                    <div class="col">
                        <div class="p-5">
                            <div class="text-center">
                                <h1 class="h4 text-gray-900 mb-4">Nuevo Paciente</h1>
                            </div>
                          <form class="user" id="form" method="post">
    <input type="hidden" class="form-control" id="listar" name="listar" value="cargar">
    <input type="hidden" class="form-control" id="idpaciente" name="idpaciente">
    <div class="form-group row">
        <div class="col-sm-6 mb-3 mb-sm-0">
            <input type="text" class="form-control form-control-user" id="pa_nombre" name="pa_nombre" placeholder="Nombre">
            <small id="error-msg-nombre" style="color: red; display: none;">Nombre debe empezar con mayúscula y tener al menos 3 letras.</small>
        </div>
        <div class="col-sm-6">
            <input type="text" class="form-control form-control-user" id="pa_apellido" name="pa_apellido" placeholder="Apellido">
            <small id="error-msg-apellido" style="color: red; display: none;">Apellido debe empezar con mayúscula y tener al menos 3 letras.</small>
        </div>
    </div>
    <div class="form-group row">
        <div class="col-sm-6 mb-3 mb-sm-0">
            <input type="text" class="form-control form-control-user" id="pa_telefono" name="pa_telefono" placeholder="Teléfono">
            <small id="error-msg-telefono" style="color: red; display: none;">Teléfono debe contener solo números.</small>
        </div>
        <div class="col-sm-6">
            <input type="text" class="form-control form-control-user" id="pa_ci" name="pa_ci" placeholder="Cédula">
            <small id="error-msg-ci" style="color: red; display: none;">Cédula debe contener solo números.</small>
        </div>
    </div>
    <div class="form-group row">
        <div class="col-sm-6">
            <input type="email" class="form-control form-control-user" id="pa_correo" name="pa_correo" placeholder="Correo electrónico">
            <small id="error-msg-correo" style="color: red; display: none;">Correo electrónico no es válido.</small>
        </div>
        <div class="col-sm-6">
            <div class="dropdown mb-4">
                <div class="col-sm-6">
                    <div class="form-group row">
                        <label for="ciudad">Ciudad</label>
                        <select class="form-control" id="idciudad" name="idciudad">
                            <option value="">Seleccionar ciudad</option>
                            <!-- Opciones dinámicas aquí -->
                        </select>
                        <small id="error-msg-ciudad" style="color: red; display: none;">Debes seleccionar una ciudad.</small>
                    </div>
                </div>
                <div class="dropdown-menu animated--fade-in" aria-labelledby="dropdownMenuButton">
                    <a class="dropdown-item" href="#">Action</a>
                </div>
            </div>
        </div>
    </div>
    <input type="button" class="btn btn-primary" id="boton-aceptar" name="boton-aceptar" value="Guardar"/>
    <input type="button" class="btn btn-primary" id="boton-cancelar" name="boton" value="Aceptar"/>
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
                                <table class="table table-bordered" id="resultado" width="100%" cellspacing="0">
                                    

                                    <thead>
                                        <tr>
                                            <th>#</th>
                                            <th>Nombre</th>
                                            <th>Apellido</th>
                                            <th>Telefono</th>
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
    <input type="hidden" class="form-control " id="idpaciente_e" name="idpaciente_e">
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
        rellenarciudad();
        validateInput();
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
       
       function rellenardatos(){
           
            $.ajax({
                data: {listar:'listar' },
            url:'jsp/pacientesM.jsp',
            type: 'post',
           
            success: function(response){
                $("#resultado tbody").html(response); 
            }         
        });
    
       }
   
       $("#boton-aceptar").on("click",function()
       {
           dato=$("#form").serialize();
           $.ajax({
            data:dato,
            url:'jsp/pacientesM.jsp',
            type: 'post',
           
            success: function(response){
                $("#mensaje").html(response); 
                 rellenardatos();
               
                 
                 setTimeout(function(){
                     
                     $("#mensaje").html("");
                     $("#pa_nombre").val("");
                     $("#pa_apellido").val("");
                     $("#pa_telefono").val("");
                     $("#pa_ci").val("");
                     $("#pa_correo").val("");
                     $("#ciudadselect").val("");
                     $("#pa_nombre").focus("");
                      $("#listar").val("cargar");
                 },2000);
            } 
           });
           });
       
           
$("#eliminaregistro").on("click", function() {
    var listar = $("#listar_eliminar").val();
    var pk = $("#idpaciente_e").val();
    $.ajax({
        data: { listar: listar, idpaciente_e: pk },
        url: 'jsp/pacientesM.jsp',
        type: 'post',
        success: function(response) {
            $("#mensaje").html(response);
            rellenardatos(); 
            setTimeout(function() {
                $("#mensaje").html("");
                $("#pa_nombre").val("");
                     $("#pa_apellido").val("");
                     $("#pa_telefono").val("");
                     $("#pa_ci").val("");
                     $("#pa_correo").val("");
                     $("#ciudad").val("");
                $("#listar").val("cargar");
            }, 2000);
        }
    });
});

           function rellenaredit(a,b,c,f,e,d,r){
           $("#idpaciente").val(a);
           $("#pa_nombre").val(b);
           $("#pa_apellido").val(c);
           $("#pa_telefono").val(d);
           $("#pa_ci").val(e);
           $("#pa_correo").val(f);
           $("#idciudad").val(r);
           $("#listar").val("modificar");
    
       }
       
    </script>
    <script>
   $(document).ready(function() {
    function validateInput() {
        let isValid = true;

        // Validación para Nombre
        const nombre = $('#pa_nombre').val();
        if (!/^[A-Z][a-z]{2,}$/.test(nombre)) {
            $('#error-msg-nombre').text('Nombre debe empezar con mayúscula y tener al menos 3 letras.').show();
            isValid = false;
        } else {
            $('#error-msg-nombre').hide();
        }

        // Validación para Apellido
        const apellido = $('#pa_apellido').val();
        if (!/^[A-Z][a-z]{2,}$/.test(apellido)) {
            $('#error-msg-apellido').text('Apellido debe empezar con mayúscula y tener al menos 3 letras.').show();
            isValid = false;
        } else {
            $('#error-msg-apellido').hide();
        }

        // Validación para Teléfono
        const telefono = $('#pa_telefono').val();
        if (!/^\d+$/.test(telefono)) {  // Solo números
            $('#error-msg-telefono').text('Teléfono debe contener solo números.').show();
            isValid = false;
        } else {
            $('#error-msg-telefono').hide();
        }

        // Validación para Cédula
        const ci = $('#pa_ci').val();
        if (!/^\d+$/.test(ci)) {  // Solo números
            $('#error-msg-ci').text('Cédula debe contener solo números.').show();
            isValid = false;
        } else {
            $('#error-msg-ci').hide();
        }

        // Validación para Correo Electrónico
        const correo = $('#pa_correo').val();
        if (!/^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$/.test(correo)) {
            $('#error-msg-correo').text('Correo electrónico no es válido.').show();
            isValid = false;
        } else {
            $('#error-msg-correo').hide();
        }

        // Validación para Ciudad (select)
        const ciudad = $('#idciudad').val();
        if (!ciudad) {
            $('#error-msg-ciudad').text('Debes seleccionar una ciudad.').show();
            isValid = false;
        } else {
            $('#error-msg-ciudad').hide();
        }

        // Habilitar/Deshabilitar botón de guardar
        $('#boton-aceptar').prop('disabled', !isValid);
    }

    // Evento de entrada en los campos de texto y el select
    $('#pa_nombre, #pa_apellido, #pa_telefono, #pa_ci, #pa_correo, #idciudad').on('input change', function() {
        validateInput();
    });
$("#boton-aceptar").on("click",function()
       {
           dato=$("#form").serialize();
           $.ajax({
            data:dato,
            url:'jsp/pacientesM.jsp',
            type: 'post',
           
            success: function(response){
                $("#mensaje").html(response); 
                 rellenardatos();
               
                 
                 setTimeout(function(){
                     
                     $("#mensaje").html("");
                     $("#pa_nombre").val("");
                     $("#pa_apellido").val("");
                     $("#pa_telefono").val("");
                     $("#pa_ci").val("");
                     $("#pa_correo").val("");
                     $("#ciudadselect").val("");
                     $("#pa_nombre").focus("");
                      $("#listar").val("cargar");
                 },2000);
            } 
           });
           });
  
});

    
    </script>