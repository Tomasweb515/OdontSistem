<%@include file="header.jsp" %>

<div class="content-wrapper">
    <section class="content">
        <form action="#" id="form" enctype="multipart/form-data" method="POST" role="form" class="form-horizontal form-groups-bordered">
            <input type="hidden" id="listar" name="listar" value="cargar"/>
            <h3><i></i>Reservar cita</h3><br>


            <div class="row">
                <div class="col-lg-3 ds">
                    <!--COMPLETED ACTIONS DONUTS CHART-->
                    <h5>DATOS DEL PACIENTE

                    </h5>

                    <!-- First Action -->


                    <!-- First Action -->


                    <!-- First Action -->


                    <!-- Second Action -->

                    <div class="form-group">
                        <label for="field-12" class="control-label">Pacientes</label>

                        <select class="form-control" name="idpaciente" id="idpaciente" onchange="dividirproveedor(this.value)">

                        </select>
                    </div>

                    <div class="form-group">
                        <label for="field-12" class="control-label">Documento</label>
                        <input type="hidden" id="codpaciente" name="codpaciente">
                        <input class="form-control" type="text" value="" name="pa_ci" id="pa_ci" onKeyUp="this.value = this.value.toUpperCase();" autocomplete="off" placeholder="Cedula" readonly="readonly" required><small><span class="symbol required"></span> </small>
                    </div>

                    <div class="form-group">
                        <label for="field-12" class="control-label">Fecha de Registro</label>
                        <input class="form-control" type="date" name="fecharegistro" id="fecharegistro" onKeyUp="" autocomplete="off" placeholder="Ingrese Fecha" >

                    </div>
<div class="form-group">
                        <label for="field-12" class="control-label">hora </label>
                        <input class="form-control" type="time" name="hora" id="hora" onKeyUp="" autocomplete="off" placeholder="Ingrese Fecha" >

                    </div>
                    <hr>
                    <br>
<div align="right">
                                        <button type="button" name="agregar" value="agregar" id="AgregaProductoCompra" class="btn btn-primary" onclick=""><span class="fa fa-shopping"></span> Agregar</button>
                                        <div id="respuesta"></div>
                                    </div>
                </div><!-- /col-lg-3 -->

          
            </div>
            <!-- **********************************************************************************************************************************************************
          RIGHT SIDEBAR CONTENT
          *********************************************************************************************************************************************************** -->
        </form>
    </section>
</div>

</div>
<!-- Modal -->
<%@include file="footer.jsp" %>
<script>
    $(document).ready(function () {
        buscarproveedor();
        buscardoctor();
    });
    function buscarproveedor() {
        $.ajax({
            data: {listar: 'buscarproveedor'},
            url: 'jsp/buscar1.jsp',
            type: 'post',
            beforeSend: function () {
                // $("#resultado").html("Procesando, espere por favor...");
            },
            success: function (response) {
                $("#idpaciente").html(response);
            }
        });
    }
    function buscardoctor() {
        $.ajax({
            data: {listar: 'buscardoctores'},
            url: 'jsp/buscar.jsp',
            type: 'post',
            beforeSend: function () {
                // $("#resultado").html("Procesando, espere por favor...");
            },
            success: function (response) {
                $("#iddoctor").html(response);
            }
        });
    }
    function dividirproducto(a) {
        //alert(a);
        datos = a.split(',');
        // alert(datos[0]);
        // alert(datos[1]);
        $("#coddoctores").val(datos[0]);
        $("#doc_ci").val(datos[1]);
    }
    function dividirproveedor(a) {
        //alert(a);
        datos = a.split(',');
        // alert(datos[0]);
        // alert(datos[1]);
        $("#codpaciente").val(datos[0]);
        $("#pa_ci").val(datos[1]);
    }
    $("#AgregaProductoCompra").click(function () {
        datosform = $("#form").serialize();
        $.ajax({
            data: datosform,
            url: 'jsp/control1.jsp',
            type: 'post',
            beforeSend: function () {
                //$("#resultado").html("Procesando, espere por favor...");
            },
            success: function (response) {
                $("#respuesta").html(response);
                cargardetalle();
                location.href = 'reserva.jsp';

            }
        });
    });

    function cargardetalle() {
        $.ajax({
            data: {listar: 'listar'},
            url: 'jsp/control1.jsp',
            type: 'post',
            beforeSend: function () {
                // $("#resultado").html("Procesando, espere por favor...");
            },
            success: function (response) {
                $("#resultados").html(response);
                sumador();

            }
        });
    }
    function  sumador() {
        $.ajax({
            data: {listar: 'listarsuma'},
            url: 'jsp/control1.jsp',
            type: 'post',
            beforeSend: function () {
                //$("#resultado").html("Procesando, espere por favor...");
            },
            success: function (response) {
                $("#lbltotal").html(response);
                $("#txtTotalCompra").val(response);


            }
        });
    }

    $("#delcompra").click(function () {
        pkd = $("#pkdel").val();
        $.ajax({
            data: {listar: 'elimregcompra', pkd: pkd},
            url: 'jsp/control1.jsp',
            type: 'post',
            beforeSend: function () {
                //$("#resultado").html("Procesando, espere por favor...");
            },
            success: function (response) {
                cargardetalle();
                sumador();

            }
        });
    });

    $("#cancelar-compra").click(function () {
        $.ajax({
            data: {listar: 'cancelcompra'},
            url: 'jsp/control1.jsp',
            type: 'post',
            beforeSend: function () {
                //$("#resultado").html("Procesando, espere por favor...");
            },
            success: function (response) {
                location.href = 'listar.jsp';

            }
        });
    });
    $("#final-compra").click(function () {
        total = $("#txtTotalCompra").val();
        $.ajax({
            data: {listar: 'finalcompra', total: total},
            url: 'jsp/control1.jsp',
            type: 'post',
            beforeSend: function () {
                //$("#resultado").html("Procesando, espere por favor...");
            },
            success: function (response) {
                location.href = 'listar.jsp';

            }
        });
    });


</script>
