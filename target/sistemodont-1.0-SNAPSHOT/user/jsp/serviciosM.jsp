
<%@include file="conexion.jsp"%>
<%
    
if(request.getParameter("listar").equals("listar")){

   try{
        Statement st=null;
        ResultSet rs=null;
        st=conn.createStatement();
        rs=st.executeQuery("SELECT servicios.idservicio, servicios.ser_nombre, servicios.ser_precio, servicios.ser_estado, servicios.iddoctor,doctores.doc_nombre FROM public.servicios INNER JOIN public.doctores ON servicios.iddoctor = doctores.iddoctor;");
    while(rs.next())
{%>
<tr>
    <td><%out.print(rs.getString(1));%></td>
    <td><%out.print(rs.getString(2));%></td>
    <td><%out.print(rs.getString(3));%></td>
    <td><%out.print(rs.getString(4));%></td>
   
    <td><%out.print(rs.getString(6));%></td>
    
    
    <td><i title="modificar" class="bi bi-pencil-square" onclick="rellenaredit('<%out.print(rs.getString(1));%>','<%out.print(rs.getString(2));%>','<%out.print(rs.getString(3));%>','<%out.print(rs.getString(4));%>','<%out.print(rs.getString(6));%>'"></i><i title="eliminar" class="bi bi-trash" onclick="$('#idservicio_e').val('<%out.print(rs.getString(1));%>')" data-bs-toggle="modal" data-bs-target="#exampleModal"></i></td>
</tr>


<% 
    }

}catch(Exception e){
     out.print("error pp"+e);
    }

}else if(request.getParameter("listar").equals("cargar")){

String nombre =request.getParameter("ser_nombre");
String precio =request.getParameter("ser_precio");
String estado =request.getParameter("ser_estado");

String doctor =request.getParameter("iddoctor");

if(nombre==""){
out.print("<div class='alert alert-danger' role='alert'>campo vacio nombre</div>");
}else if(precio==""){
out.print("<div class='alert alert-danger' role='alert'>campo vacio apellido</div>");}
else if(estado==""){
out.print("<div class='alert alert-danger' role='alert'>campo vacio estado</div>");
}else if(doctor==""){
out.print("<div class='alert alert-danger' role='alert'>campo vacio ciudad</div>");
}
else{
 try {
            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery("select count(*) FROM servicios WHERE ser_nombre='" + nombre + "'");
            rs.next();
            int count = rs.getInt(1);

            if (count > 0) {
                out.print("<div class='alert alert-warning' role='alert'>Ya existe una ciudad con el mismo nombre</div>");
            } else {
        st.executeUpdate("INSERT INTO servicios(ser_nombre, ser_precio,ser_estado,iddoctor) VALUES ('"+nombre+"','"+precio+"','"+estado+"','"+doctor+"')");
                out.print("<div class='alert alert-success' role='alert'>Guardado correctamente</div>");
            }
 
}catch(Exception e){
     out.print("no funciona"+e);
    }
}
}else if(request.getParameter("listar").equals("modificar")){

String nombre =request.getParameter("ser_nombre");
String precio =request.getParameter("ser_precio");
String estado =request.getParameter("ser_estado");
String doctor =request.getParameter("iddoctor");
String pk =request.getParameter("idpaciente");
if(nombre==""){
out.print("<div class='alert alert-success' role='alert'>valor vacio</div>");
}else{
 try{
        Statement st=null;
        st=conn.createStatement();
        st.executeUpdate("update  servicios set ser_nombre='"+nombre+"', ser_precio='"+precio+"',ser_estado='"+estado+"', iddoctor='"+doctor+"' where idservicio='"+pk+"'");

        out.print("<div class='alert alert-success' role='alert'>modificado correcto</div>");

}catch(Exception e){
     out.print("no funciona"+e);
    }
}
}
else if(request.getParameter("listar").equals("eliminar")){
String pk =request.getParameter("idservicio_e");

 try{
        Statement st=null;
        st=conn.createStatement();
        st.executeUpdate("DELETE FROM servicios WHERE idservicio='" + pk + "'");

        out.print("<div class='alert alert-success' role='alert'>eliminado correcto</div>");

}catch(Exception e){
     out.print("no funciona"+e);
    }

}
     %>