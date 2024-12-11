
<%@include file="conexion.jsp"%>
<%
    
if(request.getParameter("listar").equals("listar")){

   try{
        Statement st=null;
        ResultSet rs=null;
        st=conn.createStatement();
        rs=st.executeQuery("select * from ciudades order by idciudad");
    while(rs.next())
{%>
<tr>
    <td><%out.print(rs.getString(1));%></td>
    <td><%out.print(rs.getString(2));%></td>
   
    
    
    <td><i title="modificar" class="fas fa-edit" onclick="rellenaredit('<%out.print(rs.getString(1));%>','<%out.print(rs.getString(2));%>')"></i><i title="eliminar" class="fas fa-trash" onclick="$('#idciudad_e').val('<%out.print(rs.getString(1));%>')" data-toggle="modal" data-target="#exampleModal"></i><a class="fas fa-eye" href="vista_7.jsp?coco=<% out.print(rs.getString(1));%>"></a></td>
</tr>


<% 
    }

}catch(Exception e){
     out.print("error pp"+e);
    }

}else if(request.getParameter("listar").equals("cargar")){

String nombre =request.getParameter("ciu_nombre");


if(nombre==""){
out.print("<div class='alert alert-danger' role='alert'>campo vacio nombre</div>");
}
else{
 try {

            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery("SELECT COUNT(*) FROM ciudades WHERE ciu_nombre='" + nombre + "' and ciu_nombre='" + nombre + "'");
            rs.next();
            int count = rs.getInt(1);

 if (count > 0) {
                out.print("<div class='alert alert-warning' role='alert'>Ya existe una ciudad con el mismo nombre</div>");
            } else {
        st.executeUpdate("INSERT INTO ciudades(ciu_nombre) VALUES('"+nombre+"')");
                out.print("<div class='alert alert-success' role='alert'>Guardado correctamente</div>");
            }

}catch(Exception e){
     out.print("no funciona"+e);
    }
}
}else if(request.getParameter("listar").equals("modificar")){

String nombre =request.getParameter("ciu_nombre");
String pk =request.getParameter("idciudad");

if(nombre==""){
out.print("<div class='alert alert-success' role='alert'>valor vacio</div>");
}else{
 try{
        Statement st=null;
        st=conn.createStatement();
        st.executeUpdate("update  ciudades set ciu_nombre='"+nombre+"' where idciudad='"+pk+"'");

        out.print("<div class='alert alert-success' role='alert'>modificado correcto</div>");

}catch(Exception e){
     out.print("no funciona"+e);
    }
}
}
else if(request.getParameter("listar").equals("eliminar")){
String pk =request.getParameter("idciudad_e");

 try{
        Statement st=null;
        st=conn.createStatement();
        st.executeUpdate("DELETE FROM ciudades WHERE idciudad='" + pk + "'");

        out.print("<div class='alert alert-success' role='alert'>eliminado correcto</div>");

}catch(Exception e){
     out.print("no funciona"+e);
    }

}
     %>