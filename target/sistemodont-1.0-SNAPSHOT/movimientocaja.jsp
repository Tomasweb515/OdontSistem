
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
    alert('Su sesión ha expirado. Por favor, inicie sesión nuevamente.');

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
<%@ page import="java.sql.Time" %>
<%@ page import="java.time.LocalTime" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%
    // Obtener la fecha actual
    Date fechaActual = new Date();

    // Crear un formateador de fecha
    SimpleDateFormat formateadorFecha = new SimpleDateFormat("dd-MM-yyyy");

    // Formatear la fecha
    String fechaFormateada = formateadorFecha.format(fechaActual);

    Date date = new Date();
    // Hora que obtendrías de la base de datos.
    Time time = new Time(date.getTime());
%>

<%@include file="header.jsp"%>

<div class="card-body p-0">
    <!-- Nested Row within Card Body -->
    <div class="col-lg-7">

        <div class="col">
            <div class="p-5">
                <div class="text-center">
                    <h1 class="h4 text-gray-900 mb-4">Apertura de caja</h1>
                </div>
                <form class="user">
                    <input type="button" class="btn btn-primary" data-toggle="modal" data-target="#agregarModal" value="Apertura caja" />
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

                    <a type="button" class="fa fa-print" href=""></a>

                    <thead>
                        <tr>
                            <th>#</th>
                            
                            <th>Usuario</th>
                            <th>saldo inicial</th>
                            
                              <th>saldo ingresado</th>
                               <th>saldo total</th>
                            <th>Estado</th>


                            <th>Total caja cerrada</th>
                            <th>Opciones</th>
                        </tr>
                    </thead>

                    <tbody>

                    </tbody>
                </table>
            </div>
        </div>
    </div>


    <div class="modal fade" id="agregarModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h1 class="modal-title fs-5" id="exampleModalLabel">Apertura de tu caja</h1>
                    <button type="button" class="fa fas-close"  data-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <form class="user" name="form" id="form" method="post">
                        <input type="hidden" class="form-control" id="listar" name="listar" value="cargar">
                        <input type="hidden" class="form-control" id="idapertura" name="idapertura">
                        <div class="form-group row">
                            <div class="col-sm-6 mb-3 mb-sm-0">
                                <input type="text" class="form-control" id="ape_monto" name="ape_monto" placeholder="Monto">
                                <input class="form-control" type="hidden" name="ape_fecha" id="ape_fecha" onKeyUp="" autocomplete="off"  value="<%= fechaActual%>" readonly>
                                <input class="form-control" type="hidden" name="ape_hora" id="ape_hora" onKeyUp="" autocomplete="off"  value="<%= time%>" readonly>


                                <small id="error-msg" style="color: red; display: none;"></small>
                            </div>
                        </div>

                    </form>
                </div>
                <div class="modal-footer">
                    <input type="button" class="btn btn-primary" id="boton-aceptar" name="boton-aceptar" value="Si" data-dismiss="modal" aria-label="Close"/>
                    <input type="button" onclick="cancelar()" class="btn btn-danger" id="boton-cancelar" name="boton"  value="No" href="container.jsp" />
                </div>
            </div>
        </div>
    </div>
    <div class="modal fade" id="cierreModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h1 class="modal-title fs-5" id="exampleModalLabel">Cierre de tu caja</h1>
                    <button type="button" class="fa fas-close"  data-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <form class="user" name="formcierre" id="formcierre" method="post">
                        <input type="hidden" class="form-control" id="listar" name="listar" value="cierre">
                        <input type="hidden" class="form-control" id="idapertura_e" name="idapertura_e">
                        <div class="form-group row">
                            <div class="col-sm-6 mb-3 mb-sm-0">
                                <input type="text" class="form-control" id="totalcierre" name="totalcierre" placeholder="Monto">
                                <input class="form-control" type="hidden" name="ape_cierrafecha" id="ape_cierrafecha" onKeyUp="" autocomplete="off"  value="<%= fechaActual%>" readonly>
                                <input class="form-control" type="hidden" name="ape_horacierre" id="ape_horacierre" onKeyUp="" autocomplete="off"  value="<%= time%>" readonly>


                                <small id="error-msg" style="color: red; display: none;"></small>
                            </div>
                        </div>

                    </form>
                </div>
                <div class="modal-footer">
                    <input type="button" class="btn btn-primary" id="boton-cierre" name="boton-cierre" value="Si" data-dismiss="modal" aria-label="Close"/>
                    <input type="button" onclick="cancelar()" class="btn btn-danger" id="boton-cancelar" name="boton"  value="No" href="container.jsp" />
                </div>
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
                    <input type="hidden" class="form-control " id="idciudad_e" name="idciudad_e">
                    desea eliminar
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">No</button>

                    <input type="button" class="btn btn-primary" data-bs-dismiss="modal" id="eliminaregistro" aria-label="Close" name="eliminaregistro" value="si"/>
                </div>
            </div>
        </div>
    </div>
    
    
    
    <!-- extraccion -->
    <div class="modal fade" id="extraccionModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h1 class="modal-title fs-5" id="exampleModalLabel">Extraccion de tu caja</h1>
                    <button type="button" class="fa fas-close"  data-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <form class="user" name="formextraer" id="formextraer" method="post">
                        <input type="hidden" class="form-control" id="listar" name="listar" value="extraer">
                        <input type="hidden" class="form-control" id="idextraccion" name="idextraccion">
                        <div class="form-group row">
                            <div class="col-sm-6 mb-3 mb-sm-0">
                                                                <input type="text" class="form-control" id="ex_descripcion" name="ex_descripcion" placeholder="Descipcion">

                                <input type="text" class="form-control" id="ex_monto" name="ex_monto" placeholder="Monto">
                                <input class="form-control" type="hidden" name="ex_fecha" id="ex_fecha" onKeyUp="" autocomplete="off"  value="<%= fechaActual%>" readonly>
                                <input class="form-control" type="hidden" name="ex_hora" id="ex_hora" onKeyUp="" autocomplete="off"  value="<%= time%>" readonly>


                                <small id="error-msg" style="color: red; display: none;"></small>
                            </div>
                        </div>

                    </form>
                </div>
                <div class="modal-footer">
                    <input type="button" class="btn btn-primary" id="boton-extraer" name="boton-extraer" value="Si" data-dismiss="modal" aria-label="Close"/>
                    <input type="button" onclick="cancelar()" class="btn btn-danger" id="boton-cancelar" name="boton"  value="No" href="container.jsp" />
                </div>
            </div>
        </div>
    </div>
                                
                                 <!-- ingreso -->
    <div class="modal fade" id="masModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h1 class="modal-title fs-5" id="exampleModalLabel">Ingreso de tu caja</h1>
                    <button type="button" class="fa fas-close"  data-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <form class="user" name="formmas" id="formmas" method="post">
                        <input type="hidden" class="form-control" id="listar" name="listar" value="mas">
                        <input type="hidden" class="form-control" id="idextraccion" name="idextraccion">
                        <div class="form-group row">
                            <div class="col-sm-6 mb-3 mb-sm-0">
                                         
                                <input type="text" class="form-control" id="ex_descripcion" name="ex_descripcion" placeholder="Descipcion">

                                <input type="text" class="form-control" id="exingreso_monto" name="exingreso_monto" placeholder="Monto">
                                <input class="form-control" type="hidden" name="ex_fecha" id="ex_fecha" onKeyUp="" autocomplete="off"  value="<%= fechaActual%>" readonly>
                                <input class="form-control" type="hidden" name="ex_hora" id="ex_hora" onKeyUp="" autocomplete="off"  value="<%= time%>" readonly>


                                <small id="error-msg" style="color: red; display: none;"></small>
                            </div>
                        </div>

                    </form>
                </div>
                <div class="modal-footer">
                    <input type="button" class="btn btn-primary" id="boton-mas" name="boton-mas" value="Si" data-dismiss="modal" aria-label="Close"/>
                    <input type="button" onclick="cancelar()" class="btn btn-danger" id="boton-cancelar" name="boton"  value="No" href="container.jsp" />
                </div>
            </div>
        </div>
    </div>
    <%@include file="footer.jsp"%>
    <script>
        $(document).ready(function () {
            rellenardatos();


        });

        function rellenardatos() {

            $.ajax({
                data: {listar: 'listar'},
                url: 'jsp/movimiento.jsp',
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
                url: 'jsp/movimiento.jsp',
                type: 'post',

                success: function (response) {
                    $("#mensaje").html(response);


                    rellenardatos();

                  
                  
                    setTimeout(function () {

                        $("#mensaje").html("");


                        $("#ape_monto").val("");


                        $("#ape_monto").focus("");
                        $("#listar").val("cargar");
                    }, 2000);
                }
            });
        });
        $("#boton-cierre").on("click", function ()
        {
            dato = $("#formcierre").serialize();
            $.ajax({
                data: dato,
                url: 'jsp/movimiento.jsp',
                type: 'post',

                success: function (response) {
                    $("#mensaje").html(response);


                    rellenardatos();

                    
                    setTimeout(function () {

                        $("#mensaje").html("");


                        $("#totalcierre").val("");


                        $("#totalcierre").focus("");
                        $("#listar").val("cargar");
                    }, 2000);
                }
            });
        });
