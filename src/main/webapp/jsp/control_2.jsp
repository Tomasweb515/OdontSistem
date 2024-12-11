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
String codigo = request.getParameter("id");
                        //String codigo="13";
int prueba = Integer.parseInt(codigo);
        //out.println(codproveedor + ',' + fecharegistro + ',' + codproducto + ',' + cantidad + ',' + precio);
        try {
            Statement st = null;
            ResultSet rs = null;
            ResultSet pk = null;
            st = conn.createStatement();
            rs = st.executeQuery("SELECT idcita FROM citas where ci_estado='Pendiente' and idcita='" + prueba + "';");
            if (rs.next()) {
                //out.println("Existe cabecera");
                st.executeUpdate("insert into consultas(idcita,con_tratamiento,  idservicio, con_diente,con_estado)values('" + rs.getString(1) + "','" + con_tratamiento + "','" +  coddoctores+ "','" + con_diente + "','por tratar')");
            } else {
                //out.println("NO existe cabecera");

                st.executeUpdate("insert into citas (idpaciente,fecharegistro,ci_estado)values('" + codpaciente + "','" + fecha + "','Pendiente')");
                pk = st.executeQuery("SELECT idcita FROM citas where ci_estado='Pendiente' and idcita='" + prueba + "';;");
                pk.next();
                st.executeUpdate("insert into consultas(idcita,con_tratamiento,  idservicio, con_diente,con_estado)values('" + pk.getString(1) + "','" + descripion + "','" + coddoctores + "','" + con_tratamiento + "','" + con_diente + "','por tratar')");
            }

        } catch (Exception e) {
            out.println("esta mal todo arregla" + e);
        }
    } else if (request.getParameter("listar").equals("listar")) {
    String codigo = request.getParameter("id");
                        //String codigo="13";
int prueba = Integer.parseInt(codigo);
        try {
            Statement st = null;
            ResultSet rs = null;
            ResultSet pk = null;
            st = conn.createStatement();
            pk = st.executeQuery("SELECT idcita FROM citas where ci_estado='Finalizado' and idcita='" + prueba + "';;");
            pk.next();
            //SELECT idcita, ci_estado, ci_observacion, idpaciente, idusuario, precio, iddoctor, fecharegistro, fechaatencion, hora

            rs = st.executeQuery("select dt.idconsulta,dt.con_tratamiento,dt.con_diente, p.ser_precio,dt.con_estado from consultas dt, servicios p where dt.idservicio=p.idservicio and dt.idcita='" + pk.getString(1) + "'");

            while (rs.next()) {
                
                
               
%>
<tr>
    <td><i class="fas fa-trash" data-toggle="modal" data-target="#exampleModal" onclick="$('#pkdel').val(<%out.print(rs.getString(1));%>)"></i> <i data-toggle="modal" data-target="#edit" class="fas fa-check" onclick="$('#pkmod').val(<%out.print(rs.getString(1));%>)"></i></td>
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
String codigo = request.getParameter("id");
                        //String codigo="13";
int prueba = Integer.parseInt(codigo);
    try {
        Statement st = null;
        ResultSet rs = null;
        ResultSet pk = null;
        st = conn.createStatement();
        pk = st.executeQuery("SELECT idcita FROM citas where ci_estado='Finalizado' and idcita='" + prueba + "';;");
        pk.next();
        rs = st.executeQuery("select COALESCE(Sum(p.ser_precio),0) from consultas dt, servicios p where dt.idservicio=p.idservicio and dt.idcita='" + pk.getString(1) + "'");
        int sumador = 0;
        while (rs.next()) {
           
            String precio = rs.getString(1);
            
            Integer precio1 = Integer.parseInt(precio);
            
            sumador = precio1;
        }
        out.println(sumador);
    } catch (Exception e) {
        out.println("error PSQL" + e);
    }
}else if (request.getParameter("listar").equals("listarsubsuma")) {
String codigo = request.getParameter("id");
                        //String codigo="13";
int prueba = Integer.parseInt(codigo);
    try {
        Statement st = null;
        ResultSet rs = null;
        ResultSet pk = null;
        st = conn.createStatement();
        pk = st.executeQuery("	SELECT c.idcita FROM citas c inner join consultas co on c.idcita=co.idcita  where ci_estado='Finalizado' and co.con_estado='Tratado' and c.idcita='" + prueba + "';;");
        pk.next();
        rs = st.executeQuery("	select COALESCE(Sum(p.ser_precio),0) from consultas dt, servicios p where dt.idservicio=p.idservicio and dt.con_estado='Tratado' and dt.idcita='" + pk.getString(1) + "'");
        int sumador = 0;
        while (rs.next()) {
           
            String precio = rs.getString(1);
            
            Integer precio1 = Integer.parseInt(precio);
            
            sumador = precio1;
        }
        out.println(sumador);
    } catch (Exception e) {
        out.println("error PSQL" + e);
    }
}else if (request.getParameter("listar").equals("listarpagar")) {
String codigo = request.getParameter("id");
                        //String codigo="13";
int prueba = Integer.parseInt(codigo);
    try {
        Statement st = null;
        ResultSet rs = null;
        ResultSet pk = null;
        st = conn.createStatement();
        pk = st.executeQuery("SELECT c.idcita FROM citas c inner join consultas co on c.idcita=co.idcita  where ci_estado='Finalizado' and c.idcita='" + prueba + "';;");
        pk.next();
        rs = st.executeQuery("select COALESCE(Sum(p.ser_precio),0) from consultas dt, servicios p where dt.idservicio=p.idservicio and dt.idcita='" + pk.getString(1) + "'");
        int sumador =0;
        while (rs.next()) {
           
            String precio = rs.getString(1);
            
            Integer precio1 = Integer.parseInt(precio);
            
            sumador = precio1;
        }
        out.println(sumador);
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
String codigo = request.getParameter("id");
                        //String codigo="13";
int prueba = Integer.parseInt(codigo);
    try {
        Statement st = null;
        ResultSet pk = null;
        st = conn.createStatement();
        pk = st.executeQuery("SELECT idcita FROM citas where ci_estado='Finalizado' and idcita='" + prueba + "';;");
        pk.next();
        st.executeUpdate("update citas set ci_estado='Cancelado' where idcita=" + pk.getString(1) + "");
        //out.println("<div class='alert alert-success' role='alert'>  Datos modificados con exitos!</div>");
    } catch (Exception e) {
        out.println("error PSQL" + e);
    }
} else if (request.getParameter("listar").equals("finalcompra")) {
String codigo = request.getParameter("id");
                        //String codigo="13";
int prueba = Integer.parseInt(codigo);
    try {
        Statement st = null;
        ResultSet pk = null;
        st = conn.createStatement();
        pk = st.executeQuery("SELECT idcita FROM citas where ci_estado='Pendiente' and idcita='" + prueba + "';;");
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

        rs = st.executeQuery("select c.idcita,to_char(c.fecharegistro,'dd-mm-YYYY'),p.pa_nombre,c.total from citas c inner join pacientes p on c.idpaciente = p.idpaciente where c.ci_estado='Finalizado'");

        while (rs.next()) {

%>
<tr>

    <td><%out.print(rs.getString(1));%></td>
    <td><%out.print(rs.getString(2));%></td>
    <td><%out.print(rs.getString(3));%></td>
    <td><%out.print(rs.getString(4));%></td>
    <td><i class="fa fa-trash" data-toggle="modal" data-target="#exampleModal" onclick="$('#pkanul').val(<%out.print(rs.getString(1));%>)"></i>  

        <i class="fa fa-money-bill" data-toggle="modal" data-target="#CompraModal" onclick="$('#pkanul').val(<%out.print(rs.getString(1));%>)"></i>

    
    </td>
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
    }else if (request.getParameter("listar").equals("finalcompra")) {
String codigo = request.getParameter("id");
                        //String codigo="13";
int prueba = Integer.parseInt(codigo);
    try {
        Statement st = null;
        ResultSet pk = null;
        st = conn.createStatement();
        pk = st.executeQuery("SELECT idcita FROM citas where ci_estado='Pendiente' and idcita='" + prueba + "';;");
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
%>