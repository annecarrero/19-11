using System;
using System.Data.SqlClient;
using System.Web;

namespace coloriza
{
    public partial class processar_compra : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Verifica se a requisição é POST (feito via AJAX)
            if (Request.HttpMethod == "POST")
            {
                // Coleta os dados do formulário enviados via AJAX
                string nome = Request.Form["nome"];
                string email = Request.Form["email"];
                string endereco = Request.Form["endereco"];
                decimal total = Convert.ToDecimal(Request.Form["total"]);

                // Validação básica dos dados
                if (string.IsNullOrEmpty(nome) || string.IsNullOrEmpty(email) || string.IsNullOrEmpty(endereco) || total <= 0)
                {
                    Response.Write("Erro: Todos os campos devem ser preenchidos corretamente.");
                    return;
                }

                // String de conexão com o banco de dados
                string connectionString = "Server=DESKTOP-L96BIJ6; Database=DESKTOP-L96BIJ6; Integrated Security=True;";

                // Comando SQL para inserir dados na tabela Finalizar
                string query = "INSERT INTO Finalizar (Nome, Email, Endereco, Total) VALUES (@Nome, @Email, @Endereco, @Total)";

                try
                {
                    using (SqlConnection connection = new SqlConnection(connectionString))
                    {
                        SqlCommand command = new SqlCommand(query, connection);
                        command.Parameters.AddWithValue("@Nome", nome);
                        command.Parameters.AddWithValue("@Email", email);
                        command.Parameters.AddWithValue("@Endereco", endereco);
                        command.Parameters.AddWithValue("@Total", total);

                        connection.Open();
                        command.ExecuteNonQuery();

                        // Retorna uma mensagem de sucesso
                        Response.Write("Compra realizada com sucesso!");
                    }
                }
                catch (SqlException sqlEx)
                {
                    // Exibe erros SQL
                    Response.Write("Erro ao realizar a compra (SQL): " + sqlEx.Message);
                }
                catch (Exception ex)
                {
                    // Exibe erros gerais
                    Response.Write("Erro ao realizar a compra: " + ex.Message);
                }
            }
        }
    }
}
