<br>

<!--#include file="FuncaoUpload.asp"-->
<!--#include file ="lib/Conexao.asp"-->
<%
Function ZerosEsquerda(Num,tam)
	Dim Zero
	Num = Trim(Num)
	Zero = ""
	For i = Len(Num) To tam - 1
	    Zero = "0" & Zero
	Next
	ZerosEsquerda = Trim(Zero & Num)
End Function

' Chamando Fun��es, que fazem o Upload funcionar
byteCount = Request.TotalBytes
RequestBin = Request.BinaryRead(byteCount)
Set UploadRequest = CreateObject("Scripting.Dictionary")
BuildUploadRequest RequestBin

'RECEBENDO DADOS DOS FORMUL�RIOS

'opc          = request.querystring("opc")
response.write(UploadRequest.Item("Anexo").Item("Value"))
response.end

cod           = UploadRequest.Item("hfcod").Item("Value")
botao         = UploadRequest.Item("Botao").Item("Value")
nomeModulo    = UploadRequest.Item("nomeModulo").Item("Value")
Curso         = UploadRequest.Item("Curso").Item("Value")
Texto         = UploadRequest.Item("Texto").Item("Value")
Anexo         = UploadRequest.Item("Anexo").Item("Value")

'
'La�o que efetua toda operacao do anexo.
'
	' Recuperando os Dados Digitados ----------------------

	caminho     = UploadRequest.Item("Anexo").Item("FileName")
	nome        =  Right(caminho,Len(caminho)-InstrRev(caminho,"\"))
	Anexo     = UploadRequest.Item("Anexo").Item("Value")
'TESTANDO SE FOI SELECIONADO ALGUM ARQUIVO E 
	if trim(Anexo) <> "" then
        pasta = Server.MapPath("upload/")
        arq = year(date)&month(date)&day(date)&hour(now)&minute(now)&second(now)&"."&right(nome,3)

		nome_arquivo = arq
		nome_arquivo = "/"&nome_arquivo
		'Response.Write x & "<br>"
		if x = 1 then
			arquivo = arq
			
		else
			Anexo = Anexo & "�" & arq
		end if
		Set ScriptObject = Server.CreateObject("Scripting.FileSystemObject")
		Set MyFile = ScriptObject.CreateTextFile(pasta & nome_arquivo)
		'Response.Write x & "-"& nome_arquivo & "<br>"
		For i = 1 to LenB(Anexo)
		MyFile.Write chr(AscB(MidB(Anexo,i,1)))
		Next
		MyFile.Close
		Anexo = ""
	end if

session.LCID = 1046



if botao = "Incluir" then

   call abreConexao
   sql = "insert into AU_Modulo(descricao, id_curso, Texto, Anexo)"
   sql = sql & " values('"&nomeModulo&"', '"&Curso&"', '"&Texto&"','"&Anexo&"')"

   conn.execute(sql)
   call fechaConexao
%>
<script>
    alert("Dados inclu�do com sucesso!")
    parent.location = "cst_modulo_up.asp"
</script>
<%

elseif botao = "Alterar" then

call abreConexao
  sql = "update AU_Modulo set"
  sql = sql & " descricao = '"&nomeModulo&"',"
  sql = sql & " id_curso = '"&Curso&"',"
  sql = sql & " Texto = '"&Texto&"',"
  sql = sql & " Anexo = '"&Anexo&"'"
  sql = sql & " where id_modulo = "&cod
     response.write sql
   response.end
  conn.execute(sql)
  call fechaConexao
%>
<script>
    alert("Dados alterado com sucesso!")
    parent.location = "cst_modulo_up.asp"
</script>
<%

elseif opc <> "" then

   cod = request.querystring("cod")
   call abreConexao
   sql = "delete from AU_Modulo where id_modulo="&cod

   conn.execute(sql)
   call fechaConexao
%>
<script>
    alert("Linha exclu�da com sucesso!")
    parent.location = "cst_modulo_up.asp"
</script>
<%
end if
%>