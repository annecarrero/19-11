using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace TESTE2
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Captura os dados do carrinho enviados via QueryString
                string carrinhoData = Request.QueryString["Carrinho"];
                if (!string.IsNullOrEmpty(carrinhoData))
                {
                    // Separa os itens usando o delimitador "|"
                    var itensCarrinho = carrinhoData.Split('|');
                    foreach (var item in itensCarrinho)
                    {
                        // Separa os detalhes de cada item (nome e valor) usando ";"
                        var detalhes = item.Split(';');
                        string nome = detalhes[0];
                        decimal valor = Convert.ToDecimal(detalhes[1]);

                        // Insere os itens no banco de dados
                        InserirPedido(nome, valor);
                    }
                }
            }
        }

        // Método para inserir pedido no banco de dados
        private void InserirPedido(string nome, decimal valor)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["produtosConexao"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = "INSERT INTO Pedidos (NomeProduto, Valor, Data) VALUES (@NomeProduto, @Valor, @Data)";
                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@NomeProduto", nome);  // Variável 'nome' deve estar definida
                    cmd.Parameters.AddWithValue("@Valor", valor);        // Variável 'valor' deve estar definida
                    cmd.Parameters.AddWithValue("@Data", DateTime.Now);  // Adicionando data atual
                    

                    conn.Open();  // Abrindo a conexão
                    cmd.ExecuteNonQuery();  // Executando a query
                }

            }
        }

        // Evento chamado quando o botão "Excluir" é clicado
        protected void GridViewAdicionados_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Excluir")
            {
                // Obtém o nome completo a partir do argumento do comando
                string nomeCompleto = Convert.ToString(e.CommandArgument);

                // Chama o método para remover o item usando o NomeCompleto
                RemoveItemFromCarrinho(nomeCompleto);
            }
        }

        private void RemoveItemFromCarrinho(string nomeCompleto)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["produtosConexao"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();
                using (SqlCommand cmd = new SqlCommand("DELETE FROM [Carrinhos] WHERE NomeCompleto = @NomeCompleto", conn))
                {
                    cmd.Parameters.AddWithValue("@NomeCompleto", nomeCompleto);
                    cmd.ExecuteNonQuery();
                }
            }

            // Atualiza o GridView após a remoção
            GridViewAdicionados.DataBind();
        }
    }
}