$("#boton-extraer").on("click", function ()
        {
            dato = $("#formextraer").serialize();
            $.ajax({
                data: dato,
                url: 'jsp/movimiento.jsp',
                type: 'post',

                success: function (response) {
                    $("#mensaje").html(response);


                    rellenardatos();

                    
                    setTimeout(function () {

                        $("#mensaje").html("");


                        $("#totalcierre").val("");


                        $("#totalcierre").focus("");
                        $("#listar").val("cargar");
                    }, 2000);
                }
            });
        });
        
        $("#boton-mas").on("click", function ()
        {
            dato = $("#formmas").serialize();
            $.ajax({
                data: dato,
                url: 'jsp/movimiento.jsp',
                type: 'post',

                success: function (response) {
                    $("#mensaje").html(response);


                    rellenardatos();

                    
                    setTimeout(function () {

                        $("#mensaje").html("");


                        $("#exingreso_monto").val("");


                        $("#totalcierre").focus("");
                        $("#listar").val("cargar");
                    }, 2000);
                }
            });
        });
        $("#eliminaregistro").on("click", function () {
            var listar = $("#listar_eliminar").val();
            var pk = $("#idciudad_e").val();
            $.ajax({
                data: {listar: listar, idciudad_e: pk},
                url: 'jsp/ciudadesM.jsp',
                type: 'post',
                success: function (response) {
                    $("#mensaje").html(response);

                    rellenardatos();
                    setTimeout(function () {
                        $("#mensaje").html("");
                        $("#totalcierre").val("");


                        $("#listar").val("cargar");
                    }, 2000);
                }
            });
        });

        function rellenaredit(a) {
            $("#idapertura").val(a);


            $("#listar").val("modificar");

        }

    </script><script type="text/javascript" src="js/validacion.js"></script>
    <script>
        $(document).ready(function () {
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
            $('#ciu_nombre').on('input', function () {
                validateInput();
            });

            // Evento para el botón de guardar

        });


    </script>

