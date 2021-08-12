<!--#include file="topo.asp"-->  
<!--#include file ="lib/Conexao.asp"--> 

<%

cod = Request.QueryString("cod")
evt  = Request.QueryString("evt")
call abreConexao
if cod <> "" then
   cod = cint(cod)
end if
if ucase(evt) = "ALT" then
   
   sql = "SELECT * from AU_Curso where id_Curso = "&cod

   set rs = conn.execute(sql)
Nome         =  rs("descricao")
Ativo        =  rs("ativo")
Resumo       =  rs("Resumo")
Professor    =  rs("id_professor")

   bot        = "Alterar"
else
   Ativo = 0
   bot       = "Incluir"
end if
call fechaConexao
%>

<div class="container">
<br><br>
  <form class="form-horizontal" name="frm_Professor" action="manu_professor.asp" method="post">

    <div class="form-group">
      <label class="control-label col-sm-2" for="nome"><b>Nome do Curso:</b></label>
      <div class="col-sm-4">
        <input type="text" class="form-control" id="nome" name="nome" value="<%=Nome%>">
      </div>
    </div>
	<%
	call abreConexao
	sql = "Select * from AU_Professor ORDER BY id_professor"
	set rs = conn.execute(sql)
	%>
    <div class="form-group">
      <label class="control-label col-sm-2" for="Professor"><b>Professor:</b></label>
      <div class="col-sm-4">
        <select class="form-control" name="profissional">
        	<option>Selecionar</option>
			<%do while not rs.eof%>
        	<option value="<%=rs("id_professor")%>"><%=rs("Nome")%></option>
            <%
			rs.movenext
			loop
			call fechaConexao
			%>
        </select>
      </div>
    </div>
    <div class="form-group">
      <label class="control-label col-sm-2" for="Ativo"><b>Ativo:</b></label>
      <div class="col-sm-4">
        <select class="form-control" name="Ativo">
        	<%if cint(Ativo) then%>
        	<option value="1"> Ativo </option>
			<option value="0"> Inativo </option>
            <%else%>
			<option value="0"> Inativo </option>
            <option value="1"> Ativo </option>
            <%end if%>
        </select>
      </div>
    </div>
        <div class="form-group">
      <label class="control-label col-sm-2" for="Resumo"><b>Resumo:</b></label>
      <div class="col-sm-4">
        <input type="text" class="form-control" id="Resumo" name="Resumo" value="<%=Resumo%>">
      </div>
    </div>
    
    <div class="form-group">        
      <div class="col-sm-offset-2 col-sm-10">
        <button type="submit" class="btn btn-default" name="Botao" value="<%=bot%>"><%=bot%></button>
      </div>
    </div>
	<input type="hidden" name="hfcod" value="<%=cod%>">	
  </form>
</div>

</body>
</html>