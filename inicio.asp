<!--#include file="topo.asp"-->  
<!--#include file ="lib/Conexao.asp"--> 
<br><br>
<%
if Session("CPF_Usu") = "" then
response.Write("<script>")
response.Write("alert('O Usuário não está logado!');")
response.Write("window.location.assign('login.asp')")
response.Write("</script>")
end if


call abreConexao
sql = "select * from AU_Login where CPF = "&Session("CPF_Usu")&""
set rs = conn.execute(sql)

%>
<div class="alert alert-primary" role="alert">
  Olá <%=rs("NomeCompleto")%>, <br>seja bem-vindo ao Gerenciador de Cursos...
</div>
<%
call fechaConexao
%>
<br><br>
<%
' TESTANDO SE EXISTE MENSAGEM NA TABELA DE CONTATO
call abreConexao
sql = "select * from AU_Contato order by idCliente "
set rs = conn.execute(sql)

if not rs.eof then
%>
<div class="alert alert-primary" role="alert">
  Nova(s) Mensagem(s)<br>
<%do while not rs.eof%>  
 <%=rs("NomeCliente")%> - <%=rs("Assunto")%><br>
<%rs.movenext
loop%>
</div>

<%

end if
call fechaConexao
%>

</body>
</html>