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
}          String rol = (String) sesion.getAttribute("rol");
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
                                <h1 class="h4 text-gray-900 mb-4">Nuevo servicio</h1>
                            </div>
                            <%if(rol.equals("admin")){%>
                            <form class="user" id="form" method="post">
                                <input type="hidden" class="form-control " id="listar" name="listar" value="cargar">
                                <input type="hidden" class="form-control " id="idservicio" name="idservicio">
                                <div class="form-group row">
                                    <div class="">
                                        <input type="text" class="form-control" id="ser_nombre" name="ser_nombre" placeholder="nombre del servicio">
                                    </div>
                                    
                                </div>
                                <div class="form-group row">
                                    <div class="col-sm-6">
                                        <input type="text" class="form-control" id="ser_precio" name="ser_precio" placeholder="precio">
                                    </div>
                                    <div class="col-sm-6 mb-3 mb-sm-0">

                                    <select class="form-control " id="ser_estado" name="ser_estado">
                <option value="">Seleccionar Estado</option>
                               <option value="Activo">Activo </option>
                <option value="Inactivo">Inactivo </option>

            </select>
                                    </div>
                                     <div class="col-sm-5">
                            <label for="field-12" class="control-label">Doctores</label>

                            <select class="js-states form-control" id="iddoctor" name="iddoctor">

                            </select>
                        </div>
                                     
                                </div>
                                
                                <div class="form-group row">

                                    
                                    <div class="col-sm-6">
                                    <div class="dropdown mb-4">
                                        <div class="col-sm-12">
                  
                </div>
                                        <div class="dropdown-menu animated--fade-in"
                                            aria-labelledby="dropdownMenuButton">
                                            <a class="dropdown-item" href="#">Action</a>
                                           
                                            
                                        </div>
                                    </div>
                                    </div>
                                </div>
                                    <input type="button" class="btn btn-primary" id="boton-aceptar" name="boton-aceptar" value="Guardar"/>
        <input type="button" onclick="cancelar()" class="btn btn-danger" id="boton-cancelar" name="boton"  value="Cancelar" href="container.jsp" />

                               
                            </form> <div id="mensaje"></div>                  <hr>
</div>
                            <% }else if(rol.equals("user")) { %>
                            
          
                       <% } %>
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
                                 
                                    <a type="button" class="fa fa-print" href="rpaciente_2.jsp"></a>
                                    <thead>
                                        <tr>
                                            <th>#</th>
                                            <th>Nombre</th>
                                            <th>precio</th>
                                            <th>estado</th>
                                           
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
    <input type="hidden" class="form-control " id="idservicio_e" name="idservicio_e">
    desea eliminar
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">No</button>
       
        <input type="button" class="btn btn-primary" data-bs-dismiss="modal" id="eliminaregistro" aria-label="Close" name="eliminaregistro" value="si"/>
      </div>
    </div>
  </div>
</div>
<%@include file="footer.jsp"%> <!-- jQuery -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <!-- Select2 -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/js/select2.min.js"></script>

       <script>
      $("#iddoctor").select2({
          placeholder: "Selecciona una opcion",
          allowClear: true
      });
      $("#multiple").select2({
          placeholder: "Selecciona una opcion",
          allowClear: true
      });
    </script>
<script>
      $(document).ready(function(){
        rellenardatos();
        rellenarservicio();
        
    });
      function rellenarservicio() {

                $.ajax({
                    data: {listar: 'listar'},
                    url: 'jsp/servicio.jsp',
                    type: 'post',

                    success: function (response) {
                        $("#iddoctor").html('<option value="" class="col-sm-6 mb-3 mb-sm-0">Seleccionar doctor</option>' + response);
                    }
                });

            }
       function rellenardatos(){
           
            $.ajax({
                data: {listar:'listar' },
            url:'jsp/serviciosM.jsp',
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
            url:'jsp/serviciosM.jsp',
            type: 'post',
           
            success: function(response){
                $("#mensaje").html(response); 
                 rellenardatos();
                 
                 
                 setTimeout(function(){
                     
                     $("#mensaje").html("");
                     $("#ser_nombre").val("");
                     $("#ser_precio").val("");
                     $("#ser_estado").val("");
                     $("#iddoctor").val("");
                     $("#ser_nombre").focus("");
                      $("#listar").val("cargar");
                 },2000);
            } 
           });
           });
           
           
$("#eliminaregistro").on("click", function() {
    var listar = $("#listar_eliminar").val();
    var pk = $("#idservicio_e").val();
    $.ajax({
        data: { listar: listar, idservicio_e: pk },
        url: 'jsp/serviciosM.jsp',
        type: 'post',
        success: function(response) {
            $("#mensaje").html(response);
            rellenardatos(); 
            setTimeout(function() {
                $("#mensaje").html("");
                $("#ser_nombre").val("");
                     $("#ser_precio").val("");
                     $("#ser_estado").val("");
                     
                     $("#iddoctor").val("");
                $("#listar").val("cargar");
            }, 2000);
            
        }
    });
});

        function rellenaredit(a,b,c,d,k){
           $("#idservicio").val(a);
           $("#ser_nombre").val(b);
           $("#ser_precio").val(c);
           $("#ser_estado").val(d);
          $("#iddoctor").val(k);

           $("#listar").val("modificar");
    
       }
       
    </script>