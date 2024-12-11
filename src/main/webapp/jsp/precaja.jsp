
<%@include file="conexion.jsp"%>
<%
       
 if (request.getParameter("listar").equals("esp")) {
    try {
        Statement st = null;
        ResultSet rs = null;
        st = conn.createStatement();

        rs = st.executeQuery("select idapertura from aperturacaja where ape_estado='abierta'");

        while (rs.next()) {

%>


     <%out.print(rs.getString(1));%>

<%

            }
        } catch (Exception e) {
            out.println("error PSQL" + e);
        }
    }%>