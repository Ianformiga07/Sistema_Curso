<!--#include file="topo.asp"-->  
<!--#include file ="lib/Conexao.asp"--> 

<%
if Session("CPF_Usu") = "" then
response.Write("<script>")
response.Write("alert('O Usuário não está logado!');")
response.Write("window.location.assign('login.asp')")
response.Write("</script>")
end if

cod = Request.QueryString("cod")
evt  = Request.QueryString("evt")
call abreConexao
if cod <> "" then
   cod = int(cod)
end if
if ucase(evt) = "ALT" then
	
   sql = "SELECT * from AU_Professor where id_professor = "&cod

   set rs = conn.execute(sql)
Nome         =  rs("Nome")
CPF          =  rs("CPF")
data         =  rs("DataNasci")
Endereco     =  rs("Endereco")
Curriculo    =  rs("Curriculo")
Email        =  rs("Email")
Foto         =  rs("foto") 

   bot        = "Alterar"
else
   bot       = "Incluir"
end if
call fechaConexao
%>

<div class="container">
<br><br>
  <form class="form-horizontal" name="frm_Professor" action="manu_professor.asp" method="post">

    <div class="form-group">
      <label class="control-label col-sm-2" for="nome"><b>Nome:</b></label>
      <div class="col-sm-4">
        <input type="text" class="form-control" id="nome" name="nome" value="<%=Nome%>">
      </div>
    </div>

    <div class="form-group">
      <label class="control-label col-sm-2" for="cpf"><b>CPF:</b></label>
      <div class="col-sm-4">
        <input type="text" class="form-control" id="cpf" name="cpf" value="<%=CPF%>">
      </div>
    </div>
    <div class="form-group">
      <label class="control-label col-sm-2" for="data"><b>Data Nascimento:</b></label>
      <div class="col-sm-4">
        <input type="text" class="form-control" id="data" name="data" value="<%=data%>">
      </div>
    </div>
        <div class="form-group">
      <label class="control-label col-sm-2" for="Endereco"><b>Endereço:</b></label>
      <div class="col-sm-4">
        <input type="text" class="form-control" id="Endereco" name="Endereco" value="<%=Endereco%>">
      </div>
    </div>
        <div class="form-group">
      <label class="control-label col-sm-2" for="Curriculo"><b>Curriculo:</b></label>
      <div class="col-sm-4">
        <input type="text" class="form-control" id="Curriculo" name="Curriculo" value="<%=Curriculo%>">
      </div>
    </div>
        <div class="form-group">
      <label class="control-label col-sm-2" for="Email"><b>Email:</b></label>
      <div class="col-sm-4">
        <input type="text" class="form-control" id="Email" name="Email" value="<%=Email%>">
      </div>
    </div>
        <div class="form-group">
      <label class="control-label col-sm-2" for="Foto"><b>Foto:</b></label>
      <div class="col-sm-4">
        <input type="text" class="form-control" id="Foto" name="Foto" value="<%=Foto%>">
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