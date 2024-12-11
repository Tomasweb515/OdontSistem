<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" name="viewport" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
  <!-- Favicons -->
  <!--     <link rel="apple-touch-icon" href="./assets/img/kit/free/apple-icon.png">
    <link rel="icon" href="./assets/img/kit/free/favicon.png"> -->
  <title>
    Sistema de Comercialización
  </title>
  <!--     Fonts and icons     -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>

  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css" integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4" crossorigin="anonymous">
  <link rel="stylesheet" href="css/jquery-ui.min.css">
  <link rel="stylesheet" href="css/jquery-ui.structure.min.css">
  <link rel="stylesheet" href="css/jquery-ui.theme.min.css">

</head>

<body class="bg-light">

  <?php include("nav/nav.php"); ?>


  <div class="container">

    <div class="card card-nav-tabs">
      <!--       <div class="card-header card-header-primary">
        Featured  
      </div> -->
      <div class="card-body">
        <h2 class="card-title">Gestión de presupuestos</h2>
        <p class="card-text">
          <!-- Nombre -->
        </p>


        

        <table class="table table-sm table-bordered" style="font-size: 11px" id="tab_pre">
          <thead class="thead-dark">
            <tr>
              <th scope="col" width="4%">Check</th>
              <th scope="col">#</th>
              <th scope="col" width="15%">Ubicación</th>
              <th scope="col" width="14%">Código del bien</th>
              <th scope="col" width="5%">Cantidad</th>
              <th scope="col">Descripción</th>
              <th scope="col" width="15%">Material a utilizar</th>
              <th scope="col">Ancho (M)</th>
              <th scope="col">Alto (M)</th>
              <th scope="col" width="10%">Precio Mensual</th>
              <th scope="col" width="5%">Meses a Exhibir</th>
              <th scope="col" width="10%">Total</th>
            </tr>
          </thead>
          <tfoot>
            <tr>
              <th colspan="4" class="text-right">TOTAL:</th>
              <td>
                <input type="text" id="" class="form-control form-control-sm" disabled>
              </td>
              <th colspan="6" class="text-right">SUB-TOTAL</th>
              <td>
              </td>
            </tr>
          </tfoot>
          <tbody>
            <tr>
              <th>
                <!-- <input type='checkbox' name='record'> -->
              </th>
              <th scope="row"></th>
              <td>
                <select id="ubic" class="form-control form-control-sm"></select>
              </td>
              <td>
                <input type="text" id="codb" class="form-control form-control-sm">
              </td>
              <td>
                <input type="text" id="cant" class="form-control form-control-sm">
              </td>
              <td>
                <input type="text" id="desc" class="form-control form-control-sm">
              </td>
              <td>
                <select name="" id="mat" class="form-control form-control-sm">
                </select>
              </td>
              <td>
                <input type="text" id="anc" class="form-control form-control-sm">
              </td>
              <td>
                <input type="text" id="alt" class="form-control form-control-sm">
              </td>
              <td>
                <input type="text" id="pre" class="form-control form-control-sm">
              </td>
              <td>
                <input type="text" id="meex" class="form-control form-control-sm">
              </td>
              <td>
                <input type="text" id="total" class="form-control form-control-sm" disabled>
              </td>

            </tr>
          </tbody>
        </table>
        <div class="btn-group">
          <button id="add" class="btn btn-primary btn-sm">Agregar</button>
          <button id="rmv" class="btn btn-danger btn-sm">Eliminar</button>
        </div>
        <hr>
        <div class="row">
          <div class="input-group col-lg-12">
            <label for="imp">Importe total en letras: </label>
            <input type="text" class="form-control form-control-sm">
          </div>
        </div>
        <hr>

        <div class="row">
          <div class="col-lg-3 ">
            <h6>Formas de pago del servicio:</h6>
          </div>
          <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
<select id="cuotas">
  <option value="1">1</option>
  <option value="2">2</option>
  <option value="3">3</option>
  <option value="4">4</option>
</select>
<input type="text" name="subtotal" id="sub-total" value=10000>
<div id="pagos">
<table class="table">
<thead>
  <th>#</th>
  <th>concepto</th>
  <th>monto</th>
  <th>fecha pago</th>
</thead>
<tbody></tbody>
</table>
        </div>

     

    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js" integrity="sha384-cs/chFZiN24E4KMATLdqdvsezGxaGsi4hLGOzlXwp5UZB1LY//20VyM2taTB4QvJ" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js" integrity="sha384-uefMccjFJAIv6A+rW+L4AHf99KvxDjWSu1z9VI8SKNVmz4sk7buKt/6v9KI65qnm" crossorigin="anonymous"></script>
    
    

    <!--<script defer src="script/validador.js"></script>
 <script defer src="script/select.js"></script> 
<script defer src="js/jquery-ui.min.js"></script>  -->

    <script>
    $("#cuotas").change(function(event) {

    $("#pagos tbody tr").remove();

    var cuotas = $("#cuotas").val();
    var subtotal = $("#sub-total").val();

    var resul = subtotal / cuotas;

    for (var i = 0; i < cuotas; i++) {

      	var res = subtotal-resul*(i+1);

       	var row="<tr>";
       	row += "<td width='4%'>"+(i+1)+"</td>";
       	row += "<td>Cuota "+(i+1)+" de "+cuotas+"</td>";
       	row += "<td>"+resul.toFixed(2)+"</td>";
       
       
       	row +="</tr>";

      	$("#pagos tbody").append(row);

    }
});
    
    
    </script>



</body>

</html>