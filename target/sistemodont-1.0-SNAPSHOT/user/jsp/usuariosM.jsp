
<%@include file="conexion.jsp"%>
<%
    
if(request.getParameter("listar").equals("listar")){

   try{
        Statement st=null;
        ResultSet rs=null;
        st=conn.createStatement();
        rs=st.executeQuery("SELECT u.idusuario, u.usu_nombre, u.usu_clave, u.usu_estado, u.usu_tipo, p.per_nombre FROM public.usuario u INNER JOIN public.personales p ON u.idpersonal = p.idpersonal;");
    while(rs.next())
{%>
<tr>
    <td><%out.print(rs.getString(1));%></td>
    <td><%out.print(rs.getString(2));%></td>
    <td><%out.print(rs.getString(3));%></td>
    <td><%out.print(rs.getString(4));%></td>
    <td><%out.print(rs.getString(5));%></td>
    <td><%out.print(rs.getString(6));%></td>
    
    
    <td><i title="modificar" class="bi bi-pencil-square" onclick="rellenaredit('<%out.print(rs.getString(1));%>','<%out.print(rs.getString(2));%>','<%out.print(rs.getString(3));%>','<%out.print(rs.getString(4));%>','<%out.print(rs.getString(5));%>','<%out.print(rs.getString(6));%>')"></i><i title="eliminar" class="bi bi-trash" onclick="$('#idusuario_e').val('<%out.print(rs.getString(1));%>')" data-bs-toggle="modal" data-bs-target="#exampleModal"></i></td>
</tr>


<% 
    }

}catch(Exception e){
     out.print("error pp"+e);
    }

}else if(request.getParameter("listar").equals("cargar")){

String nombre =request.getParameter("usu_nombre");
String clave =request.getParameter("usu_clave");
String estado =request.getParameter("usu_estado");
String tipo =request.getParameter("usu_tipo");
String persona =request.getParameter("idpersonal");

if(nombre==""){
out.print("<div class='alert alert-danger' role='alert'>campo vacio nombre</div>");
}else if(clave==""){
out.print("<div class='alert alert-danger' role='alert'>campo vacio apellido</div>");}
else if(estado==""){
out.print("<div class='alert alert-danger' role='alert'>campo vacio telefono</div>");
}else if(tipo==""){
out.print("<div class='alert alert-danger' role='alert'>campo vacio cedula</div>");}
else if(persona==""){
out.print("<div class='alert alert-danger' role='alert'>campo vacio correo</div>");
}
else{
try {
            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery("select count(*) FROM usuario WHERE usu_nombre='" + nombre + "'");
            rs.next();
            int count = rs.getInt(1);

            if (count > 0) {
                out.print("<div class='alert alert-warning' role='alert'>Ya existe una ciudad con el mismo nombre</div>");
            } else {
        st.executeUpdate("INSERT INTO usuario(usu_nombre, usu_clave,usu_estado,usu_tipo,idpersonal) VALUES ('"+nombre+"','"+clave+"','"+estado+"','"+tipo+"','"+persona+"')");
                out.print("<div class='alert alert-success' role='alert'>Guardado correctamente</div>");
            }

}catch(Exception e){
     out.print("no funciona"+e);
    }
}
}else if(request.getParameter("listar").equals("modificar")){

String nombre =request.getParameter("usu_nombre");
String clave =request.getParameter("usu_clave");
String estado =request.getParameter("usu_estado");
String tipo =request.getParameter("usu_tipo");
String persona =request.getParameter("idpersonal");
String pk =request.getParameter("idusuario");
if(nombre==""){
out.print("<div class='alert alert-success' role='alert'>valor vacio</div>");
}else{
 try{
        Statement st=null;
        st=conn.createStatement();
        st.executeUpdate("update  usuario set usu_nombre='"+nombre+"', usu_clave='"+clave+"',usu_estado='"+estado+"', usu_tipo='"+tipo+"',idpersonal='"+persona+"' where idusuario='"+pk+"'");

        out.print("<div class='alert alert-success' role='alert'>modificado correcto</div>");

}catch(Exception e){
     out.print("no funciona"+e);
    }
}
}
else if(request.getParameter("listar").equals("eliminar")){
String pk =request.getParameter("idusuario_e");

 try{
        Statement st=null;
        st=conn.createStatement();
        st.executeUpdate("DELETE FROM usuario WHERE idusuario='" + pk + "'");

        out.print("<div class='alert alert-success' role='alert'>eliminado correcto</div>");

}catch(Exception e){
     out.print("no funciona"+e);
    }

}
     %>