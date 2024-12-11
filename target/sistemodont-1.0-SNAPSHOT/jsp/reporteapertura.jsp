
<%@include file="conexion.jsp"%>
<%
        HttpSession sesion = request.getSession();

if(request.getParameter("listar").equals("listar")){

   try{
        Statement st=null;
        ResultSet rs=null;
        st=conn.createStatement();
        rs=st.executeQuery(" SELECT pg.idpagos, pg.pa_fecha, pg.pa_hora, us.usu_nombre, pg.pa_motivo, pg.pa_precio FROM public.aperturacaja a inner join pagos pg on a.idapertura=pg.idapertura inner join usuario us on pg.idusuario=us.idusuario where pg.pa_estado='Emitido' or pg.pa_estado='Cuota'");
    while(rs.next())
{%>
<tr>
    <td><%out.print(rs.getString(1));%></td>
    <td><%out.print(rs.getString(2));%></td>
    <td><%out.print(rs.getString(3));%></td>
    <td><%out.print(rs.getString(4));%></td>
    <td><%out.print(rs.getString(5));%></td>
    <td><%out.print(rs.getString(6));%></td>

   

    <td><i title="modificar" class="fas fa-dollar-sign" onclick="$('#idapertura_e').val('<%out.print(rs.getString(1));%>')" data-toggle="modal" data-target="#cierreModal"></i><i title="eliminar" class="fas fa-trash" onclick="$('#idciudad_e').val('<%out.print(rs.getString(1));%>')" data-toggle="modal" data-target="#exampleModal"></i><a class="fas fa-eye" href="vista_7_1.jsp?coco=<%out.print(rs.getString(1));%>"></a></td>
</tr>


<% 
    }

}catch(Exception e){
     out.print("error pp extraer"+e);
    }

}%>