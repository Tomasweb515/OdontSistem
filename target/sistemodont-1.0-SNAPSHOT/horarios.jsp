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
                    <h1 class="h4 text-gray-900 mb-4">Nuevo horario</h1>
                </div>
                <form class="user" id="form" method="post">
                    <label for="ciudad">hora atencion</label>
                    <input type="hidden" class="form-control " id="listar" name="listar" value="cargar">
                    <input type="hidden" class="form-control " id="idhorario" name="idhorario">
                    <div class="form-group row">
                        <div class="col-sm-6 mb-3 mb-sm-0">
                            <input type="time" class="form-control" id="hora_atencion" name="hora_atencion" placeholder="hora atencion">
                        </div>
                        

                      

                        
                    </div>


                    <div class="form-group row">

     

                        <div class="col-sm-8">
                            <div class="dropdown mb-8">
                                           <div class="col-sm-8">
                                    <div class="form-group row">

                                        <label for="">Estado</label>

                                        <select class="form-control" id="hora_estado" name="hora_estado">
                                            <option value="Activo">Activo</option>
                                            <option value="Inactivo">Inactivo</option>

                                        </select>
                                         <label for="ciudad">Doctor</label>

                               <select id="iddoctor" class="js-states form-control" name="iddoctor">                         

                            </select>
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
  <div class="derecha">                               <input type="text" id="buscar" class="form-control form-control-user" onkeyup="buscar()" placeholder="Buscar en tabla" title="Empieza a escribir para buscar">
</div>                                <table class="table table-bordered"  id="tabla" width="100%" data-sort="table">
                                 
                                    <a type="button" class="fa fa-print" href="rpaciente_8.jsp"></a>

                    <thead>
                        <tr>
                            <th>#</th>
                            <th>hora Atencion</th>
                            <th>doctor</th>
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
                    <input type="hidden" class="form-control " id="idhorario_e" name="idhorario_e">
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
     <!-- jQuery -->
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
        $(document).ready(function () {
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

        function rellenardatos() {

            $.ajax({
                data: {listar: 'listar'},
                url: 'jsp/hora.jsp',
                type: 'post',

                success: function (response) {
                    $("#tabla tbody").html(response);
                }
            });

        }

        $("#boton-aceptar").on("click", function ()
        {
            dato = $("#form").serialize();
            $.ajax({
                data: dato,
                url: 'jsp/hora.jsp',
                type: 'post',

                success: function (response) {
                    $("#mensaje").html(response);
                    rellenardatos();


                    setTimeout(function () {

                        $("#mensaje").html("");
                        $("#hora_atencion").val("");
                        $("#iddoctor").val("");
                        $("#hora_estado").val("");


                        $("#hora_atencion").focus("");
                        $("#listar").val("cargar");
                    }, 2000);
                }
            });
        });


        $("#eliminaregistro").on("click", function () {
            var listar = $("#listar_eliminar").val();
            var pk = $("#idhorario_e").val();
            $.ajax({
                data: {listar: listar, idhorario_e: pk},
                url: 'jsp/hora.jsp',
                type: 'post',
                success: function (response) {
                    $("#mensaje").html(response);
                    rellenardatos();
                    setTimeout(function () {
                        $("#mensaje").html("");
                        $("#hora_atencion").val("");
                        $("#iddoctor").val("");
                        $("#hora_estado").val("");

                        $("#listar").val("cargar");
                    }, 2000);
                }
            });
        });

        function rellenaredit(a, b, c,d) {
           $("#idhorario").val(a);
        $("#hora_atencion").val(b);
            $("#iddoctor").val(c);
            $("#hora_estado").val(d);
            


            $("#listar").val("modificar");

        }

    </script>
  
   