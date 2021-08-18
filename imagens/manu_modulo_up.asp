<br>

<!--#include file="../FuncaoUpload.asp"-->
<!--#include file ="../lib/Conexao.asp"-->
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

' Chamando Funções, que fazem o Upload funcionar
byteCount = Request.TotalBytes
RequestBin = Request.BinaryRead(byteCount)
Set UploadRequest = CreateObject("Scripting.Dictionary")
BuildUploadRequest RequestBin


'RECEBENDO DADOS DOS FORMULÁRIOS
'opc          =  UploadRequest.Item("opc").Item("Value")


cod          =  UploadRequest.Item("hfcod").Item("Value")
Curso        =  UploadRequest.Item("Curso").Item("Value")
Texto        =  UploadRequest.Item("Texto").Item("Value")
arquivo      =  UploadRequest.Item("arquivo").Item("Value")
nomeModulo   =  UploadRequest.Item("nomeModulo").Item("Value")
botao        =  UploadRequest.Item("Botao").Item("Value")


'
'Laço que efetua toda operacao do anexo.
'
	' Recuperando os Dados Digitados ----------------------

	caminho     = UploadRequest.Item("arquivo").Item("FileName")
	nome        =  Right(caminho,Len(caminho)-InstrRev(caminho,"\"))
	arquivo     = UploadRequest.Item("arquivo").Item("Value")
'TESTANDO SE FOI SELECIONADO ALGUM ARQUIVO E 
	if trim(arquivo) <> "" then
        pasta = Server.MapPath("upload/")
        arq = year(date)&month(date)&day(date)&hour(now)&minute(now)&second(now)&"."&right(nome,3)

		nome_arquivo = arq
		nome_arquivo = "/"&nome_arquivo
		'Response.Write x & "<br>"
		if x = 1 then
			arquivo = arq
			
		else
			arquivo = arquivo & "§" & arq
		end if
		Set ScriptObject = Server.CreateObject("Scripting.FileSystemObject")
		Set MyFile = ScriptObject.CreateTextFile(pasta & nome_arquivo)
		'Response.Write x & "-"& nome_arquivo & "<br>"
		For i = 1 to LenB(arquivo)
		MyFile.Write chr(AscB(MidB(arquivo,i,1)))
		Next
		MyFile.Close
		arquivo = ""
	end if

session.LCID = 1046

if botao = "Incluir" then

   call abreConexao
   sql = "insert into AU_Modulo(descricao, id_curso, Texto, Anexo)"
   sql = sql & " values('"&nomeModulo&"', '"&Curso&"', '"&Texto&"','"&arquivo&"')"

   conn.execute(sql)
   call fechaConexao
%>
<script>
    alert("Dados incluído com sucesso!")
    parent.location = "cst_modulo_up.asp"
</script>
<%

elseif botao = "Alterar" then

call abreConexao
  sql = "update AU_Modulo set"
  sql = sql & " descricao = '"&nomeModulo&"',"
  sql = sql & " id_curso = '"&Curso&"',"
  sql = sql & " Texto = '"&Texto&"',"
  sql = sql & " Anexo = '"&arquivo&"'"
  sql = sql & " where id_modulo = "&cod
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
    alert("Linha excluída com sucesso!")
    parent.location = "cst_modulo_up.asp"
</script>
<%
end if
%>