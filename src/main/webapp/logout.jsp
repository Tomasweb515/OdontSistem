<%@page import="java.math.BigInteger"%>
<%@page import="java.security.MessageDigest"%>
<%
    // Obtener la sesi�n actual
    HttpSession sesion = request.getSession(false);
    
    if (sesion != null) {
        // Invalidar la sesi�n
        sesion.invalidate();
    }
    
    // Redirigir a la p�gina de inicio o login
    response.sendRedirect("login.jsp");
%>
