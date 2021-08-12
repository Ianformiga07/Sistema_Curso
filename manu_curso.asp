<br>
<!--#include file="funcoes.asp"-->
<!--#include file ="lib/Conexao.asp"-->
<%
session.LCID = 1046

opc          = request.querystring("opc")
botao        =  request.form("botao")
cod          =  request.form("hfcod")
Nome         =  request.form("nome")
ativo        =  request.form("ativo")
resumo       =  request.form("resumo")


if botao = "Incluir" then

   call abreConexao
   sql = "insert into AU_Professor(Nome, CPF, DataNasci, Endereco, Curriculo, Email, foto)"
   sql = sql & " values('"&Nome&"','"&CPF&"','"&data_banco(data)&"', '"&Endereco&"', '"&Curriculo&"', '"&Email&"', '"&Foto&"')"
   conn.execute(sql)
   call fechaConexao
%>
<script>
    alert("Dados incluído com sucesso!")
    parent.location = "cst_professor.asp"
</script>
<%

elseif botao = "Alterar" then

call abreConexao
  sql = "update AU_Professor set"
  sql = sql & " Nome = '"&Nome&"',"
  sql = sql & " CPF = '"&CPF&"',"
  sql = sql & " DataNasci = '"&data_banco(data)&"',"
  sql = sql & " Endereco = '"&Endereco&"',"
  sql = sql & " Curriculo = '"&Curriculo&"',"
  sql = sql & " Email = '"&Email&"',"
  sql = sql & " foto = '"&Foto&"'"  
  sql = sql & " where id_professor = "&cod
  conn.execute(sql)
  call fechaConexao
%>
<script>
    alert("Dados alterado com sucesso!")
    parent.location = "cst_professor.asp"
</script>
<%

elseif opc <> "" then

   cod = request.querystring("cod")
   call abreConexao
   sql = "delete from AU_Professor where id_professor="&cod

   conn.execute(sql)
   call fechaConexao
%>
<script>
    alert("Linha excluída com sucesso!")
    parent.location = "cst_professor.asp"
</script>
<%
end if
%>