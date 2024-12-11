<%@include file="conexion.jsp"%>
<%    if (request.getParameter("listar").equals("buscarproveedor")) {
        try {
            Statement st = null;
            ResultSet rs = null;
            st = conn.createStatement();
            rs = st.executeQuery("SELECT idcita, p.pa_nombre,p.pa_ci FROM public.citas c inner join pacientes p on c.idpaciente=p.idpaciente where c.ci_estado='Pendiente';");
%>
<option value="">Seleccionar</option>
<%
                while (rs.next()) {%>
<option value="<%out.print(rs.getString(1));%>,<%out.print(rs.getString(3));%>"><%out.print(rs.getString(2));%></option>
<%}
        } catch (Exception e) {
            out.println("error PSQL" + e);
        }
    }else if (request.getParameter("listar").equals("buscardoctores")) {
String codigo = request.getParameter("id");
                        //String codigo="13";
int prueba = Integer.parseInt(codigo);
        try {
            Statement st = null;
            ResultSet rs = null;
            st = conn.createStatement();
            rs = st.executeQuery("SELECT idservicio, ser_nombre, ser_precio, ser_estado, doc.iddoctor, doc.doc_nombre FROM public.servicios ser inner join doctores doc on ser.iddoctor=doc.iddoctor where ser_estado='Activo' and ser.idservicio NOT IN (SELECT u.idservicio FROM consultas u WHERE u.idservicio=5 and idcita='"+prueba+"');");
%>
<option value="">Seleccionar</option>
<%
                while (rs.next()) {%>
<option value="<%out.print(rs.getString(1));%>,<%out.print(rs.getString(3));%>"><%out.print(rs.getString(2));%></option>
<%}
        } catch (Exception e) {
            out.println("error PSQL" + e);
        }
    }else if (request.getParameter("listar").equals("buscarespe")) {
        try {
            Statement st = null;
            ResultSet rs = null;
            st = conn.createStatement();
            rs = st.executeQuery("SELECT ser.idespecialidad, ser.esp_nombre, doc.iddoctor, doc.doc_nombre FROM public.especialidades ser inner join doctores doc on doc.idespecialidad=ser.idespecialidad; ;");
%>
<option value="">Seleccionar</option>
<%
                while (rs.next()) {%>
<option value="<%out.print(rs.getString(1));%>,<%out.print(rs.getString(4));%>"><%out.print(rs.getString(2));%></option>
<%}
        } catch (Exception e) {
            out.println("error PSQL" + e);
        }
    }%>