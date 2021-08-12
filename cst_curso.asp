<!--#include file="topo.asp"-->  
<!--#include file ="lib/Conexao.asp"-->
<%
call abreConexao
sql = "SELECT AU_Curso.id_Curso, AU_Curso.descricao, AU_Professor.Nome, AU_Curso.resumo, AU_Curso.ativo from AU_Professor INNER JOIN AU_Curso on AU_Curso.id_professor = AU_Professor.id_professor order by AU_Curso.id_Curso "
set rs = conn.execute(sql)

%>
  <script>
function Excluir(cod)
   {
	 if(confirm("Confirma exclusão?"))
	  {
	    parent.location = "manu_curso.asp?opc=exc&cod=" + cod ;
      }
   
   } 
 	
 </script>

<div class="container">
<form action="frm_curso.asp" method=post>
<button type="submit" class="btn btn-primary">Adicionar</button>

  <h4>Cursos</h4>
  <div class="table-responsive">          
  <table class="table">
    <thead>
      <tr>
        <th>#</th>
        <th>Curso</th>
        <th>Professor</th>
        <th>Resumo</th>
        <th>Ativo</th>
        <th>#</th>		
      </tr>
    </thead>
    <tbody>
<%

do while not rs.eof%>
      <tr>
        <td>
 <a href="frm_curso.asp?evt=alt&cod=<%=rs("id_Curso")%>">
 <img src="imagens/alt.png" width="30">
        </a>		
		</td>
        <td><%=rs("descricao")%></td>
        <td><%=rs("Nome")%></td>
        <td><%=rs("resumo")%></td>
        <td><%IF rs("ativo") = TRUE THEN%>
                          <font color="#009933"> ATIVO </font>
                          <%ELSE%>
  						  <font color="#FF0000"> INATIVO </font>
                          <%end if%></td>
        <td>
 <a href="javascript:Excluir(<%=rs("id_Curso")%>)">
 <img src="imagens/excluir.png" width="30">
        </a>		
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