using System;
using System.Data.SqlClient;
using System.Web.Services;
using System.Collections.Generic;

namespace coloriza
{
    public partial class FinalizarCompra : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e) { }

        [WebMethod]
        public static string SalvarCompra(string nome, string email, string endereco, List<dynamic> carrinhoItens, decimal total)
        {
            // Aqui você define a string de conexão
            string conexao = "Server=DESKTOP-L96BIJ6;Database=SeuNomeDoBanco;User Id=SeuUsuario;Password=SuaSenha;";

            using (SqlConnection conn = new SqlConnection(conexao))
            {
                // Comando SQL para inserir dados na tabela Compras
                SqlCommand cmd = new SqlCommand("INSERT INTO Compras (NomeCliente, Email, Endereco, TotalCompra) OUTPUT INSERTED.ID VALUES (@Nome, @Email, @Endereco, @Total)", conn);
                cmd.Parameters.AddWithValue("@Nome", nome);
                cmd.Parameters.AddWithValue("@Email", email);
                cmd.Parameters.AddWithValue("@Endereco", endereco);
                cmd.Parameters.AddWithValue("@Total", total);

                try
                {
                    conn.Open(); // Abre a conexão com o banco de dados
                    int compraId = (int)cmd.ExecuteScalar(); // Executa a consulta e retorna o ID gerado

                    // Agora, salva os itens do carrinho na tabela ItensCompra
                    foreach (var item in carrinhoItens)
                    {
                        SqlCommand itemCmd = new SqlCommand("INSERT INTO ItensCompra (CompraId, NomeProduto, Preco) VALUES (@CompraId, @NomeProduto, @Preco)", conn);
                        itemCmd.Parameters.AddWithValue("@CompraId", compraId);
                        itemCmd.Parameters.AddWithValue("@NomeProduto", item.nome);
                        itemCmd.Parameters.AddWithValue("@Preco", item.preco);
                        itemCmd.ExecuteNonQuery(); // Executa o comando para cada item
                    }

                    return "Compra salva com sucesso"; // Mensagem de sucesso
                }
                catch (Exception ex)
                {
                    return "Erro ao salvar a compra: " + ex.Message; // Mensagem de erro
                }
            }
        }
    }
}
