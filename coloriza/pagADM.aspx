<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm2.aspx.cs" Inherits="paginadoADM.WebForm2" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Painel de Administração</title>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Roboto', sans-serif;
            background-color: white; /* Fundo branco */
            color: black; /* Texto em preto */
            margin: 0; /* Remove margens padrão */
            padding: 20px; /* Padding ao redor do conteúdo */
        }

        .header {
            text-align: center;
            background-color: black; /* Fundo da barra de menu */
            padding: 10px; /* Padding na barra de menu */
            color: #ED297B; /* Cor do texto */
        }

        .header h1 {
            margin: 0; /* Remove margens do título */
        }

        .grid-container {
            background-color: white; /* Fundo branco do container da tabela */
            border-radius: 8px; 
            padding: 20px; 
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.3); 
            margin: 20px auto; 
            width: 80%; /* Largura da tabela */
        }

        .grid-view {
            background-color: white; /* Fundo branco da tabela */
            color: black; 
            border-collapse: collapse; 
            width: 100%; 
        }

        .grid-view th, .grid-view td {
            text-align: center; /* Centraliza o texto */
            padding: 15px; /* Padding nas células */
            border: 1px solid #ccc; /* Borda das células */
        }

        .grid-view th {
            background-color: #ED297B; /* Cor do cabeçalho */
            color: white; /* Texto do cabeçalho em branco */
        }

        .grid-view tr:nth-child(even) {
            background-color: #fff; /* Linhas pares em branco */
        }

        .grid-view tr:hover {
            background-color: #ED297B; /* Cor ao passar o mouse */
        }

        .button {
            background-color: #ED297B; /* Cor rosa */
            border: none; /* Remove borda */
            color: white; /* Texto em branco */
            padding: 10px 15px; /* Padding do botão */
            text-align: center; /* Centraliza texto do botão */
            text-decoration: none; /* Remove sublinhado */
            display: inline-block; /* Exibe como bloco */
            margin: 4px 2px; /* Margem ao redor do botão */
            cursor: pointer; /* Muda o cursor ao passar o mouse */
            border-radius: 5px; /* Bordas arredondadas */
            transition: background-color 0.3s; /* Transição suave */
        }

        .button:hover {
            background-color: #C7216C; /* Cor ao passar o mouse */
        }

        .panel {
            background-color: #ccc; /* Fundo dos painéis */
            border-radius: 8px; /* Bordas arredondadas */
            padding: 20px; /* Padding interno */
            margin-top: 20px; /* Margem superior */
        }

        .panel label {
            color: #ED297B; /* Labels em rosa */
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="header">
            <h1>Painel de Administração</h1>
        </div>
        <div class="grid-container">
            <asp:GridView ID="Grid_PRODUTOS" runat="server" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="Codigo_produto" DataSourceID="SqlDS_PRODUTOS" CssClass="grid-view" OnSelectedIndexChanged="Grid_PRODUTOS_SelectedIndexChanged">
                <Columns>
                    <asp:CommandField ButtonType="Button" ShowSelectButton="True" />
                    <asp:BoundField DataField="Codigo_produto" HeaderText="Código do Produto" InsertVisible="False" ReadOnly="True" SortExpression="Codigo_produto" />
                    <asp:BoundField DataField="Valor" HeaderText="Valor" SortExpression="Valor" />
                    <asp:BoundField DataField="NomeProduto" HeaderText="Nome do Produto" SortExpression="NomeProduto" />
                    <asp:BoundField DataField="Foto_codigo" HeaderText="Código da Foto" SortExpression="Foto_codigo" />
                </Columns>
                <FooterStyle BackColor="#2D2D2D" />
                <HeaderStyle BackColor="#ED297B" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#2D2D2D" ForeColor="White" HorizontalAlign="Left" />
                <RowStyle BackColor="white" /> 
                <SelectedRowStyle BackColor="#ED297B" Font-Bold="True" ForeColor="White" />
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDS_PRODUTOS" runat="server" ConnectionString="<%$ ConnectionStrings:produtosConexao%>" SelectCommand="SELECT * FROM PRODUTOS"></asp:SqlDataSource>
            <br />
            <a href="index.aspx" class="button">Voltar</a>
            <asp:Button ID="btnNovoItem" runat="server" Text="Novo Item" OnClick="btnNovoItem_Click" CssClass="button" />
            <br /><br />
            <asp:Panel ID="pnlNovoItem" runat="server" CssClass="panel" Visible="False">
                <asp:Label ID="Label1" runat="server" Text="Descrição do Produto:"></asp:Label>
                &nbsp;<asp:TextBox ID="txtAddNomeProd" runat="server"></asp:TextBox>
                <br />
                <asp:Label ID="Label2" runat="server" Text="Preço do Produto:"></asp:Label>
                &nbsp;<asp:TextBox ID="txtAddPrecoProd" runat="server"></asp:TextBox>
                <br /><br />
                <asp:Button ID="btnAdicionarProduto" runat="server" OnClick="btnAdicionarProduto_Click" Text="Adicionar Produto" CssClass="button" />
                <br /><br />
                <asp:Label ID="lblAviso" runat="server" style="color: #CC0000"></asp:Label>
                <br />
            </asp:Panel>
            <br />
            <asp:Panel ID="pnlEditar_e_Foto" runat="server" CssClass="panel" Visible="False">
                <asp:Label ID="Label6" runat="server" Text="Código do Produto:"></asp:Label>
                &nbsp;<asp:Label ID="lblCodigoDoProduto" runat="server"></asp:Label>
                <br /><br />
                <asp:Label ID="Label5" runat="server" Text="Código da foto:"></asp:Label>
                &nbsp;<asp:Label ID="lblCodigoDaFoto" runat="server"></asp:Label>
                <br /><br />
                <asp:Label ID="Label3" runat="server" Text="Nome do produto:"></asp:Label>
                &nbsp;<asp:TextBox ID="txtEditarNomeProd" runat="server"></asp:TextBox>
                <br /><br />
                <asp:FileUpload ID="FileUpload1" runat="server" />
                <br /><br />
                <asp:Image ID="Image1" runat="server" Height="250px" Width="250px" />
                <br /><br />
                <asp:Button ID="btnSalvarFoto" runat="server" OnClick="btnSalvarFoto_Click" Text="Salvar" CssClass="button" />
                <br /><br />
                <asp:Label ID="lblAvisoFoto" runat="server" style="color: #CC0066"></asp:Label>
                <br /><br />
            </asp:Panel>
            <br /><br />
        </div>
    </form>
</body>
</html>
