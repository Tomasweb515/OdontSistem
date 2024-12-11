<%@page import="java.math.BigInteger"%>
<%@page import="java.security.MessageDigest"%>
<%
    HttpSession sesion = request.getSession(false);
%>

<%
    
    if (sesion == null || sesion.getAttribute("logueado") == null || sesion.getAttribute("logueado").equals("0")) {
        

%>
<script>
    
    window.location.href = "login.jsp";
</script>
<%
        return;
    }
%>
<% 
        String rol = (String) sesion.getAttribute("rol");
        String foto = (String) sesion.getAttribute("foto");
 String passw = (String) sesion.getAttribute("pass");
        String nombre = (String) sesion.getAttribute("usser");
        Integer cont = (Integer) sesion.getAttribute("cont");
%>
<%@include file="header.jsp"%>
<!-- End of Topbar -->

<!-- Begin Page Content -->
<div class="container-fluid">

    <!-- Page Heading -->
    <div class="d-sm-flex align-items-center justify-content-between mb-4">
        <h1 class="h3 mb-0 text-gray-800">Panel de Control</h1>

    </div>
    <div class="row">
    <div class="col-xl-3 col-md-6 mb-4">
    <!-- Content Row -->
    <div class="card border-left-primary shadow h-100 py-2">
                                <div class="card-body">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col mr-2">
                                            <div class="text-xs font-weight-bold text-primary text-uppercase mb-1" id="tabla">
                                                Usuarios</div>
                                            <div class="h5 mb-0 font-weight-bold text-gray-800" >
                                                <table id="tbody">
                                                <tbody>
                                        
                                    </tbody></table>
                                            </div>
                                        </div>
                                        <div class="col-auto">
                                            <i class="fas fa-user fa-2x text-gray-300"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>  </div>
<div class="col-xl-3 col-md-6 mb-4">
                            <div class="card border-left-success shadow h-100 py-2">
                                <div class="card-body">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col mr-2">
                                            <div class="text-xs font-weight-bold text-success text-uppercase mb-1">
                                               Ganancias</div>
                                            <div class="h5 mb-0 font-weight-bold text-gray-800">$215,000</div>
                                        </div>
                                        <div class="col-auto">
                                            <i class="fas fa-dollar-sign fa-2x text-gray-300"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
        
        <div class="col-xl-3 col-md-6 mb-4">
                            <div class="card border-left-warning shadow h-100 py-2">
                                <div class="card-body">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col mr-2">
                                            <div class="text-xs font-weight-bold text-warning text-uppercase mb-1">
                                                Pendientes</div>
                                            <div class="h5 mb-0 font-weight-bold text-gray-800"> <table id="pendiente">
                                                <tbody>
                                        
                                    </tbody></table></div>
                                        </div>
                                        <div class="col-auto">
                                            <i class="fas fa-comments fa-2x text-gray-300"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
        <!-- Earnings (Monthly) Card Example -->

<%if(rol.equals("user")){%>
    Admin
   <% } %>
        <!-- Earnings (Monthly) Card Example -->

        

        <!-- Pending Requests Card Example -->

    

    <!-- Content Row -->
    

        <!-- Content Column -->



    </div>

</div>
<!-- /.container-fluid -->


<%@include file="footer.jsp"%>

<script>
          $(document).ready(function(){
        rellenardatos();
        rellenardato();
        
    });
      function rellenardatos(){
           
            $.ajax({
                data: {listar:'contar'},
            url:'jsp/usuariosM.jsp',
            type: 'post',
           
            success: function(response){
                $("#tbody tbody").html(response); 
            }         
        });
    
       }
    function rellenardato(){
           
            $.ajax({
                data: {listar:'pendiente'},
            url:'jsp/control.jsp',
            type: 'post',
           
            success: function(response){
                $("#pendiente tbody").html(response); 
            }         
        });
    
       }
    
</script>