


<%@include file="conexion.jsp"%>
<%
       HttpSession sesion = request.getSession();

if (request.getParameter("listar").equals("paciente")) {
String codigo = request.getParameter("id");
                        //String codigo="13";
int prueba = Integer.parseInt(codigo);
    try {
        Statement st = null;
        ResultSet rs = null;
        st = conn.createStatement();

        rs = st.executeQuery("select c.*,p.pa_nombre from citas c inner join pacientes p on c.idpaciente=p.idpaciente where (c.ci_estado='Pendiente' or c.ci_estado='Finalizado') and c.idcita='"+prueba+"'");

        while (rs.next()) {

%>


     <%out.print(rs.getString(8));%>

<%

            }
        } catch (Exception e) {
            out.println("error PSQL" + e);
        }
    }
else if (request.getParameter("listar").equals("idpaciente")) {
String codigo = request.getParameter("id");
                        //String codigo="13";
int prueba = Integer.parseInt(codigo);
    try {
        Statement st = null;
        ResultSet rs = null;
        st = conn.createStatement();

        rs = st.executeQuery("select c.*,p.pa_nombre from citas c inner join pacientes p on c.idpaciente=p.idpaciente where (c.ci_estado='Pendiente' or c.ci_estado='Finalizado') and c.idcita='"+prueba+"'");

        while (rs.next()) {

%>


     <%out.print(rs.getString(3));%>

<%

            }
        } catch (Exception e) {
            out.println("error PSQL" + e);
        }
    }else if (request.getParameter("listar").equals("ci")) {
String codigo = request.getParameter("id");
                        //String codigo="13";
int prueba = Integer.parseInt(codigo);
    try {
        Statement st = null;
        ResultSet rs = null;
        st = conn.createStatement();

        rs = st.executeQuery("select p.pa_ci from citas c inner join pacientes p on c.idpaciente=p.idpaciente where (c.ci_estado='Pendiente' or c.ci_estado='Finalizado') and c.idcita='"+prueba+"'");

        while (rs.next()) {

%>


     <%out.print(rs.getString(1));%>

<%

            }
        } catch (Exception e) {
            out.println("error PSQL" + e);
        }
    }

else if (request.getParameter("listar").equals("telefono")) {
String codigo = request.getParameter("id");
                        //String codigo="13";
int prueba = Integer.parseInt(codigo);
    try {
        Statement st = null;
        ResultSet rs = null;
        st = conn.createStatement();

        rs = st.executeQuery("select p.pa_telefono from citas c inner join pacientes p on c.idpaciente=p.idpaciente where (c.ci_estado='Pendiente' or c.ci_estado='Finalizado') and c.idcita='"+prueba+"'");

        while (rs.next()) {

%>


     <%out.print(rs.getString(1));%>
	

<%

            }
        } catch (Exception e) {
            out.println("error PSQL" + e);
        }
    }else if (request.getParameter("listar").equals("doct")) {
String codigo = request.getParameter("id");
                        //String codigo="13";
int prueba = Integer.parseInt(codigo);
    try {
        Statement st = null;
        ResultSet rs = null;
        st = conn.createStatement();

        rs = st.executeQuery("select DISTINCT doc.doc_nombre from citas c inner join pacientes p on c.idpaciente=p.idpaciente inner join consultas con on c.idcita=con.idcita left join especialidades esp on con.idespecialidad=esp.idespecialidad inner join doctores doc on doc.idespecialidad=esp.idespecialidad where (c.ci_estado='Pendiente' or c.ci_estado='Finalizado') and c.idcita='"+prueba+"'");

        while (rs.next()) {

%>


     <%out.print(rs.getString(1));%>

<%

            }
        } catch (Exception e) {
            out.println("error PSQL" + e);
        }
    }else if (request.getParameter("listar").equals("esp")) {
String codigo = request.getParameter("id");
                        //String codigo="13";
int prueba = Integer.parseInt(codigo);
    try {
        Statement st = null;
        ResultSet rs = null;
        st = conn.createStatement();

        rs = st.executeQuery("select DISTINCT esp.esp_nombre from citas c inner join pacientes p on c.idpaciente=p.idpaciente inner join consultas con on c.idcita=con.idcita left join especialidades esp on con.idespecialidad=esp.idespecialidad inner join doctores doc on doc.idespecialidad=esp.idespecialidad where (c.ci_estado='Pendiente' or c.ci_estado='Finalizado') and c.idcita='"+prueba+"'");

        while (rs.next()) {

%>


     <%out.print(rs.getString(1));%>

<%

            }
        } catch (Exception e) {
            out.println("error PSQL" + e);
        }
    }
%>