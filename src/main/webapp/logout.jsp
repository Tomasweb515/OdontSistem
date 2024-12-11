<%@page import="java.math.BigInteger"%>
<%@page import="java.security.MessageDigest"%>
<%
    // Obtener la sesión actual
    HttpSession sesion = request.getSession(false);
    
    if (sesion != null) {
        // Invalidar la sesión
        sesion.invalidate();
    }
    
    // Redirigir a la página de inicio o login
    response.sendRedirect("login.jsp");
%>
