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
      
        String fecha = request.getParameter("fecharegistro");
        String hora = request.getParameter("hora");

        //out.println(codproveedor + ',' + fecharegistro + ',' + codproducto + ',' + cantidad + ',' + precio);
        try {
        
            Statement st = null;
            
            st = conn.createStatement();
            st.executeUpdate("insert into citas(idpaciente,fecharegistro,ci_estado,hora)values('" + codpaciente + "','" + fecha + "','Pendiente','" + hora + "')");

          

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

        rs = st.executeQuery("select * from citas where ci_estado='Pendiente'");

        while (rs.next()) {

%>
<tr>

    <td><%out.print(rs.getString(1));%></td>
    <td><%out.print(rs.getString(2));%></td>
    <td><%out.print(rs.getString(3));%></td>
    <td><%out.print(rs.getString(4));%></td>
    <td><i title="modificar" class="bi bi-pencil-square" onclick="rellenaredit('<%out.print(rs.getString(1));%>', '<%out.print(rs.getString(2));%>')">reservar cita</i><i title="eliminar" class="bi bi-trash" onclick="$('#pkdel').val('<%out.print(rs.getString(1));%>')" data-bs-toggle="modal" data-bs-target="#exampleModal"></i></td>
</tr>
<%

            }
        } catch (Exception e) {
            out.println("error PSQL" + e);
        }
    } else if (request.getParameter("listar").equals("anularcompras")) {

        try {
            Statement st = null;
            ResultSet pk = null;
            st = conn.createStatement();
            st.executeUpdate("update citas set ci_estado='Anulado' where idcita=" + request.getParameter("idpkcompra") + "");
            //out.println("<div class='alert alert-success' role='alert'>  Datos modificados con exitos!</div>");
        } catch (Exception e) {
            out.println("error PSQL" + e);
        }
    }

%>