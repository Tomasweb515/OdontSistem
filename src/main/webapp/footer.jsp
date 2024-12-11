 <script>
        function buscar(){
  
  var filtro = $("#buscar").val().toUpperCase();
  
  $("#tabla td").each(function() {
    var textoEnTd = $(this).text().toUpperCase();
    if(textoEnTd.indexOf(filtro)>=0){
      $(this).addClass("existe");
    }else{
      $(this).removeClass("existe");
    }
  })
  
  $("#tabla tbody tr").each(function(){
    if($(this).children(".existe").length>0){
      $(this).show();
    }else{
      $(this).hide();
    }
  })
  
}

function busquedaJQmultiple() {
  var filtro = $("#buscar").val().toUpperCase();

  $("#tabla tbody tr").each(function() {
    
    $(this).children("td").each(function() {
        var texto = $(this).text().toUpperCase();
        
        if (texto.indexOf(filtro) < 0) {
          $(this).addClass("sin");
        }else{
          $(this).removeClass("sin");
        }
    });
    
    // nTds = la cantidad de <td> en el <tr> evaluado
    nTds = $(this).children("td").length
    // nTdsSin = la cantidad de <td> con la clase ".sin" en el <tr> evaluado
    nTdsSin = $(this).children(".sin").length

    if(nTdsSin==nTds){
      //$(this).hide()
      $(this).addClass("noTiene");
    }else{
      //$(this).show()
       $(this).removeClass("noTiene");
    }
    
  });
  
}
</script>
<script>
function cancelar() {
  location.replace("container.jsp");
}
</script>

<footer class="sticky-footer bg-white">
                <div class="container my-auto">
                    
                </div>
            </footer>
            <!-- End of Footer -->

        </div>
        <!-- End of Content Wrapper -->

    </div>
    <!-- End of Page Wrapper -->

    <!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#page-top">
        <i class="fas fa-angle-up"></i>
    </a>

    <!-- Logout Modal-->
    <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
                <div class="modal-footer">
                    <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                    <a class="btn btn-primary" href="logout.jsp">Logout</a>
                </div>
            </div>
        </div>
    </div>

 <!-- Bootstrap core JavaScript-->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="js/sb-admin-2.min.js"></script>

    <!-- Page level plugins -->
    <script src="vendor/chart.js/Chart.min.js"></script>
<!-- fullCalendar 2.2.5 -->
<script src="plugins/moment/moment.min.js"></script>
<script src="plugins/fullcalendar/main.js"></script>
    <!-- Page level custom scripts -->
    <script src="js/demo/chart-area-demo.js"></script>
    <script src="js/demo/chart-pie-demo.js"></script>
</body>

</html>