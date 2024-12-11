
<%@include file="conexion.jsp"%>
<%
    
if(request.getParameter("listar").equals("listar")){

   try{
        Statement st=null;
        ResultSet rs=null;
        st=conn.createStatement();
        //servicios.ser_precio, servicios.ser_estado, servicios.iddoctor,
        //doctores.doc_nombre FROM public.servicios
        //INNER JOIN public.doctores ON servicios.iddoctor = doctores.iddoctor;");
        rs=st.executeQuery("select h.*,d.doc_nombre from horarios h inner join doctores d on h.iddoctor = d.iddoctor;");
    while(rs.next())
{%>
<tr>
    <td><%out.print(rs.getString(1));%></td>
    <td><%out.print(rs.getString(2));%></td>
    <td><%out.print(rs.getString(5));%></td>
    <td><%out.print(rs.getString(4));%></td>
    <td><i title="modificar" class="fas fa-edit" onclick="rellenaredit('<%out.print(rs.getString(1));%>','<%out.print(rs.getString(2));%>','<%out.print(rs.getString(3));%>','<%out.print(rs.getString(4));%>')"></i><i title="eliminar" class="fas fa-trash" onclick="$('#idhorario_e').val('<%out.print(rs.getString(1));%>')" data-bs-toggle="modal" data-bs-target="#exampleModal"></i><a class="fas fa-eye" href="vista_5.jsp?coco=<% out.print(rs.getString(1));%>"></a></td>
</tr>


<% 
    }

}catch(Exception e){
     out.print("error pp"+e);
    }

}else if(request.getParameter("listar").equals("cargar")){

String atencion =request.getParameter("hora_atencion");
String doctor =request.getParameter("iddoctor");

String estado =request.getParameter("hora_estado");


if(atencion==""){
out.print("<div class='alert alert-danger' role='alert'>campo vacio nombre</div>");
}if(doctor==""){
out.print("<div class='alert alert-danger' role='alert'>campo vacio nombre</div>");
}if(estado==""){
out.print("<div class='alert alert-danger' role='alert'>campo vacio nombre</div>");
}
else{
try {
            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery("select count(*) FROM horarios where hora_atencion='" + atencion + "'");
            rs.next();
            int count = rs.getInt(1);

            if (count > 0) {
                out.print("<div class='alert alert-warning' role='alert'>Ya existe una doctor con el mismo hora</div>");
            } else {
        st.executeUpdate("INSERT INTO horarios(hora_atencion, iddoctor, hora_estado) VALUES ('"+atencion+"','"+doctor+"','"+estado+"')");
                out.print("<div class='alert alert-success' role='alert'>Guardado correctamente</div>");
            }
 
}catch(Exception e){
     out.print("no funciona"+e);
    }
}
}else if(request.getParameter("listar").equals("modificar")){

String atencion =request.getParameter("hora_atencion");
String doctor =request.getParameter("iddoctor");

String estado =request.getParameter("hora_estado");
String pk =request.getParameter("idhorario");

if(atencion==""){
out.print("<div class='alert alert-danger' role='alert'>campo vacio nombre</div>");
}if(doctor==""){
out.print("<div class='alert alert-danger' role='alert'>campo vacio nombre</div>");
}if(estado==""){
out.print("<div class='alert alert-danger' role='alert'>campo vacio nombre</div>");
}else{
 try{
        Statement st=null;
        st=conn.createStatement();
        st.executeUpdate("update  horarios set hora_atencion='"+atencion+"',hora_estado='"+estado+"',iddoctor='"+doctor+"' where idhorario='"+pk+"'");

        out.print("<div class='alert alert-success' role='alert'>modificado correcto</div>");

}catch(Exception e){
     out.print("no funciona"+e);
    }
}
}
else if(request.getParameter("listar").equals("eliminar")){
String pk =request.getParameter("idhorario_e");

 try{
        Statement st=null;
        st=conn.createStatement();
        st.executeUpdate("DELETE FROM horarios WHERE idhorario='" + pk + "'");

        out.print("<div class='alert alert-success' role='alert'>eliminado correcto</div>");

}catch(Exception e){
     out.print("no funciona"+e);
    }

}
     %>