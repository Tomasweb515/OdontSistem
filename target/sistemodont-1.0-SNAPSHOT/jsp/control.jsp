<%@include file="conexion.jsp"%>
<%@ page import="net.sf.jasperreports.engine.util.*" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%    
    HttpSession sesion = request.getSession();
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
        String especialidad = request.getParameter("codespecialidad");
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
                st.executeUpdate("insert into consultas(idcita,con_tratamiento,  idservicio, con_diente,con_estado,idespecialidad)values('" + rs.getString(1) + "','" + con_tratamiento + "','" +  coddoctores+ "','" + con_diente + "','por tratar','" + especialidad + "')");
            } else {
                //out.println("NO existe cabecera");

                st.executeUpdate("insert into citas (idpaciente,fecharegistro,ci_estado)values('" + codpaciente + "','" + fecha + "','Pendiente')");
                pk = st.executeQuery("SELECT idcita FROM citas where ci_estado='Pendiente' and idcita='" + prueba + "';");
                pk.next();
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
            ResultSet 
            
            pk = null;
            st = conn.createStatement();
            pk = st.executeQuery("SELECT idcita FROM citas where ci_estado='Pendiente' and idcita='" + prueba + "';");
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
}else if (request.getParameter("listar").equals("listarsuma")) {
String codigo = request.getParameter("id");
                        //String codigo="13";
int prueba = Integer.parseInt(codigo);
    try {
        Statement st = null;
        ResultSet rs = null;
        ResultSet pk = null;
        st = conn.createStatement();
        pk = st.executeQuery("SELECT idcita FROM citas where ci_estado='Pendiente' and idcita='" + prueba + "';");
        pk.next();
        rs = st.executeQuery("select COALESCE(Sum(p.ser_precio)) from consultas dt, servicios p where dt.idservicio=p.idservicio and dt.idcita='" + prueba+ "'");
        int sumador=0;
        while (rs.next()) {
           
            String precio = rs.getString(1);
            
            Integer precio1 = Integer.parseInt(precio);
            
            sumador = precio1;
        }
        out.print(sumador);
    } catch (Exception e) {
        out.println("error PSQL" + e);
    }
}

 else if (request.getParameter("listar").equals("elimregcompra")) {

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
        pk = st.executeQuery("SELECT idcita FROM citas where ci_estado='Pendiente' and idcita='" + prueba + "';");
        pk.next();
        st.executeUpdate("update citas set ci_estado='Cancelado' where idcita='" + pk.getString(1) + "'");
        //out.println("<div class='alert alert-success' role='alert'>  Datos modificados con exitos!</div>");
    } catch (Exception e) {
        out.println("error PSQL" + e);
    }
}  else if (request.getParameter("listar").equals("listarcompras")) {
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

        <i class="fa fa-money-bill" data-toggle="modal" data-target="#CompraModal" onclick="$('#pagar').val(<%out.print(rs.getString(1));%>)"></i>
</tr>
    
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
    int prueba = Integer.parseInt(codigo); // Convirtiendo el c�digo de String a Integer

    // Convertimos el valor total a un n�mero entero
    int total;
    try {
        total = Integer.parseInt(request.getParameter("total")); // Conversi�n segura
    } catch (NumberFormatException e) {
        out.println("Error al convertir el total: " + e.getMessage());
        return; // Salir del proceso si hay un error en la conversi�n
    }

    try {
        // Uso de recursos con try-with-resources para manejar Statement de manera segura
        try (PreparedStatement pst = conn.prepareStatement(
                "SELECT idcita FROM citas WHERE ci_estado = ? AND idcita = ?")) {
            pst.setString(1, "Pendiente");
            pst.setInt(2, prueba);
            try (ResultSet pk = pst.executeQuery()) {
                if (pk.next()) {
                    // Si la cita existe y est� pendiente, actualizamos su estado y total
                    try (PreparedStatement updateStmt = conn.prepareStatement(
                            "UPDATE citas SET ci_estado = 'Finalizado', total = ? WHERE idcita = ?")) {
                        updateStmt.setInt(1, total); // Aqu� se usa el valor entero correctamente
                        updateStmt.setInt(2, prueba);
                        updateStmt.executeUpdate();
                        out.println("<div class='alert alert-success' role='alert'>Datos modificados con �xito!</div>");
                    }
                } else {
                    out.println("<div class='alert alert-danger' role='alert'>La cita no existe o no est� pendiente.</div>");
                }
            }
        }
    } catch (Exception e) {
        out.println("Error en la operaci�n SQL: " + e);
    }
}

 else if (request.getParameter("listar").equals("pendiente")) {
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
    }else if (request.getParameter("listar").equals("Emitido")) {

                        //String codigo="13";

String fechas = request.getParameter("fechas");

String horas = request.getParameter("hora");
String motivos = request.getParameter("motivo");
    try {
        Statement st = null;
        ResultSet pk = null;
        st = conn.createStatement();
        pk = st.executeQuery("SELECT idapertura FROM apertura where  idapertura where ape_estado='abierto';");
        pk.next();

        st.executeUpdate("insert into pagos(idcita,pa_estado, pa_fecha,pa_motivo,pa_hora,idusuario,idapertura)values('" + pk.getString(1) + "','Emitido','" + fechas + "','" + motivos + "','" + horas + "','" + pk.getString(1) + "')");
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
 rs=st.executeQuery("select c.idcita,to_char(c.fecharegistro,'dd/mm/YYYY'),p.pa_nombre,c.total from citas c inner join pacientes p on c.idpaciente = p.idpaciente where c.ci_estado='" + estadoU  + "' and c.fecharegistro BETWEEN '" + fechain  + "' AND '" + fechafi  + "'");

 while (rs.next()) {

%>



<tr>

    <td><%out.print(rs.getString(1));%></td>
    <td><%out.print(rs.getString(2));%></td>
    <td><%out.print(rs.getString(3));%></td>
    <td><%out.print(rs.getString(4));%></td>
    
   <td> <a href="reportfactu_2.jsp?coco1=<%out.print(fechain);%>&coco2=<%out.print(fechafi);%>&coco3=<%out.print(estadoU);%>">imdor</a>

    </td>
</tr>
<%
       }
        } catch (Exception e) {
            out.println("error PSQL" + e);
        }
    }
%>