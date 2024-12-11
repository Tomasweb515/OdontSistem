
<%@include file="conexion.jsp"%>
<%
    
if(request.getParameter("listar").equals("listar")){

   try{
        Statement st=null;
        ResultSet rs=null;
        st=conn.createStatement();
        rs=st.executeQuery("select pacientes.idpaciente,pacientes.pa_nombre,pacientes.pa_apellido,pacientes.pa_telefono,pacientes.pa_ci,pacientes.pa_correo,ciudades.idciudad,ciudades.ciu_nombre from pacientes inner join ciudades on pacientes.idciudad =ciudades.idciudad order by pacientes.idpaciente asc");
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
    <td><i title="modificar" class="bi bi-pencil-square" onclick="rellenaredit('<%out.print(rs.getString(1));%>','<%out.print(rs.getString(2));%>','<%out.print(rs.getString(3));%>','<%out.print(rs.getString(4));%>','<%out.print(rs.getString(5));%>','<%out.print(rs.getString(6));%>','<%out.print(rs.getString(7));%>')"></i><i title="eliminar" class="bi bi-trash" onclick="$('#idpaciente_e').val('<%out.print(rs.getString(1));%>')" data-bs-toggle="modal" data-bs-target="#exampleModal"></i></td>
</tr>


<% 
    }

}catch(Exception e){
     out.print("error pp"+e);
    }

}else if(request.getParameter("listar").equals("cargar")){

String nombre =request.getParameter("pa_nombre");
String apellido =request.getParameter("pa_apellido");
String telefono =request.getParameter("pa_telefono");
String ci =request.getParameter("pa_ci");
String correo =request.getParameter("pa_correo");
String ciudad =request.getParameter("idciudad");

if(nombre=="" ){
out.print("<div class='alert alert-danger' role='alert'>campo vacio nombre</div>");
}else if(telefono==""){
out.print("<div class='alert alert-danger' role='alert'>campo vacio telefono</div>");
}else if(ci==""){
out.print("<div class='alert alert-danger' role='alert'>campo vacio cedula</div>");}
else if(correo==""){
out.print("<div class='alert alert-danger' role='alert'>campo vacio correo</div>");
}else if(ciudad==""){
out.print("<div class='alert alert-danger' role='alert'>campo vacio ciudad</div>");
}else if(nombre == apellido){
out.print("<div class='alert alert-danger' role='alert'>campo vacio iguales</div>");
}
else{
 try {
            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery("SELECT COUNT(*) FROM pacientes WHERE pa_ci='" + ci + "' ");
            rs.next();
            int count = rs.getInt(1);

            if (count > 0) {
                out.print("<div class='alert alert-warning' role='alert'>Ya existe un paciente con el mismo CI</div>");
            } else if(nombre==telefono) {
out.print("<div class='alert alert-danger' role='alert'>campo  iguales</div>");

}
else{
                st.executeUpdate("INSERT INTO pacientes(pa_nombre, pa_apellido, pa_telefono, pa_ci, pa_correo, idciudad) VALUES ('" + nombre + "','" + apellido + "','" + telefono + "','" + ci + "','" + correo + "','" + ciudad + "')");
                out.print("<div class='alert alert-success' role='alert'>Guardado correctamente</div>");
            }
}catch(Exception e){
     out.print("no funciona"+e);
    }
}
}else if(request.getParameter("listar").equals("modificar")){

String nombre =request.getParameter("pa_nombre");
String apellido =request.getParameter("pa_apellido");
String telefono =request.getParameter("pa_telefono");
String ci =request.getParameter("pa_ci");
String correo =request.getParameter("pa_correo");
String ciudad =request.getParameter("idciudad");
String pk =request.getParameter("idpaciente");
if(nombre==""){
out.print("<div class='alert alert-success' role='alert'>valor vacio</div>");
}else{
 try{
        Statement st=null;
        st=conn.createStatement();
        st.executeUpdate("update  pacientes set pa_nombre='"+nombre+"', pa_apellido='"+apellido+"',pa_telefono='"+telefono+"', pa_ci='"+ci+"',pa_correo='"+correo+"',idciudad='"+ciudad+"' where idpaciente='"+pk+"'");

        out.print("<div class='alert alert-success' role='alert'>modificado correcto</div>");

}catch(Exception e){
     out.print("no funciona"+e);
    }
}
}
else if(request.getParameter("listar").equals("eliminar")){
String pk =request.getParameter("idpaciente_e");

 try{
        Statement st=null;
        st=conn.createStatement();
        st.executeUpdate("DELETE FROM pacientes WHERE idpaciente='" + pk + "'");

        out.print("<div class='alert alert-success' role='alert'>eliminado correcto</div>");

}catch(Exception e){
     out.print("no funciona"+e);
    }

}
     %>