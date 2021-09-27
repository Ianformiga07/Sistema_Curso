<!--#include file="topo.asp"-->  
<!--#include file ="lib/Conexao.asp"-->
<%
if Session("CPF_Usu") = "" then
response.Write("<script>")
response.Write("alert('O Usuário não está logado!');")
response.Write("window.location.assign('login.asp')")
response.Write("</script>")
end if

call abreConexao
sql = "select AU_Modulo.id_modulo, AU_Modulo.descricao AS NomeModulo, AU_Curso.descricao as NomeCurso, AU_Modulo.Texto, AU_Modulo.anexo, AU_Modulo.status as statusUsuario from AU_Modulo INNER JOIN AU_Curso ON AU_Curso.id_Curso = AU_Modulo.id_curso WHERE AU_Modulo.status = 1 order by AU_Modulo.id_modulo"
set rs = conn.execute(sql)

%>

<div class="container">
<form action="frm_modulo_up.asp" method=post>
<button type="submit" class="btn btn-primary">Adicionar</button>

  <h4>Cursos</h4>
  <div class="table-responsive">          
  <table class="table">
    <thead>
      <tr>
        <th>#</th>
        <th>Módulo</th>
        <th>Curso</th>
        <th>Texto</th>
        <th>Anexo</th>
        <th>Status</th>		
      </tr>
    </thead>
    <tbody>
<%

do while not rs.eof%>
      <tr>
        <td>
 <a href="frm_modulo_up.asp?evt=alt&cod=<%=rs("id_modulo")%>">
 <img src="imagens/alt.png" width="30">
        </a>		
		</td>
        <td><%=rs("NomeModulo")%></td>
        <td><%=rs("NomeCurso")%></td>
        <td><%=rs("Texto")%></td>
        <td><a href="Upload/<%=rs("anexo")%>"><%=rs("anexo")%></a></td>
          <td><%IF rs("statusUsuario") = TRUE THEN%>
                          <font color="#009933"> ATIVO </font>
                          <%ELSE%>
  						  <font color="#FF0000"> INATIVO </font>
                          <%end if%>		
		</td>

      </tr>
<%

rs.movenext
loop
call fechaConexao
%>	  
    </tbody>
  </table>

  </div>
</form>

</div>
</body>
</html>