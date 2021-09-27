  <br>
  <!--#include file="funcoes.asp"-->
  <!--#include file ="lib/Conexao.asp"-->
  <%
  session.LCID = 1046
  
  opc          = request.querystring("opc")
  botao        =  request.form("botao")
  cod          =  request.form("hfcod")
  nomeCurso    =  request.form("nomeCurso")
  Professor    =  request.form("Professor")
  ativo        =  request.form("ativo")
  resumo       =  request.form("resumo")
  
  
  if botao = "Incluir" then
  
     call abreConexao
     sql = "insert into AU_Curso(descricao, id_professor, ativo, resumo)"
     sql = sql & " values('"&nomeCurso&"','"&Professor&"','"&ativo&"', '"&resumo&"')"
  
     conn.execute(sql)
     call fechaConexao
  %>
  <script>
      alert("Dados incluído com sucesso!")
      parent.location = "cst_curso.asp"
  </script>
  <%
  
  elseif botao = "Alterar" then
  
  call abreConexao
    sql = "update AU_Curso set"
    sql = sql & " descricao = '"&nomeCurso&"',"
    sql = sql & " id_professor = '"&Professor&"',"
    sql = sql & " ativo = '"&ativo&"',"
    sql = sql & " resumo = '"&resumo&"'"
    sql = sql & " where id_Curso = "&cod
    conn.execute(sql)
    call fechaConexao
  %>
  <script>
      alert("Dados alterado com sucesso!")
      parent.location = "cst_curso.asp"
  </script>
  <%
  
  elseif opc <> "" then
  
     cod = request.querystring("cod")
     call abreConexao
     sql = "delete from AU_Curso where id_Curso="&cod
  
     conn.execute(sql)
     call fechaConexao
  %>
  <script>
      alert("Linha excluída com sucesso!")
      parent.location = "cst_curso.asp"
  </script>
  <%
  end if
  %>