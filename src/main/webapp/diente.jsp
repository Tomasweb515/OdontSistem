<html>
<head>
<title>Escoger Hora</title>
  
          <script language="JavaScript">
 
function FormatoHora(evt,str)
{
var nav4 = window.Event ? true : false;
var key = nav4 ? evt.which : evt.keyCode;
hora=str.value
 
if(hora.length==0)
{
	return ((key >= 48 && key <= 50));
}
if(hora.length==1)
{
	if(hora.charAt(0)==2)
	{return ((key >= 48 && key <= 51));	}
	else{return ((key >= 48 && key <= 57));}
}
if(hora.length==2)
{
	return ((key == 58));
}
if(hora.length==3)
{
	return ((key >= 48 && key <= 53));
}
if(hora.length==4)
{
	return ((key >= 48 && key <= 57));
}
if(hora.length>4)
{
	return false;
}
}
 
</script>
<style type="text/css">
<!--
.buttonlink {
    font-family: "Franklin Gothic Medium";
    font-size: 12px;
    font-style: italic;
    font-weight: bold;
    color: #CC3333;
    text-decoration: underline;
}
-->
</style>
</head>

<body>
<form name="frmHora" method="post" action="">
  <table width="132" border="1">
    <tr>
      <td width="100%"><table width="100%"  border="0">
        <tr>
<input type="text" name="entrada"  onKeyPress="return FormatoHora(event,this)">


          </td>
        </tr>
      </table></td>
    </tr>
  </table>
  <table width="100%"  border="0">
    <tr>
      <td height="40" align="center" valign="bottom"><input name="btnAceptar" type="button" class="buttonlink" id="btnAceptar" value="Aceptar"  onClick="ColocarHora()"></td>
    </tr>
  </table>
</form>
</body>
</html> 