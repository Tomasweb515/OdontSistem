<%@ page import="javax.servlet.http.*" %>
<%@ page import="javax.servlet.jsp.*" %>
<%@include file="conexion.jsp"%>

<%
    HttpSession sesion = request.getSession();

    if (sesion.getAttribute("logueado") != null && sesion.getAttribute("logueado").equals("1")) {
        response.sendRedirect("../container.jsp");
        return; 
    }

    if (request.getParameter("btnLogin") != null) {
        String user = request.getParameter("usu_nombre");
        String password =request.getParameter("usu_clave");

        Statement st = null;
        ResultSet rs = null;

        try {
            String query = "SELECT idusuario, usu_nombre, usu_clave, usu_estado, usu_tipo, idpersonal, usu_profile  FROM usuario WHERE usu_nombre = ? AND usu_clave = md5(?)";
            PreparedStatement pstmt = conn.prepareStatement(query);
            pstmt.setString(1, user);
            pstmt.setString(2, password);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                sesion.setAttribute("logueado", "1");
                sesion.setAttribute("usser", rs.getString("usu_nombre"));
                sesion.setAttribute("pass", rs.getString("usu_clave"));
                sesion.setAttribute("id", rs.getString("idusuario"));
                sesion.setAttribute("rol", rs.getString("usu_tipo"));
                sesion.setAttribute("foto", rs.getString("usu_profile"));
                response.sendRedirect("../container.jsp");
            } else {
            out.print("<div class='alert alert-danger' role='alert'>A simple danger alert?check it out!</div>");
                
            }
        } catch (SQLException e) {
            out.print("Error en la cta=192.168.1 base de datos: " + e.getMessage());
        } finally {
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException e) {
                    out.print("Error cerrando la conexión: " + e.getMessage());
                }
            }
        }
    }
%>
