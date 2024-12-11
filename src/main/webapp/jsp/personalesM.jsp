
<%@include file="conexion.jsp"%>
<%
    
if(request.getParameter("listar").equals("listar")){

   try{
        Statement st=null;
        ResultSet rs=null;
        st=conn.createStatement();
        rs=st.executeQuery("select p.idpersonal,p.per_nombre,p.per_apellido,p.per_telefono,p.per_ci,p.per_correo,c.idciudad,c.ciu_nombre from personales p inner join ciudades c on p.idciudad =c.idciudad order by p.idpersonal asc");
    while(rs.next())
{%>
<tr>
    <td><%out.print(rs.getString(1));%></td>
    <td><%out.print(rs.getString(2));%></td>
    <td><%out.print(rs.getString(3));%></td>
    <td><%out.print(rs.getString(4));%></td>
    <td><%out.print(rs.getString(5));%></td>
    <td><%out.print(rs.getString(6));%></td>
    
    <td><%out.print(rs.getString(8));%></td>
    <td><i title="modificar" class="fas fa-edit" onclick="rellenaredit('<%out.print(rs.getString(1));%>','<%out.print(rs.getString(2));%>','<%out.print(rs.getString(3));%>','<%out.print(rs.getString(4));%>','<%out.print(rs.getString(5));%>','<%out.print(rs.getString(6));%>','<%out.print(rs.getString(7));%>')"></i><i title="eliminar" class="fas fa-trash" onclick="$('#idpersonal_e').val('<%out.print(rs.getString(1));%>')" data-toggle="modal" data-target="#exampleModal"></i><a class="fas fa-eye" href="vista_3.jsp?coco=<% out.print(rs.getString(1));%>"></a></td>
</tr>


<% 
    }

}catch(Exception e){
     out.print("error pp"+e);
    }

}else if(request.getParameter("listar").equals("cargar")){

String nombre =request.getParameter("per_nombre");
String apellido =request.getParameter("per_apellido");
String telefono =request.getParameter("per_telefono");
String ci =request.getParameter("per_ci");
String correo =request.getParameter("per_correo");
String ciudad =request.getParameter("idciudad");

if(nombre==""){
out.print("<div class='alert alert-danger' role='alert'>campo vacio nombre</div>");
}else if(apellido==""){
out.print("<div class='alert alert-danger' role='alert'>campo vacio apellido</div>");}
else if(telefono==""){
out.print("<div class='alert alert-danger' role='alert'>campo vacio telefono</div>");
}else if(ci==""){
out.print("<div class='alert alert-danger' role='alert'>campo vacio cedula</div>");}
else if(correo==""){
out.print("<div class='alert alert-danger' role='alert'>campo vacio correo</div>");
}else if(ciudad==""){
out.print("<div class='alert alert-danger' role='alert'>campo vacio ciudad</div>");
}
else{
try {
            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery("select count(*) FROM personales WHERE per_ci='" + ci + "'");
            rs.next();
            int count = rs.getInt(1);

            if (count > 0) {
                out.print("<div class='alert alert-warning' role='alert'>Ya existe un persolnal con el mismo CI</div>");
            } else {
        st.executeUpdate("INSERT INTO personales(per_nombre, per_apellido,per_telefono,per_ci,per_correo,idciudad) VALUES ('"+nombre+"','"+apellido+"','"+telefono+"','"+ci+"','"+correo+"','"+ciudad+"')");
                out.print("<div class='alert alert-success' role='alert'>Guardado correctamente</div>");
            }
 
}catch(Exception e){
     out.print("no funciona"+e);
    }
}
}else if(request.getParameter("listar").equals("modificar")){

String nombre =request.getParameter("per_nombre");
String apellido =request.getParameter("per_apellido");
String telefono =request.getParameter("per_telefono");
String ci =request.getParameter("per_ci");
String correo =request.getParameter("per_correo");
String ciudad =request.getParameter("idciudad");
String pk =request.getParameter("idpersonal");
if(nombre==""){
out.print("<div class='alert alert-success' role='alert'>valor vacio</div>");
}else{
 try{
        Statement st=null;
        st=conn.createStatement();
        st.executeUpdate("update  personales set per_nombre='"+nombre+"', per_apellido='"+apellido+"',per_telefono='"+telefono+"', per_ci='"+ci+"',per_correo='"+correo+"',idciudad='"+ciudad+"' where idpersonal='"+pk+"'");

        out.print("<div class='alert alert-success' role='alert'>modificado correcto</div>");

}catch(Exception e){
     out.print("no funciona"+e);
    }
}
}
else if(request.getParameter("listar").equals("eliminar")){
String pk =request.getParameter("idpersonal_e");

 try{
        Statement st=null;
        st=conn.createStatement();
        st.executeUpdate("DELETE FROM personales WHERE idpersonal='" + pk + "'");

        out.print("<div class='alert alert-success' role='alert'>eliminado correcto</div>");

}catch(Exception e){
     out.print("no funciona"+e);
    }

}
     %>