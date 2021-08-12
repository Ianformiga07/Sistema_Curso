<!--#include file="topo.asp"-->  
<!--#include file ="lib/Conexao.asp"-->
<%
call abreConexao
sql = "select * from AU_Professor order by Nome "
set rs = conn.execute(sql)

%>
  <script>
function Excluir(cod)
   {
	 if(confirm("Confirma exclusão?"))
	  {
	    parent.location = "manu_professor.asp?opc=exc&cod=" + cod ;
      }
   
   } 
 	
 </script>

<div class="container">
<form action="frm_professor.asp" method=post>
<button type="submit" class="btn btn-primary">Adicionar</button>

  <h4>Professor</h4>
  <div class="table-responsive">          
  <table class="table">
    <thead>
      <tr>
        <th>#</th>
        <th>Nome</th>
        <th>CPF</th>
        <th>Data Nascimento</th>
        <th>Email</th>
        <th>#</th>		
      </tr>
    </thead>
    <tbody>
<%
'AQUI COMEÇA O DO WHILE ONDE TRARÁ AS LINHAS DE ACORDO COM O SELECT FEITO
do while not rs.eof%>
      <tr>
        <td>
 <a href="frm_professor.asp?evt=alt&cod=<%=rs("id_professor")%>">
<img src="imagens/alt.png" width="30">
        </a>		
		</td>
        <td><%=rs("Nome")%></td>
        <td><%=rs("CPF")%></td>
        <td><%=rs("DataNasci")%></td>
        <td><%=rs("Email")%></td>
        <td>
 <a href="javascript:Excluir(<%=rs("id_professor")%>)">
 <img src="imagens/excluir.png" width="30">
        </a>		
		</td>

      </tr>
<%
'LOOP DEPOIS DA LINHA PARA QUE SE REPITA ENQUANTO TIVER REGISTROS NO SELECT FEITO
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