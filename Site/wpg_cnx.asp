<%
Function HTMLEspeciais(sString)
 If (sString <> "") Then
  sString = Replace(sString,"�","&aacute;")
  sString = Replace(sString, "�", "&acirc;")
  sString = Replace(sString, "�", "&agrave;")
  sString = Replace(sString, "�", "&atilde;")

  sString = Replace(sString, "�", "&ccedil;")

  sString = Replace(sString, "�", "&eacute;")
  sString = Replace(sString, "�", "&ecirc;")

  sString = Replace(sString, "�", "&iacute;")

  sString = Replace(sString, "�", "&oacute;")
  sString = Replace(sString, "�", "&ocirc;")
  sString = Replace(sString, "�", "&otilde;")

  sString = Replace(sString, "�", "&uacute;")
  sString = Replace(sString, "�", "&uuml;")

  sString = Replace(sString, "�", "&Aacute;")
  sString = Replace(sString, "�", "&Acirc;")
  sString = Replace(sString, "�", "&Agrave;")
  sString = Replace(sString, "�", "&Atilde;")

  sString = Replace(sString, "�", "&Ccedil;")

  sString = Replace(sString, "�", "&Eacute;")
  sString = Replace(sString, "�", "&Ecirc;")

  sString = Replace(sString, "�", "&Iacute;")

  sString = Replace(sString, "�", "&Oacute;")
  sString = Replace(sString, "�", "&Ocirc;")
  sString = Replace(sString, "�", "&Otilde;")

  sString = Replace(sString, "�", "&Uacute;")
  sString = Replace(sString, "�", "&Uuml;")

  sString = Replace(sString, """", "&quot;") '"
  sString = Replace(sString, "<", "&lt;") '<
  sString = Replace(sString, ">", "&gt;") '>
 End If

 HTMLEspeciais = sString
End Function
session.lcid = 1046

'Conectar ao banco de dados MySQL

Set Conexao = Server.CreateObject("ADODB.Connection")
Conexao.Open = "Driver=MySQL ODBC 5.2 ANSI Driver; database=cartaopremiar; server=mysql.cartaopremiar.com.br; uid=USUARIO; password=SENHABANCO"
'Response.Write "<center><b>Conectado com sucesso ao banco de dados</center>"


%>