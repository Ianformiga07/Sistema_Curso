<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!--#include file ="lib/Conexao.asp"-->
<%
Session("CPF_Usu") = ""
Session.Abandon
Response.Redirect ("login.asp")

%>