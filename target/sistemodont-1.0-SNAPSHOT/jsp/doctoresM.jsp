
<%@include file="conexion.jsp"%>
<%
    
if(request.getParameter("listar").equals("listar")){

   try{
        Statement st=null;
        ResultSet rs=null;
        st=conn.createStatement();
        rs=st.executeQuery("SELECT d.iddoctor, d.doc_nombre, d.doc_apellido, d.doc_telefono, d.doc_matricula, d.doc_titulo, d.doc_ci, d.idespecialidad, e.esp_nombre FROM doctores d INNER JOIN especialidades e ON d.idespecialidad = e.idespecialidad ; ");
    while(rs.next())
{%>
<tr>
    <td><%out.print(rs.getString(1));%></td>
    <td><%out.print(rs.getString(2));%></td>
    <td><%out.print(rs.getString(3));%></td>
    <td><%out.print(rs.getString(4));%></td>
    <td><%out.print(rs.getString(5));%></td>
    <td><%out.print(rs.getString(6));%></td>
    <td><%out.print(rs.getString(7));%></td>
    <td><%out.print(rs.getString(9));%></td>
    <td><i title="modificar" class="fas fa-edit" onclick="rellenaredit('<%out.print(rs.getString(1));%>','<%out.print(rs.getString(2));%>','<%out.print(rs.getString(3));%>','<%out.print(rs.getString(4));%>','<%out.print(rs.getString(5));%>','<%out.print(rs.getString(6));%>','<%out.print(rs.getString(7));%>','<%out.print(rs.getString(8));%>')"></i><i title="eliminar" class="fas fa-trash" onclick="$('#iddoctor_e').val('<%out.print(rs.getString(1));%>')" data-toggle="modal" data-target="#exampleModal"></i><a class="fas fa-eye" href="vista_1.jsp?coco=<% out.print(rs.getString(1));%>"></a></td>
</tr>


<% 
    }

}catch(Exception e){
     out.print("error pp"+e);
    }

}else if(request.getParameter("listar").equals("cargar")){

String nombre =request.getParameter("doc_nombre");
String apellido =request.getParameter("doc_apellido");
String telefono =request.getParameter("doc_telefono");
String matricula =request.getParameter("doc_matricula");
String titulo =request.getParameter("doc_titulo");
String ci =request.getParameter("doc_ci");
String especialidad =request.getParameter("idespecialidad");


if(nombre==""){
out.print("<div class='alert alert-danger' role='alert'>campo vacio nombre</div>");
}else if(apellido==""){
out.print("<div class='alert alert-danger' role='alert'>campo vacio apellido</div>");}
else if(telefono==""){
out.print("<div class='alert alert-danger' role='alert'>campo vacio telefono</div>");
}else if(ci==""){
out.print("<div class='alert alert-danger' role='alert'>campo vacio cedula</div>");}
else if(titulo==""){
out.print("<div class='alert alert-danger' role='alert'>campo vacio correo</div>");
}else if(especialidad==""){
out.print("<div class='alert alert-danger' role='alert'>campo vacio especialidad</div>");
}

else{
try {
            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery("select count(*) FROM doctores WHERE doc_ci='" + ci + "' or doc_matricula='" + matricula + "' or doc_telefono='" + telefono + "' ");
            rs.next();
            int count = rs.getInt(1);

            if (count > 0) {
                out.print("<div class='alert alert-warning' role='alert'>Ya existe un doctor con el mismo CI o Matricula o telefono</div>");
            
}else{
        st.executeUpdate("insert into doctores(doc_nombre, doc_apellido,doc_telefono,doc_matricula,doc_titulo,doc_ci,idespecialidad) VALUES ('"+nombre+"','"+apellido+"','"+telefono+"','"+ci+"','"+matricula+"','"+titulo+"','"+especialidad+"')");
                out.print("<div class='alert alert-success' role='alert'>Guardado correctamente</div>");
            }
 
}catch(Exception e){
     out.print("no funciona"+e);
    }
}
}else if(request.getParameter("listar").equals("modificar")){

String nombre =request.getParameter("doc_nombre");
String apellido =request.getParameter("doc_apellido");
String telefono =request.getParameter("doc_telefono");
String ci =request.getParameter("doc_ci");
String matricula =request.getParameter("doc_matricula");
String titulo =request.getParameter("doc_titulo");
String especialidad =request.getParameter("idespecialidad");
String pk =request.getParameter("iddoctor");

if(nombre==""){
out.print("<div class='alert alert-success' role='alert'>valor vacio</div>");
}else{
 try{
        Statement st=null;
        st=conn.createStatement();
        st.executeUpdate("update  doctores set doc_nombre='"+nombre+"', doc_apellido='"+apellido+"',doc_telefono='"+telefono+"', doc_ci='"+ci+"',doc_titulo='"+titulo+"',doc_matricula='"+matricula+"',idespecialidad='"+especialidad+"' where iddoctor='"+pk+"'");

        out.print("<div class='alert alert-success' role='alert'>modificado correcto</div>");

}catch(Exception e){
     out.print("no funciona"+e);
    }
}
}
else if(request.getParameter("listar").equals("eliminar")){
String pk =request.getParameter("iddoctor_e");

 try{
        Statement st=null;
        st=conn.createStatement();
        st.executeUpdate("DELETE FROM doctores WHERE iddoctor='" + pk + "'");

        out.print("<div class='alert alert-success' role='alert'>eliminado correcto</div>");

}catch(Exception e){
     out.print("no funciona"+e);
    }

}
     %>