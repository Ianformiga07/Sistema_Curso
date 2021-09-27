<!--#include file ="lib/Conexao.asp"--> 
<%
'recebendo os parametros enviado pelo form através do Request.form


nome     = request.form("nome")
email    = request.form("email")
assunto  = request.form("assunto")
mensagem = request.form("mensagem")

'inserir no bando de dados através do INSERT
call abreConexao
sql = "insert into AU_Contato (NomeCliente, EmailCliente, Assunto, Menssagem) values ('"&nome&"','"&assunto&"','"&email&"','"&mensagem&"')"
'response.write sql
'response.end
conn.execute(sql)

' enviar mensagem e redirecionar para a index
call fechaConexao
%>
<script>
  alert("Mensagem enviada com sucesso, em breve entraremos em contato.")
  parent.location = "index.asp"
</script>