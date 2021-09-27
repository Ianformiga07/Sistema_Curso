<%
Function HTMLEspeciais(sString)
 If (sString <> "") Then
  sString = Replace(sString,"á","&aacute;")
  sString = Replace(sString, "â", "&acirc;")
  sString = Replace(sString, "à", "&agrave;")
  sString = Replace(sString, "ã", "&atilde;")

  sString = Replace(sString, "ç", "&ccedil;")

  sString = Replace(sString, "é", "&eacute;")
  sString = Replace(sString, "ê", "&ecirc;")

  sString = Replace(sString, "í", "&iacute;")

  sString = Replace(sString, "ó", "&oacute;")
  sString = Replace(sString, "ô", "&ocirc;")
  sString = Replace(sString, "õ", "&otilde;")

  sString = Replace(sString, "ú", "&uacute;")
  sString = Replace(sString, "ü", "&uuml;")

  sString = Replace(sString, "Á", "&Aacute;")
  sString = Replace(sString, "Â", "&Acirc;")
  sString = Replace(sString, "À", "&Agrave;")
  sString = Replace(sString, "Ã", "&Atilde;")

  sString = Replace(sString, "Ç", "&Ccedil;")

  sString = Replace(sString, "É", "&Eacute;")
  sString = Replace(sString, "Ê", "&Ecirc;")

  sString = Replace(sString, "Í", "&Iacute;")

  sString = Replace(sString, "Ó", "&Oacute;")
  sString = Replace(sString, "Ô", "&Ocirc;")
  sString = Replace(sString, "Õ", "&Otilde;")

  sString = Replace(sString, "Ú", "&Uacute;")
  sString = Replace(sString, "Ü", "&Uuml;")

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