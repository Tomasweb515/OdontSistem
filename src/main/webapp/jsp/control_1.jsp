<%@include file="conexion.jsp"%>
<%    HttpSession sesion = request.getSession();
    if (request.getParameter("listar").equals("cargar")) {

        /*DATOS PARA LA CABECERA*/
        //idproveedor
        //SELECT idcita, ci_estado, ci_observacion, idpaciente,
        //idusuario, precio, iddoctor, fecharegistro, fechaatencion, hora

        /*DATOS PARA EL DETALLE*/
        //idproducto
        //cantidad
        //preciost.executeUpdate("insert into citas(idcita, ci_observacion, 
        //idpaciente, idusuario, precio, iddoctor, fecharegistro, 
        //fechaatencion, hora)values('" + rs.getString(1) + "','" + descripion + "','" + coddoctores + "','" + hora + "','" + fechaatencion + "')");
        String codpaciente = request.getParameter("codpaciente");
        String con_tratamiento = request.getParameter("con_tratamiento");
        String coddoctores = request.getParameter("coddoctores");
        String con_diente = request.getParameter("con_diente");
        String descripion = request.getParameter("ci_observacion");
        String fecha = request.getParameter("fecharegistro");

        //out.println(codproveedor + ',' + fecharegistro + ',' + codproducto + ',' + cantidad + ',' + precio);
        try {
            Statement st = null;
            ResultSet rs = null;
            ResultSet pk = null;
            st = conn.createStatement();
            rs = st.executeQuery("SELECT idcita FROM citas where ci_estado='Pendiente';");
            if (rs.next()) {
                //out.println("Existe cabecera");
                st.executeUpdate("insert into consultas(idcita,con_tratamiento,  idservicio, con_diente,con_estado)values('" + rs.getString(1) + "','" + con_tratamiento + "','" +  coddoctores+ "','" + con_diente + "','por tratar')");
            } else {
                //out.println("NO existe cabecera");

                st.executeUpdate("insert into citas (idpaciente,fecharegistro,ci_estado)values('" + codpaciente + "','" + fecha + "','Pendiente')");
                pk = st.executeQuery("SELECT idcita FROM citas where ci_estado='Pendiente';");
                pk.next();
                st.executeUpdate("insert into consultas(idcita,con_tratamiento,  idservicio, con_diente,con_estado)values('" + pk.getString(1) + "','" + descripion + "','" + coddoctores + "','" + con_tratamiento + "','" + con_diente + "','por tratar')");
            }

        } catch (Exception e) {
            out.println("esta mal todo arregla" + e);
        }
    } else if (request.getParameter("listar").equals("listar")) {
        try {
            Statement st = null;
            ResultSet rs = null;
            ResultSet pk = null;
            st = conn.createStatement();
            pk = st.executeQuery("SELECT idcita FROM citas where ci_estado='Pendiente';");
            pk.next();
            //SELECT idcita, ci_estado, ci_observacion, idpaciente, idusuario, precio, iddoctor, fecharegistro, fechaatencion, hora

            rs = st.executeQuery("select dt.idconsulta,dt.con_tratamiento,dt.con_diente, p.ser_precio,dt.con_estado from consultas dt, servicios p where dt.idservicio=p.idservicio and dt.idcita='" + pk.getString(1) + "'");

            while (rs.next()) {
                
                
               
%>
<tr>
    <td><i class="fas fa-trash" data-toggle="modal" data-target="#exampleModal" onclick="$('#pkdel').val(<%out.print(rs.getString(1));%>)"></i><i class="fas fa-trash" data-toggle="modal" data-target="#exampleModal" onclick="$('#pkdel').val(<%out.print(rs.getString(1));%>)"></i> <i data-toggle="modal" data-target="#edit" class="fas fa-check" onclick="$('#pkmod').val(<%out.print(rs.getString(1));%>"></i></td>
   <td><%out.print(rs.getString(1));%></td>
    <td><%out.print(rs.getString(2));%></td>
    <td><%out.print(rs.getString(3));%></td>
    <td><%out.print(rs.getString(4));%></td>
    <td><%out.print(rs.getString(5));%></td>

</tr>
<%

        }
    } catch (Exception e) {
        out.println("error PSQL" + e);
    }
} else if (request.getParameter("listar").equals("listarsuma")) {
    try {
String codigo = request.getParameter("id");
                        //String codigo="13";
int prueba = Integer.parseInt(codigo);
        Statement st = null;
        ResultSet rs = null;
        ResultSet pk = null;
        st = conn.createStatement();
        pk = st.executeQuery("SELECT idcita FROM citas where ci_estado='Pendiente' and idcita='" + prueba + "';");
        pk.next();
        rs = st.executeQuery("select COALESCE(Sum(p.ser_precio),0) from consultas dt, servicios p where dt.idservicio=p.idservicio and dt.idcita='" + pk.getString(1) + "'");
       
        while (rs.next()) {
           
           %>
<tr>
   
   <td><%out.print(rs.getString(1));%></td>


</tr>
<%
        }
        
    } catch (Exception e) {
        out.println("error PSQL" + e);
    }
} else if (request.getParameter("listar").equals("elimregcompra")) {

    String pk = request.getParameter("pkd");
    try {
        Statement st = null;
        st = conn.createStatement();
        st.executeUpdate("delete from consultas where idconsulta=" + pk + "");
        //out.println("<div class='alert alert-success' role='alert'>  Datos eliminados con exitos!</div>");
    } catch (Exception e) {
        out.println("error PSQL" + e);
    }
}else if (request.getParameter("listar").equals("termincompra")) {

    String pk = request.getParameter("pkd");
    try {
        Statement st = null;
        st = conn.createStatement();
        st.executeUpdate("update consultas set con_estado='Tratado' where idconsulta=" + pk + "");
        //out.println("<div class='alert alert-success' role='alert'>  Datos eliminados con exitos!</div>");
    } catch (Exception e) {
        out.println("error PSQL" + e);
    }
} else if (request.getParameter("listar").equals("cancelcompra")) {

    try {
        Statement st = null;
        ResultSet pk = null;
        st = conn.createStatement();
        pk = st.executeQuery("SELECT idcita FROM citas where ci_estado='Pendiente';");
        pk.next();
        st.executeUpdate("update citas set ci_estado='Cancelado' where idcita=" + pk.getString(1) + "");
        //out.println("<div class='alert alert-success' role='alert'>  Datos modificados con exitos!</div>");
    } catch (Exception e) {
        out.println("error PSQL" + e);
    }
} else if (request.getParameter("listar").equals("finalcompra")) {

    try {
        Statement st = null;
        ResultSet pk = null;
        st = conn.createStatement();
        pk = st.executeQuery("SELECT idcita FROM citas where ci_estado='Pendiente';");
        pk.next();
        st.executeUpdate("update citas set ci_estado='Finalizado', total=" + request.getParameter("total") + " where idcita=" + pk.getString(1) + "");
        //out.println("<div class='alert alert-success' role='alert'>  Datos modificados con exitos!</div>");
    } catch (Exception e) {
        out.println("error PSQL" + e);
    }
} else if (request.getParameter("listar").equals("listarcompras")) {
    try {
        Statement st = null;
        ResultSet rs = null;
        st = conn.createStatement();

        rs = st.executeQuery("select pa.idpagos,to_char(pa.pa_fecha,'dd-mm-YYYY'),p.pa_nombre,c.total,pa.pa_estado,pa.pa_tipo from citas c inner join pacientes p on c.idpaciente = p.idpaciente inner join pagos pa on c.idcita=pa.idcita where c.ci_estado='Finalizado' and pa.pa_estado='Emitido' or pa.pa_estado='Procesando'");

        while (rs.next()) {

%>
<tr>

    <td><%out.print(rs.getString(1));%></td>
    <td><%out.print(rs.getString(2));%></td>
    <td><%out.print(rs.getString(3));%></td>
    <td><%out.print(rs.getString(4));%></td>
    <td><%out.print(rs.getString(5));%></td>
    <td><%out.print(rs.getString(6));%></td>
     <td>
<%if (rs.getString(1).equals("Procesando")) {%>
        <i class="fa fa-money-bill" data-toggle="modal" data-target="#CompraModal" onclick="$('#pkanul').val(<%out.print(rs.getString(1));%>)"></i><%}%>
            <a class="fas fa-eye" href="reportfactu_1.jsp?coco=<% out.print(rs.getString(1));%>"></a>


    </td>
</tr>
<%

            }
        } catch (Exception e) {
            out.println("error PSQL" + e);
        }
    } else if (request.getParameter("listar").equals("compras")) {
    String caja = request.getParameter("idpk");
        try {
 Statement st = conn.createStatement(); 
            ResultSet rs = st.executeQuery("select count(*) FROM pagos pg inner join aperturacaja ap on pg.idapertura=ap.idapertura WHERE pg.idcita='" + request.getParameter("idpkcompra") + "' and ap.ape_estado='abierta'");
            rs.next();
            int count = rs.getInt(1);

            if (count > 0) {
                out.print("<div class='alert alert-warning' role='alert'>Ya existe</div>");
            }else { 
            
            st.executeUpdate("insert into pagos(idcita,pa_estado,idapertura,idusuario)values('" + request.getParameter("idpkcompra") + "','Procesando','" + request.getParameter("idpk") + "')"); 
           
//out.println("<div class='alert alert-success' role='alert'>  Datos modificados con exitos!</div>");
        }} catch (Exception e) {
            out.println("error PSQL" + e);
        }
    }else if (request.getParameter("listar").equals("finalcompra")) {

    try {
        Statement st = null;
        ResultSet pk = null;
        st = conn.createStatement();
        pk = st.executeQuery("SELECT idcita FROM citas where ci_estado='Pendiente';");
        pk.next();
        st.executeUpdate("update citas set ci_estado='Finalizado', total=" + request.getParameter("total") + " where idcita=" + pk.getString(1) + "");
        //out.println("<div class='alert alert-success' role='alert'>  Datos modificados con exitos!</div>");
    } catch (Exception e) {
        out.println("error PSQL" + e);
    }
} else if (request.getParameter("listar").equals("pendiente")) {
    try {
        Statement st = null;
        ResultSet rs = null;
        st = conn.createStatement();

        rs = st.executeQuery("select count(*) from citas where ci_estado='Pendiente'");

        while (rs.next()) {

%>
<tr>

    <td><%out.print(rs.getString(1));%></td>
    
</td>
</tr>
<%        

            }
        } catch (Exception e) {
            out.println("error PSQL" + e);
        }
    }
else if(request.getParameter("listar").equals("imforme")){
String fechain =request.getParameter("fechaini");
String fechafi =request.getParameter("fechafin");
String estadoU =request.getParameter("estado");

 try{
Statement st = null;
        ResultSet rs = null;
st=conn.createStatement();
 rs=st.executeQuery("select c.idcita,to_char(pa.pa_fecha,'dd-mm-YYYY'),p.pa_nombre,c.total,pa.pa_estado,pa.pa_tipo from citas c inner join pacientes p on c.idpaciente = p.idpaciente inner join pagos pa on c.idcita=pa.idcita where c.ci_estado='Finalizado' and pa.pa_estado='" + estadoU + "' and pa_fecha BETWEEN '" + fechain + "' AND '" + fechafi + "'");

 while (rs.next()) {

%>
<tr>

    <td><%out.print(rs.getString(1));%></td>
    <td><%out.print(rs.getString(2));%></td>
    <td><%out.print(rs.getString(3));%></td>
    <td><%out.print(rs.getString(4));%></td>
    <td><%out.print(rs.getString(5));%></td>
    <td><%out.print(rs.getString(6));%></td>
    

    </td>
</tr>
<%
       }
        } catch (Exception e) {
            out.println("error PSQL" + e);
        }
    }
%>