
<%@include file="conexion.jsp"%>
<%    HttpSession sesion = request.getSession();

    if (request.getParameter("listar").equals("listar")) {

        try {
            Statement st = null;
            ResultSet rs = null;
            st = conn.createStatement();
            rs = st.executeQuery("SELECT a.idapertura, a.idusuario, a.ape_monto,sum(pg.pa_precio) as ingreso,sum(pg.pa_precio+ape_monto) as total,a.ape_estado,a.totalcierre from pagos pg inner join aperturacaja a on pg.idapertura=a.idapertura where a.ape_estado='abierta' and pg.pa_estado='Emitido'  GROUP BY a.idapertura ");
            while (rs.next()) {%>
<tr>
    <td><%out.print(rs.getString(1));%></td>
    <td><%out.print(rs.getString(2));%></td>
    <td><%out.print(rs.getString(3));%></td>
    <td><%out.print(rs.getString(4));%></td>
    <td><%out.print(rs.getString(5));%></td>
    <td><%out.print(rs.getString(6));%></td>
    <td><%out.print(rs.getString(7));%></td>
    <td><i title="modificar" class="fas fa-dollar-sign" onclick="$('#idapertura_e').val('<%out.print(rs.getString(1));%>')" data-toggle="modal" data-target="#cierreModal"></i><i title="eliminar" class="fas fa-trash" onclick="$('#idciudad_e').val('<%out.print(rs.getString(1));%>')" data-toggle="modal" data-target="#exampleModal"></i><a class="fas fa-eye" href="vista_7.jsp?coco=<% out.print(rs.getString(1));%>"></a></td>
</tr>


<%
            }

        } catch (Exception e) {
            out.print("error pp extraer" + e);
        }

    } else if (request.getParameter("listar").equals("cargar")) {

        String nombre = request.getParameter("ape_monto");
        String fecha = request.getParameter("ape_fecha");
        String hora = request.getParameter("ape_hora");

        if (fecha == "") {
            out.print("<div class='alert alert-danger' role='alert'>campo vacio nombre</div>");
        } else {
            try {

                Statement st = conn.createStatement();
                ResultSet rs = st.executeQuery("SELECT COUNT(*) FROM aperturacaja WHERE ape_estado='abierta' and idusuario='" + sesion.getAttribute("id") + "'");
                rs.next();
                int count = rs.getInt(1);

                if (count > 0) {
                    out.print("<div class='alert alert-warning' role='alert'>Ya esta abierto la caja</div>");
                } else {

                    st.executeUpdate("INSERT INTO aperturacaja(ape_monto,ape_fecha,idusuario,ape_hora) VALUES('" + nombre + "','" + fecha + "','" + sesion.getAttribute("id") + "','" + hora + "')");
                    out.print("<div class='alert alert-success' role='alert'>Guardado correctamente</div>");
                }

            } catch (Exception e) {
                out.print("no funciona3" + e);
            }
        }
    } else if (request.getParameter("listar").equals("cierre")) {

        String nombre = request.getParameter("totalcierre");
        String fecha = request.getParameter("ape_cierrafecha");
        String hora = request.getParameter("ape_horacierre");
        String pk = request.getParameter("idapertura_e");

        if (nombre == "") {
            out.print("<div class='alert alert-success' role='alert'>valor vacio</div>");
        } else {
            try {
                Statement st = null;
                st = conn.createStatement();
                st.executeUpdate("update aperturacaja set totalcierre='" + nombre + "',ape_cierrafecha='" + fecha + "',ape_horacierre='" + hora + "',ape_estado='cierre' where idapertura='" + pk + "'");

                out.print("<div class='alert alert-success' role='alert'>modificado correcto</div>");

            } catch (Exception e) {
                out.print("no funciona2" + e);
            }
        }
    } else if (request.getParameter("listar").equals("extraer")) {

        String nombre = request.getParameter("ex_monto");
        String fecha = request.getParameter("ex_fecha");
        String hora = request.getParameter("ex_hora");
        String descripcion = request.getParameter("ex_descripcion");

        if (nombre == "") {
            out.print("<div class='alert alert-success' role='alert'>valor vacio</div>");
        } else {
            try {
                Statement st = null;
                ResultSet pk = null;
                st = conn.createStatement();
                pk = st.executeQuery("SELECT idapertura FROM aperturacaja where ape_estado='abierta';");
                pk.next();
                st.executeUpdate("INSERT INTO extraccioncaja(ex_fecha, ex_hora, ex_monto,idusuario,ex_descripcion,idapertura) VALUES('" + fecha + "','" + hora + "','" + nombre + "','" + sesion.getAttribute("id") + "','"+descripcion+"'," + pk.getString(1) + ")");
                out.print("<div class='alert alert-success' role='alert'>extraccion</div>");

            } catch (Exception e) {
                out.print("no funciona2" + e);
            }
        }
    } else if (request.getParameter("listar").equals("mas")) {

        String nombre = request.getParameter("exingreso_monto");
        String fecha = request.getParameter("ex_fecha");
        String hora = request.getParameter("ex_hora");
        String descripcion = request.getParameter("ex_descripcion");

        if (nombre == "") {
            out.print("<div class='alert alert-success' role='alert'>valor vacio</div>");
        } else {
            try {
                Statement st = null;
                ResultSet pk = null;
                st = conn.createStatement();
                pk = st.executeQuery("SELECT idapertura FROM aperturacaja where ape_estado='abierta';");
                pk.next();
                st.executeUpdate("INSERT INTO extraccioncaja(ex_fecha, ex_hora, exingreso_monto,idusuario,ex_descripcion,idapertura) VALUES('" + fecha + "','" + hora + "','" + nombre + "','" + sesion.getAttribute("id") + "','"+descripcion+"'," + pk.getString(1) + ")");
                out.print("<div class='alert alert-success' role='alert'>ingreso</div>");

            } catch (Exception e) {
                out.print("no funciona2" + e);
            }
        }
    }
%>