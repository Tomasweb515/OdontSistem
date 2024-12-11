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
    return; 
}
%>


<%@include file="header.jsp"%>
<div class="card-body p-0">
                <!-- Nested Row within Card Body -->
                <div class="col-lg-7">
                   
                    <div class="col">
                        <div class="p-5">
                            <div class="text-center">
                                <h1 class="h4 text-gray-900 mb-4">Nuevo Doctor</h1>
                            </div>
                            <form class="user" id="form" method="post">
    <input type="hidden" class="form-control " id="listar" name="listar" value="cargar">
    <input type="hidden" class="form-control " id="iddoctor" name="iddoctor">
    
    <div class="form-group row">
        <div class="col-sm-6 mb-3 mb-sm-0">
            <input type="text" class="form-control form-control-user" id="doc_nombre" name="doc_nombre" placeholder="Nombre">
            <small id="error-nombre" class="error-msg" style="color: red; display: none;"></small>
        </div>
        <div class="col-sm-6">
            <input type="text" class="form-control form-control-user" id="doc_apellido" name="doc_apellido" placeholder="Apellido">
            <small id="error-apellido" class="error-msg" style="color: red; display: none;"></small>
        </div>
    </div>

    <div class="form-group row">
        <div class="col-sm-6 mb-3 mb-sm-0">
            <input type="text" class="form-control form-control-user" id="doc_telefono" name="doc_telefono" placeholder="Teléfono">
            <small id="error-telefono" class="error-msg" style="color: red; display: none;"></small>
        </div>
        <div class="col-sm-6">
            <input type="text" class="form-control form-control-user" id="doc_ci" name="doc_ci" placeholder="Cédula">
            <small id="error-ci" class="error-msg" style="color: red; display: none;"></small>
        </div>
    </div>

    <div class="form-group row">
        <div class="col-sm-6 mb-3 mb-sm-0">
            <input type="text" class="form-control form-control-user" id="doc_titulo" name="doc_titulo" placeholder="Título">
            <small id="error-titulo" class="error-msg" style="color: red; display: none;"></small>
        </div>
        <div class="col-sm-6">
            <input type="text" class="form-control form-control-user" id="doc_matricula" name="doc_matricula" placeholder="Matrícula">
            <small id="error-matricula" class="error-msg" style="color: red; display: none;"></small>
        </div>
    </div>

    <div class="form-group row">
        <div class="col-sm-6">
            <label for="ciudad">Especialidad</label>
            <select class="form-control" id="idespecialidad" name="idespecialidad">
                <option value="">Seleccionar tu especialidad</option>
                <!-- Agregar opciones aquí -->
            </select>
            <small id="error-especialidad" class="error-msg" style="color: red; display: none;"></small>
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
                                            <th>Apellido</th>
                                            <th>telefono</th>
                                            <th>cedula</th>
                                            <th>matricula</th>
                                            <th>titulo</th>
                                            <th>especialidad</th>
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
    <input type="hidden" class="form-control " id="iddoctor_e" name="iddoctor_e">
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
        rellenarespecialidad();
        
    });
      function rellenarespecialidad(){
           
            $.ajax({
                data: {listar:'listar' },
            url:'jsp/especialidad.jsp',
            type: 'post',
           
            success: function(response){
            $("#idespecialidad").html('<option value="">Seleccionar tu especialidad</option>' + response);
            }          
        });
    
       }
       function rellenardatos(){
           
            $.ajax({
                data: {listar:'listar' },
            url:'jsp/doctoresM.jsp',
            type: 'post',
           
            success: function(response){
                $("#resultado tbody").html(response); 
            }         
        });
    
       }
       
     
           
           
