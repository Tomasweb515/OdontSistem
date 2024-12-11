<%@ page import="net.sf.jasperreports.engine.*" %> 
<%@ page import="java.util.*" %> 
<%@ page import="java.io.*" %> 
<%@ page import="java.sql.*" %> 
<%@ page import="net.sf.jasperreports.engine.util.*" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ include file="jsp/conexion.jsp" %>

<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%
                        
                        try{
                        /*INDICAMOS EL LUGAR DONDE SE ENCUENTRA NUESTRO ARCHIVO JASPER*/
                        File reportFile=new File(application.getRealPath("reporte/informeco.jasper"));
                        /**/
                        Map parametros=new HashMap();
SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd", Locale.ENGLISH);

                      String fechai = request.getParameter("fechainicio");
                      String fechaf = request.getParameter("fechafinal");
                      String estado = request.getParameter("estado");
                        //String codigo="13";
                         if (fechai == null || fechai.isEmpty() || fechaf == null || fechaf.isEmpty() || estado == null || estado.isEmpty()) {
            throw new IllegalArgumentException("Todos los campos (fechainicio, fechafinal, estado) son obligatorios.");
        }
                        Date fechaini = formatter.parse(fechai);
                        Date fechafin = formatter.parse(fechaf);
                        

                        parametros.put("fechaini",fechaini);
                        parametros.put("fechafin",fechafin);
                        parametros.put("estado",estado);
                        byte [] bytes= JasperRunManager.runReportToPdf(reportFile.getPath(), parametros,conn);
                        response.setContentType("application/pdf");
                        response.setContentLength(bytes.length);

                        ServletOutputStream output=response.getOutputStream();
                        response.getOutputStream();
                        output.write(bytes,0,bytes.length);
                        output.flush();
                        output.close();
                        }
                        catch(java.io.FileNotFoundException ex)
                        {
                            ex.getMessage();
                        }
                    %>