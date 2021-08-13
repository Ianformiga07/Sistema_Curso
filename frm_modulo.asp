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
  <form class="form-horizontal" name="frm_Modulo" action="manu_modulo.asp" method="post">

    <div class="form-group">
      <label class="control-label col-sm-2" for="nomeModulo"><b>Descrição:</b></label>
      <div class="col-sm-4">
        <input type="text" class="form-control" id="nomeModulo" name="nomeModulo" value="<%=nomeModulo%>">
      </div>
    </div>
        <div class="form-group">
      <label class="control-label col-sm-2" for="Texto"><b>Texto:</b></label>
      <div class="col-sm-4">
        <input type="text" class="form-control" id="Texto" name="Texto" value="<%=Texto%>">
      </div>
    </div>
      <div class="form-group">
      <label class="control-label col-sm-2" for="Texto"><b>Texto:</b></label>
      <div class="col-sm-4">
        <input type="text" class="form-control" id="Texto" name="Texto" value="<%=Texto%>">
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