
<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm2.aspx.cs" Inherits="TESTE2.WebForm2" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Itens Adicionados</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap" rel="stylesheet" />
    <style>
        body {
            font-family: 'Roboto', sans-serif;
            background-color: #f4f5f7;
            margin: 0;
            padding: 0;
        }
        .container {
            width: 90%;
            margin: 20px auto;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            padding: 20px;
        }
        .header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 10px 0;
            border-bottom: 1px solid #e0e0e0;
        }
        .header .logo {
            display: flex;
            align-items: center;
        }
        .header .logo i {
            font-size: 24px;
            color: #3b82f6;
        }
        .header .nav {
            display: flex;
            align-items: center;
        }
        .header .nav a {
            margin: 0 15px;
            text-decoration: none;
            color: #333;
            font-weight: 500;
        }
        .header .nav a.active {
            color: #3b82f6;
            border-bottom: 2px solid #3b82f6;
        }
        .orders-table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        .orders-table th, .orders-table td {
            padding: 15px;
            text-align: left;
            border-bottom: 1px solid #e0e0e0;
        }
        .orders-table th {
            background-color: #f9fafb;
            color: #333;
        }
        .orders-table td {
            color: #555;
        }
        .orders-table .status {
            display: inline-block;
            padding: 5px 10px;
            border-radius: 4px;
            font-size: 14px;
            font-weight: 500;
        }
        .orders-table .status.unfulfilled {
            background-color: #fee2e2;
            color: #b91c1c;
        }
        .orders-table .status.fulfilled {
            background-color: #d1fae5;
            color: #065f46;
        }
        .orders-table .status.authorized {
            background-color: #fef3c7;
            color: #b45309;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <div class="header">
                <div class="logo">
                    <i class="fas fa-cube"></i>
                    <h2 style="margin-left: 10px;">Pedidos</h2>
                </div>
            </div>
            <asp:GridView ID="GridViewAdicionados" runat="server" AutoGenerateColumns="False"
                OnRowCommand="GridViewAdicionados_RowCommand" BackColor="White" BorderColor="#999999" BorderStyle="Solid"
                BorderWidth="1px" CellPadding="3" DataSourceID="SqlDataSource1" ForeColor="Black" GridLines="Vertical"
                CssClass="orders-table">
                <Columns>
                    <asp:BoundField DataField="Codigo_produto" HeaderText="Codigo_produto" SortExpression="Codigo_produto" />
                    <asp:BoundField DataField="NomeProduto" HeaderText="NomeProduto" SortExpression="NomeProduto" />
                    <asp:BoundField DataField="Valor" HeaderText="Valor" SortExpression="Valor" />
                    <asp:BoundField DataField="Data" HeaderText="Data" SortExpression="Data" />
                    <asp:BoundField DataField="NomeCompleto" HeaderText="NomeCompleto" SortExpression="NomeCompleto" />
                    <asp:BoundField DataField="Endereco" HeaderText="Endereco" SortExpression="Endereco" />
                    <asp:BoundField DataField="Telefone" HeaderText="Telefone" SortExpression="Telefone" />
                    <asp:BoundField DataField="Complemento" HeaderText="Complemento" SortExpression="Complemento" />
                    <asp:BoundField DataField="Foto_codigo" HeaderText="Foto_codigo" SortExpression="Foto_codigo" />
                </Columns>
                <FooterStyle BackColor="#CCCCCC" />
                <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#F1F1F1" />
                <SortedAscendingHeaderStyle BackColor="#808080" />
                <SortedDescendingCellStyle BackColor="#CAC9C9" />
                <SortedDescendingHeaderStyle BackColor="#383838" />
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:produtosConnectionString %>"
                SelectCommand="SELECT * FROM [Carrinhos]">
            </asp:SqlDataSource>
        </div>
    </form>
</body>
</html>
