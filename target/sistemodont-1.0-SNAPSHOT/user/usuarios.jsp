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
                                <h1 class="h4 text-gray-900 mb-4">Nuevo usuario</h1>
                            </div>
                               <form class="user" id="form" method="post">
            <input type="hidden" class="form-control" id="listar" name="listar" value="cargar">
            <input type="hidden" class="form-control" id="idusuario" name="idusuario">
            
            <div class="form-group row">
                <div class="col-sm-6 mb-3 mb-sm-0">
                    <input type="text" class="form-control form-control-user" id="usu_nombre" name="usu_nombre" placeholder="Nombre">
                    <small id="error-msg-nombre" class="error-msg">El nombre debe empezar con mayúscula y tener al menos 3 letras.</small>
                </div>
                <div class="col-sm-6">
                    <input type="password" class="form-control form-control-user" id="usu_clave" name="usu_clave" placeholder="Clave">
                    <small id="error-msg-clave" class="error-msg">La clave debe tener al menos 6 caracteres.</small>
                </div>
            </div>
            
            <div class="form-group row">
                <div class="col-sm-6 mb-3 mb-sm-0">
                    <input type="text" class="form-control form-control-user" id="usu_estado" name="usu_estado" placeholder="Estado">
                    <small id="error-msg-estado" class="error-msg">El estado debe contener solo letras y espacios.</small>
                </div>
                <div class="col-sm-6">
                    <input type="text" class="form-control form-control-user" id="usu_tipo" name="usu_tipo" placeholder="Tipo">
                    <small id="error-msg-tipo" class="error-msg">El tipo debe contener solo letras y espacios.</small>
                </div>
            </div>
            
            <div class="form-group row">
                <div class="col-sm-6">
                    <div class="form-group row">
                        <label for="idpersonal">Personal</label>
                        <select class="form-control" id="idpersonal" name="idpersonal">
                            <option value="">Seleccionar personal</option>
                            <!-- Aquí puedes agregar las opciones dinámicamente con JavaScript o desde el servidor -->
                        </select>
                        <small id="error-msg-personal" class="error-msg">Debes seleccionar un personal.</small>
                    </div>
                </div>
            </div>
            
            <input type="button" class="btn btn-primary" id="boton-aceptar" name="boton-aceptar" value="Guardar" disabled/>
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
                                            <th>clave</th>
                                            <th>estado</th>
                                            <th>tipo</th>
                                           
                                            <th>personal</th>
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
<%@include file="footer.jsp"%>
<script>
      $(document).ready(function(){
        rellenardatos();
        rellenarper();
        
    });
      function rellenarper(){
           
            $.ajax({
                data: {listar:'listar' },
            url:'jsp/usuario.jsp',
            type: 'post',
           
            success: function(response){
            $("#idpersonal").html('<option value="">Seleccionar personal</option>' + response);
            }          
        });
    
       }
       function rellenardatos(){
           
            $.ajax({
                data: {listar:'listar' },
            url:'jsp/usuariosM.jsp',
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
            url:'jsp/usuariosM.jsp',
            type: 'post',
           
            success: function(response){
                $("#mensaje").html(response); 
                 rellenardatos();
                 
                 
                 setTimeout(function(){
                     
                     $("#mensaje").html("");
                     $("#usu_nombre").val("");
                     $("#usu_clave").val("");
                     $("#usu_estado").val("");
                     $("#usu_tipo").val("");
                    
                     $("#idpersonal").val("");
                     $("#usu_nombre").focus("");
                     validateInput();
                      $("#listar").val("cargar");
                 },2000);
            } 
           });
           });
           
           
$("#eliminaregistro").on("click", function() {
    var listar = $("#listar_eliminar").val();
    var pk = $("#idusuario_e").val();
    $.ajax({
        data: { listar: listar, idpaciente_e: pk },
        url: 'jsp/usuariosM.jsp',
        type: 'post',
        success: function(response) {
            $("#mensaje").html(response);
            rellenardatos(); 
            setTimeout(function() {
                $("#mensaje").html("");
                $("#usu_nombre").val("");
                     $("#usu_clave").val("");
                     $("#usu_estado").val("");
                     $("#usu_tipo").val("");
                     validateInput();
                     
                $("#listar").val("cargar");
            }, 2000);
        }
    });
});

           function rellenaredit(a,b,c,e,d,r){
           $("#idusuario").val(a);
           $("#usu_nombre").val(b);
           $("#usu_clave").val(c);
           $("#usu_estado").val(d);
           $("#usu_tipo").val(e);
           
           $("#idpersonal").val(r);
           $("#listar").val("modificar");
    
       }
       
    </script>
<script>
    $(document).ready(function() {
    function validateInput() {
        let isValid = true;

        // Validación para Nombre
        const nombre = $('#usu_nombre').val();
        if (!/^[A-Z][a-z]{2,}$/.test(nombre)) {
            $('#error-msg-nombre').text('El nombre debe empezar con mayúscula y tener al menos 3 letras.').show();
            isValid = false;
        } else {
            $('#error-msg-nombre').hide();
        }

        // Validación para Clave
        const clave = $('#usu_clave').val();
        if (clave.length < 6) {
            $('#error-msg-clave').text('La clave debe tener al menos 6 caracteres.').show();
            isValid = false;
        } else {
            $('#error-msg-clave').hide();
        }

        // Validación para Estado
        const estado = $('#usu_estado').val();
        if (!/^[A-Za-z\s]+$/.test(estado)) {  // Solo letras y espacios
            $('#error-msg-estado').text('El estado debe contener solo letras y espacios.').show();
            isValid = false;
        } else {
            $('#error-msg-estado').hide();
        }

        // Validación para Tipo
        const tipo = $('#usu_tipo').val();
        if (!/^[A-Za-z\s]+$/.test(tipo)) {  // Solo letras y espacios
            $('#error-msg-tipo').text('El tipo debe contener solo letras y espacios.').show();
            isValid = false;
        } else {
            $('#error-msg-tipo').hide();
        }

        // Validación para Personal (select)
        const personal = $('#idpersonal').val();
        if (!personal) {
            $('#error-msg-personal').text('Debes seleccionar un personal.').show();
            isValid = false;
        } else {
            $('#error-msg-personal').hide();
        }

        // Habilitar/Deshabilitar botón de guardar
        $('#boton-aceptar').prop('disabled', !isValid);
    }

    // Añadir mensajes de error en el HTML
    const formGroupRow = $('.form-group.row');
    formGroupRow.each(function() {
        $(this).append('<small class="error-msg" style="color: red; display: none;"></small>');
    });

    // Eventos para validar en tiempo real
    $('#usu_nombre, #usu_clave, #usu_estado, #usu_tipo, #idpersonal').on('input change', function() {
        validateInput();
    });

 $("#boton-aceptar").on("click",function()
       {
           dato=$("#form").serialize();
           $.ajax({
            data:dato,
            url:'jsp/usuariosM.jsp',
            type: 'post',
           
            success: function(response){
                $("#mensaje").html(response); 
                 rellenardatos();
                 validateInput();
                 
                 setTimeout(function(){
                     
                     $("#mensaje").html("");
                     $("#usu_nombre").val("");
                     $("#usu_clave").val("");
                     $("#usu_estado").val("");
                     $("#usu_tipo").val("");
                    
                     $("#idpersonal").val("");
                     $("#usu_nombre").focus("");
                      $("#listar").val("cargar");
                 },2000);
            } 
           });
           });
           
    
</script>