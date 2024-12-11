<%@page import="java.math.BigInteger"%>
<%@page import="java.security.MessageDigest"%>
<%
HttpSession sesion = request.getSession(false); // Usa false para no crear una nueva sesión si no existe
%>

<%
boolean sessionExpired = (sesion == null || sesion.getAttribute("logueado") == null || sesion.getAttribute("logueado").equals("0"));
if (sessionExpired) {
    request.setAttribute("sessionExpired", true);
}
%>

<%
if (request.getAttribute("sessionExpired") != null) {
    %>
    <script>

        window.location.href = "login.jsp";
    </script>
    <%
    return; 
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
                                <h1 class="h4 text-gray-900 mb-4">Nuevo ciudad</h1>
                            </div>
<form class="user" name="form" id="form" method="post">
        <input type="hidden" class="form-control" id="listar" name="listar" value="cargar">
        <input type="hidden" class="form-control" id="idciudad" name="idciudad">
        <div class="form-group row">
            <div class="col-sm-6 mb-3 mb-sm-0">
                <input type="text" class="form-control" id="ciu_nombre" name="ciu_nombre" placeholder="Nombre" minlength="3">
            <small id="error-msg" style="color: red; display: none;"></small>
            </div>
        </div>
        <div class="form-group row">
            <div class="col-sm-6">
                <div class="dropdown mb-4">
                    <div class="col-sm-6"></div>
                    <div class="dropdown-menu animated--fade-in" aria-labelledby="dropdownMenuButton">
                        <a class="dropdown-item" href="#">Action</a>
                    </div>
                </div>
            </div>
        </div>
        <input type="button" class="btn btn-primary" id="boton-aceptar" name="boton-aceptar" value="Guardar" disabled/>
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
</div>
</div>
                                <table class="table table-bordered" id="tabla" width="100%" data-sort="table">
                                 
                                    <a type="button" class="fa fa-print" href="rpaciente_5.jsp"></a>

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
        <button type="button" class="fa fa-close" data-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <input type="hidden" class="form-control " id="listar_eliminar" name="listar_eliminar" value="eliminar">
    <input type="hidden" class="form-control " id="idciudad_e" name="idciudad_e">
    desea eliminar
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">No</button>
       
        <input type="button" class="btn btn-primary" data-dismiss="modal" id="eliminaregistro" aria-label="Close" name="eliminaregistro" value="si"/>
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
            url:'jsp/ciudadesM.jsp',
            type: 'post',
           
            success: function(response){
                $("#tabla tbody").html(response); 
            }         
        });
    
       }
       
       $("#boton-aceptar").on("click",function()
       {
           dato=$("#form").serialize();
           $.ajax({
            data:dato,
            url:'jsp/ciudadesM.jsp',
            type: 'post',
           
            success: function(response){
                $("#mensaje").html(response); 
               

                 rellenardatos();
                 
                 
                 setTimeout(function(){
                     
                     $("#mensaje").html("");
                     
                     
                     $("#nombre").val("");
                     
                     
                     $("#nombre").focus("");
                      $("#listar").val("cargar");
                 },2000);
            } 
           });
           });
           
           
$("#eliminaregistro").on("click", function() {
    var listar = $("#listar_eliminar").val();
    var pk = $("#idciudad_e").val();
    $.ajax({
        data: { listar: listar, idciudad_e: pk },
        url: 'jsp/ciudadesM.jsp',
        type: 'post',
        success: function(response) {
            $("#mensaje").html(response);
            
            rellenardatos(); 
            setTimeout(function() {
                $("#mensaje").html("");
                $("#ciu_nombre").val("");
                     
                     
                $("#listar").val("cargar");
            }, 2000);
        }
    });
});

           function rellenaredit(a,b){
           $("#idciudad").val(a);
           $("#ciu_nombre").val(b);
         
           $("#listar").val("modificar");
    
       }
       
    </script><script type="text/javascript" src="js/validacion.js"></script>
   <script>
      $(document).ready(function() {
    function validateInput() {
        const input = $('#ciu_nombre').val();
        const lengthValid = input.length >= 3;
        const uppercaseValid = /^[A-Z]/.test(input);
        const lettersOnly = /^[A-Za-z\s]*$/.test(input); // Solo letras y espacios permitidos

        let errorMsg = '';

        if (!lettersOnly) {
            errorMsg = 'Solo se permiten letras.';
        } else if (!uppercaseValid) {
            errorMsg = 'La primera letra debe estar en mayúscula.';
        } else if (!lengthValid) {
            errorMsg = 'Debe ingresar al menos 3 caracteres.';
        } else {
            // No hay errores
            $('#error-msg').hide();
            $('#boton-aceptar').prop('disabled', false);
            return;
        }

        // Mostrar mensaje de error
        $('#error-msg').text(errorMsg).show();
        $('#boton-aceptar').prop('disabled', true);
    }

    // Evento de entrada en el campo de texto
    $('#ciu_nombre').on('input', function() {
        validateInput();
    });

    // Evento para el botón de guardar

});


    </script>

    