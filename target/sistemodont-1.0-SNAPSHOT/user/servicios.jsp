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
                                <h1 class="h4 text-gray-900 mb-4">Nuevo servicio</h1>
                            </div>
                            <form class="user" id="form" method="post">
                                <input type="hidden" class="form-control " id="listar" name="listar" value="cargar">
                                <input type="hidden" class="form-control " id="idservicio" name="idservicio">
                                <div class="form-group row">
                                    <div class="">
                                        <input type="text" class="form-control form-control-user" id="ser_nombre" name="ser_nombre" placeholder="nombre del servicio">
                                    </div>
                                    
                                </div>
                                <div class="form-group row">
                                    <div class="col-sm-6">
                                        <input type="text" class="form-control form-control-user" id="ser_precio" name="ser_precio" placeholder="precio">
                                    </div>
                                    <div class="col-sm-6 mb-3 mb-sm-0">
                                    <select class="form-control " id="ser_estado" name="ser_estado">
                <option value="">Seleccionar </option>
                               <option value="Activo">Activo </option>
                <option value="Inactivo">Inactivo </option>

            </select>
                                    </div>
                                     
                                </div>
                                
                                <div class="form-group row">

                        <select class="form-control " id="iddoctor" name="iddoctor">
                <option value="">Seleccionar doctor</option>
               
            </select>
                                    
                                    <div class="col-sm-6">
                                    <div class="dropdown mb-4">
                                        <div class="col-sm-6">
                    <div class="form-group row">

                       
                    </div>
                </div>
                                        <div class="dropdown-menu animated--fade-in"
                                            aria-labelledby="dropdownMenuButton">
                                            <a class="dropdown-item" href="#">Action</a>
                                           
                                            
                                        </div>
                                    </div>
                                    </div>
                                </div>
                                    <input type="button" class="btn btn-primary" id="boton-aceptar" name="boton-aceptar" value="Guardar"/>
                                    <input type="button" class="btn btn-primary" id="boton-cancelar" name="boton" value="aceptar"/>

                               
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
                                            <th>precio</th>
                                            <th>estado</th>
                                            <th>Doctor</th>
                                            
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
<%@include file="footer.jsp"%>
<script>
      $(document).ready(function(){
        rellenardatos();
        rellenarservicio();
        
    });
      function rellenarservicio(){
           
            $.ajax({
                data: {listar:'listar' },
            url:'jsp/servicio.jsp',
            type: 'post',
           
            success: function(response){
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
                $("#resultado tbody").html(response); 
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
        data: { listar: listar, idpaciente_e: pk },
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
                     
                     
                $("#listar").val("cargar");
            }, 2000);
        }
    });
});

           function rellenaredit(a,b,c,d,r){
           $("#idservicio").val(a);
           $("#ser_nombre").val(b);
           $("#ser_precio").val(c);
           $("#ser_estado").val(d);
           
           $("#iddoctor").val(r);
           $("#listar").val("modificar");
    
       }
       
    </script>