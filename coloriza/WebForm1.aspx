<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="TESTE2.WebForm1" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <!-- Fonte de dados da tabela Produtos -->
            <asp:SqlDataSource ID="SqlDataSourceProdutos" runat="server" ConnectionString="<%$  ConnectionStrings:produtosConexao %>" 
                SelectCommand="SELECT * FROM [Produtos]"></asp:SqlDataSource>

            <!-- GridView para exibir produtos -->
            <asp:GridView ID="GridViewProdutos" runat="server" AutoGenerateColumns="False"
                DataSourceID="SqlDataSourceProdutos" DataKeyNames="Id" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" ForeColor="Black" GridLines="Vertical">
                <AlternatingRowStyle BackColor="#CCCCCC" />
                <Columns>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:CheckBox ID="chkSelect" runat="server" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="Id" HeaderText="Id" ReadOnly="True" />
                    <asp:BoundField DataField="Nome" HeaderText="Nome" />
                    <asp:BoundField DataField="Valor" HeaderText="Valor" />
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

            <br />
            <!-- Labels para exibir o valor total e o número de itens -->
            <asp:Label ID="lblValorTotal" runat="server" Text="Valor Total: 00,00"></asp:Label>
            <br />
            <asp:Label ID="lblNumeroItens" runat="server" Text="Nº Itens: 0"></asp:Label>

            <br /><br />

            <!-- Botão para adicionar itens ao Carrinho -->
            <asp:Button ID="btnAdicionar" runat="server" OnClick="btnAdicionar_Click" Text="Adicionar" />

            <br /><br />

            <!-- Botão para visualizar o Carrinho em outra página -->
            <asp:Button ID="btnVisualizarCarrinho" runat="server" Text="Ver Carrinho" PostBackUrl="~/WebForm2.aspx" />
        </div>
    </form>
</body>
</html>