$("#eliminaregistro").on("click", function() {
    var listar = $("#listar_eliminar").val();
    var pk = $("#iddoctor_e").val();
    $.ajax({
        data: { listar: listar, iddoctor_e: pk },
        url: 'jsp/doctoresM.jsp',
        type: 'post',
        success: function(response) {
            $("#mensaje").html(response);
            rellenardatos(); 
            setTimeout(function() {
                $("#mensaje").html("");
                $("#doc_nombre").val("");
                     $("#doc_apellido").val("");
                     $("#doc_telefono").val("");
                     $("#doc_ci").val("");
                     $("#doc_matricula").val("");
                     $("#doc_titulo").val("");
                     
                $("#listar").val("cargar");
            }, 2000);
        }
    });
});

           function rellenaredit(a,b,c,f,e,d,r,g){
           $("#iddoctor").val(a);
           $("#doc_nombre").val(b);
           $("#doc_apellido").val(c);
           $("#doc_telefono").val(d);
           $("#doc_ci").val(e);
           $("#doc_matricula").val(f);
           $("#doc_titulo").val(g);
           $("#idespecialidad").val(r);
           $("#listar").val("modificar");
    
       }
       
    </script>
<script>
    $(document).ready(function() {
    function validateInput() {
        let isValid = true;

        const nombre = $('#doc_nombre').val();
        if (!/^[A-Z][a-z]{2,}$/.test(nombre)) {
            $('#error-nombre').text('El nombre debe empezar con mayúscula y tener al menos 3 letras.').show();
            isValid = false;
        } else {
            $('#error-nombre').hide();
        }

        const apellido = $('#doc_apellido').val();
        if (!/^[A-Z][a-z]{2,}$/.test(apellido)) {
            $('#error-apellido').text('El apellido debe empezar con mayúscula y tener al menos 3 letras.').show();
            isValid = false;
        } else {
            $('#error-apellido').hide();
        }

        const telefono = $('#doc_telefono').val();
        if (!/^\d{10}$/.test(telefono)) { 
            $('#error-telefono').text('El teléfono debe tener 10 dígitos.').show();
            isValid = false;
        } else {
            $('#error-telefono').hide();
        }

        const ci = $('#doc_ci').val();
        if (!/^\d{5,}$/.test(ci)) {  
            $('#error-ci').text('La cédula debe tener al menos 5 dígitos.').show();
            isValid = false;
        } else {
            $('#error-ci').hide();
        }

        const titulo = $('#doc_titulo').val();
        if (!/^[A-Z][a-z\s]{2,}$/.test(titulo)) {
            $('#error-titulo').text('El título debe empezar con mayúscula y tener al menos 3 letras.').show();
            isValid = false;
        } else {
            $('#error-titulo').hide();
        }

        const matricula = $('#doc_matricula').val();
        if (!/^[0-9]{3,}$/.test(matricula)) { 
            $('#error-matricula').text('La matrícula debe tener al menos 3 caracteres alfanuméricos.').show();
            isValid = false;
        } else {
            $('#error-matricula').hide();
        }

        // Validación para 
        const especialidad = $('#idespecialidad').val();
        if (!especialidad) {
            $('#error-especialidad').text('Debes seleccionar una especialidad.').show();
            isValid = false;
        } else {
            $('#error-especialidad').hide();
        }

        $('#boton-aceptar').prop('disabled', !isValid);
    }

    $('#doc_nombre, #doc_apellido, #doc_telefono, #doc_ci, #doc_titulo, #doc_matricula, #idespecialidad').on('input change', function() {
        validateInput();
    });

  $("#boton-aceptar").on("click",function()
       {
           dato=$("#form").serialize();
           $.ajax({
            data:dato,
            url:'jsp/doctoresM.jsp',
            type: 'post',
           
            success: function(response){
                $("#mensaje").html(response); 
                 rellenardatos();
                 
                 
                 setTimeout(function(){
                     
                     $("#mensaje").html("");
                     $("#doc_nombre").val("");
                     $("#doc_apellido").val("");
                     $("#doc_telefono").val("");
                     $("#doc_ci").val("");
                     $("#doc_matricula").val("");
                     $("#doc_titulo").val("");
                     
                     $("#doc_nombre").focus("");
                      $("#listar").val("cargar");
                 },2000);
            } 
           });
           });

});

    
    
</script>
    