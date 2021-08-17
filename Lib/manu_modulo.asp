<br>
<!--#include file="funcoes.asp"-->
<!--#include file ="lib/Conexao.asp"-->
<%


session.LCID = 1046

opc          = request.querystring("opc")
botao        =  request.form("botao")
cod          =  request.form("hfcod")
nomeModulo   =  request.form("nomeModulo")
Curso        =  request.form("Curso")
Texto        =  request.form("Texto")
Anexo        =  request.form("Anexo")



if botao = "Incluir" then

   call abreConexao
   sql = "insert into AU_Modulo(descricao, id_curso, Texto, Anexo)"
   sql = sql & " values('"&nomeModulo&"', '"&Curso&"', '"&Texto&"','"&Anexo&"')"
   conn.execute(sql)
   call fechaConexao
%>
<script>
    alert("Dados incluído com sucesso!")
    parent.location = "cst_modulo.asp"
</script>
<%

elseif botao = "Alterar" then

call abreConexao
  sql = "update AU_Modulo set"
  sql = sql & " descricao = '"&nomeModulo&"',"
  sql = sql & " id_curso = '"&Curso&"',"
  sql = sql & " Texto = '"&Texto&"',"
  sql = sql & " Anexo = '"&Anexo&"'"
  sql = sql & " where id_modulo = "&cod
  conn.execute(sql)
  call fechaConexao
%>
<script>
    alert("Dados alterado com sucesso!")
    parent.location = "cst_modulo.asp"
</script>
<%

elseif opc <> "" then

   cod = request.querystring("cod")
   call abreConexao
   sql = "delete from AU_Modulo where id_modulo="&cod

   conn.execute(sql)
   call fechaConexao
%>
<script>
    alert("Linha excluída com sucesso!")
    parent.location = "cst_modulo.asp"
</script>
<%
end if
%>