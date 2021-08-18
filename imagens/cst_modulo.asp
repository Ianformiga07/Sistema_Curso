<!--#include file="topo.asp"-->  
<!--#include file ="lib/Conexao.asp"-->
<%
call abreConexao
sql = "select AU_Modulo.id_modulo, AU_Modulo.descricao AS NomeModulo, AU_Curso.descricao as NomeCurso, AU_Modulo.Texto, AU_Modulo.anexo from AU_Modulo INNER JOIN AU_Curso ON AU_Curso.id_Curso = AU_Modulo.id_curso INNER JOIN AU_Professor ON AU_Professor.id_professor = AU_Curso.id_professor order by AU_Modulo.id_modulo "
set rs = conn.execute(sql)

%>
  <script>
function Excluir(cod)
   {
	 if(confirm("Confirma exclusão?"))
	  {
	    parent.location = "manu_modulo.asp?opc=exc&cod=" + cod ;
      }
   
   } 
 	
 </script>

<div class="container">
<form action="frm_modulo.asp" method=post>
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
        <th>#</th>		
      </tr>
    </thead>
    <tbody>
<%

do while not rs.eof%>
      <tr>
        <td>
 <a href="frm_modulo.asp?evt=alt&cod=<%=rs("id_modulo")%>">
 <img src="imagens/alt.png" width="30">
        </a>		
		</td>
        <td><%=rs("NomeModulo")%></td>
        <td><%=rs("NomeCurso")%></td>
        <td><%=rs("Texto")%></td>
        <td><a href="Upload/<%=rs("anexo")%>"><%=rs("anexo")%></a></td>
        <td>
 <a href="javascript:Excluir(<%=rs("id_modulo")%>)">
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