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
            ResultSet rs = null;
            ResultSet pk = null;
            st = conn.createStatement();
            rs = st.executeQuery("SELECT idcita FROM citas where (hora='" + hora + "' or idpaciente='" + codpaciente + "') and ci_estado='Pendiente';");
            if (rs.next()) {
                //out.println("Existe cabecera");
                out.print("<div class='alert alert-warning' role='alert'>Ya esta agendado un paciente en ese horario</div>");
            } else {
                //out.println("NO existe cabecera");

            st.executeUpdate("insert into citas(idpaciente,fecharegistro,ci_estado,hora)values('" + codpaciente + "','" + fecha + "','Pendiente','" + hora + "')");
                              out.print("<div class='alert alert-warning' role='alert'>Agregado correctamente</div>");

    }

        }catch(Exception e){
     out.print("no funciona"+e);
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
}  else if (request.getParameter("listar").equals("cancelcompra")) {

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
String codigo = request.getParameter("id");
                        //String codigo="13";
int prueba = Integer.parseInt(codigo);
    try {
        Statement st = null;
        ResultSet pk = null;
        st = conn.createStatement();
        pk = st.executeQuery("SELECT idcita FROM citas where ci_estado='Pendiente' and idcita='" + prueba + "';");
        pk.next();
        st.executeUpdate("update citas set ci_estado='Finalizado', total='" + request.getParameter("total") + "' where idcita='" + prueba + "'");
        //out.println("<div class='alert alert-success' role='alert'>  Datos modificados con exitos!</div>");
    } catch (Exception e) {
        out.println("error PSQL" + e);
    }
} else if (request.getParameter("listar").equals("listarcompras")) {
    try {
        Statement st = null;
        ResultSet rs = null;
        st = conn.createStatement();

        rs = st.executeQuery("select c.*,p.pa_nombre from citas c inner join pacientes p on c.idpaciente=p.idpaciente where c.ci_estado='Pendiente'");

        while (rs.next()) {

%>
<tr>

    <td><%out.print(rs.getString(1));%></td>
    <td><%out.print(rs.getString(2));%></td>
    <td><%out.print(rs.getString(8));%></td>
    <td><%out.print(rs.getString(4));%></td>
     <td><%out.print(rs.getString(7));%></td>
     <td><i title="modificar" class="fas fa-edit" data-toggle="modal" data-target="#editModal" onclick="rellenaredit('<%out.print(rs.getString(1));%>','<%out.print(rs.getString(8));%>','<%out.print(rs.getString(4));%>','<%out.print(rs.getString(7));%>')">Reagendar cita</i><i class="fa fa-trash" data-toggle="modal" data-target="#exampleModal" onclick="$('#pkanul').val(<%out.print(rs.getString(1));%>)"></i><a class="fas fa-check" href="vistac.jsp?id=<%out.print(rs.getString(1));%>"></td>
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

else if(request.getParameter("listar").equals("modificar")){


String fecha =request.getParameter("fecharegistro");
String hora =request.getParameter("hora");
String pk =request.getParameter("idcita");

 try{
        Statement st=null;
        st=conn.createStatement();
        st.executeUpdate("update citas set fecharegistro='"+fecha+"', hora='"+hora+"' where idcita='"+pk+"'");

        out.print("<div class='alert alert-success' role='alert'>modificado correcto</div>");

}catch(Exception e){
     out.print("no funciona"+e);
    }
}else if (request.getParameter("listar").equals("listar1")) {
String codigo = request.getParameter("id");
                        //String codigo="13";
                        int prueba = Integer.parseInt(codigo);
    try {
        Statement st = null;
        ResultSet rs = null;
        st = conn.createStatement();

        rs = st.executeQuery("select c.*,p.pa_nombre from citas c inner join pacientes p on c.idpaciente=p.idpaciente where c.ci_estado='Pendiente' and idcita='"+prueba+"'");

        while (rs.next()) {

%>
<tr>

    <td><%out.print(rs.getString(1));%></td>
    <td><%out.print(rs.getString(2));%></td>
    <td><%out.print(rs.getString(8));%></td>
    <td><%out.print(rs.getString(4));%></td>
     <td><%out.print(rs.getString(7));%></td>
     <td><i title="modificar" class="fas fa-edit" data-toggle="modal" data-target="#editModal" onclick="rellenaredit('<%out.print(rs.getString(1));%>','<%out.print(rs.getString(8));%>','<%out.print(rs.getString(4));%>','<%out.print(rs.getString(7));%>')">Reagendar cita</i><i class="fa fa-trash" data-toggle="modal" data-target="#exampleModal" onclick="$('#pkanul').val(<%out.print(rs.getString(1));%>)"></i><i class="fas fa-check" onclick="rellenaredit('<%out.print(rs.getString(1));%>'"></i><a class="fas fa-check" href="edit.jsp?id=<%out.print(rs.getString(1));%>"></td>
</tr>
<%

            }
        } catch (Exception e) {
            out.println("error PSQL" + e);
        }
    }else if (request.getParameter("listar").equals("paciente")) {
String codigo = request.getParameter("id");
                        //String codigo="13";
int prueba = Integer.parseInt(codigo);
    try {
        Statement st = null;
        ResultSet rs = null;
        st = conn.createStatement();

        rs = st.executeQuery("select c.*,p.pa_nombre from citas c inner join pacientes p on c.idpaciente=p.idpaciente where c.ci_estado='Pendiente' and c.idcita='"+prueba+"'");

        while (rs.next()) {

%>


     <option value="<%out.print(rs.getString(1));%>,<%out.print(rs.getString(3));%>"><%out.print(rs.getString(2));%></option>

<%

            }
        } catch (Exception e) {
            out.println("error PSQL" + e);
        }
    }else if (request.getParameter("listar").equals("doctor")) {
String codigo = request.getParameter("id");
                        //String codigo="13";
                        int prueba = Integer.parseInt(codigo);
    try {
        Statement st = null;
        ResultSet rs = null;
        st = conn.createStatement();

        rs = st.executeQuery("select c.*,p.pa_nombre from citas c inner join pacientes p on c.idpaciente=p.idpaciente where c.ci_estado='Pendiente' and idcita='"+prueba+"'");

        while (rs.next()) {

%>
<tr>

    <td><%out.print(rs.getString(1));%></td>
    <td><%out.print(rs.getString(2));%></td>
    <td><%out.print(rs.getString(8));%></td>
    <td><%out.print(rs.getString(4));%></td>
     <td><%out.print(rs.getString(7));%></td>
     <td><i title="modificar" class="fas fa-edit" data-toggle="modal" data-target="#editModal" onclick="rellenaredit('<%out.print(rs.getString(1));%>','<%out.print(rs.getString(8));%>','<%out.print(rs.getString(4));%>','<%out.print(rs.getString(7));%>')">Reagendar cita</i><i class="fa fa-trash" data-toggle="modal" data-target="#exampleModal" onclick="$('#pkanul').val(<%out.print(rs.getString(1));%>)"></i><i class="fas fa-check" onclick="rellenaredit('<%out.print(rs.getString(1));%>'"></i><a class="fas fa-check" href="edit.jsp?id=<%out.print(rs.getString(1));%>"></td>
</tr>
<%

            }
        } catch (Exception e) {
            out.println("error PSQL" + e);
        }
    }

%>