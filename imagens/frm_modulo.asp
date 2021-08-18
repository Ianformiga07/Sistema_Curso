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
   
   sql = "SELECT * from AU_Modulo where id_modulo = "&cod

   set rs = conn.execute(sql)
nomeModulo    =  rs("descricao")
Texto        =  rs("Texto")
Anexo        =  rs("Anexo")
curso        =  rs("id_curso")

   bot        = "Alterar"
else

   bot       = "Incluir"
end if
call fechaConexao
%>

<div class="container">
<br><br>
  <form class="form-horizontal" name="frm_Modulo" action="manu_modulo_up.asp" method="post">

    <div class="form-group">
      <label class="control-label col-sm-2" for="nomeModulo"><b>Descrição Módulo:</b></label>
      <div class="col-sm-4">
        <input type="text" class="form-control" id="nomeModulo" name="nomeModulo" value="<%=nomeModulo%>">
      </div>
    </div>
    <%
	call abreConexao
	sql = "Select * from AU_Curso ORDER BY id_Curso"
	set rs = conn.execute(sql)
	%>
    <div class="form-group">
      <label class="control-label col-sm-2" for="Curso"><b>Curso:</b></label>
      <div class="col-sm-4">
        <select class="form-control" name="Curso">
			<%do while not rs.eof%>
        	<option value="<%=rs("id_Curso")%>"><%=rs("descricao")%></option>
            <%
			rs.movenext
			loop
			call fechaConexao
			%>
        </select>
      </div>
    </div>
        <div class="form-group">
      <label class="control-label col-sm-2" for="Texto"><b>Texto:</b></label>
      <div class="col-sm-4">
        <input type="text" class="form-control" id="Texto" name="Texto" value="<%=Texto%>">
      </div>
    </div>
      <div class="form-group">
      <label class="control-label col-sm-2" for="Anexo"><b>Anexo:</b></label>
      <div class="col-sm-4">
        <input type="file" class="form-control" id="Anexo" name="Anexo">
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