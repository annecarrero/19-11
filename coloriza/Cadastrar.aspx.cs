using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Web.UI;

namespace cadastro
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnCadastrar_Click(object sender, EventArgs e)
        {
            // Captura os dados do formulário
            string nome = txtNome.Text.Trim();
            string email = txtEmail.Text.Trim();
            string senha = txtSenha.Text.Trim();

            // Verifica se todos os campos foram preenchidos
            if (string.IsNullOrWhiteSpace(nome) || string.IsNullOrWhiteSpace(email) || string.IsNullOrWhiteSpace(senha))
            {
                lblMensagem.Text = "Preencha todos os campos.";
                return;
            }

            // Valida se o e-mail termina com "@adm.com"
            if (!email.EndsWith("@adm.com"))
            {
                lblMensagem.Text = "O e-mail precisa terminar com '@adm.com' para cadastro.";
                return;
            }

            // Verifica se o e-mail já está cadastrado
            if (IsEmailCadastrado(email))
            {
                lblMensagem.Text = "Este e-mail já está cadastrado.";
                return;
            }

            // Hash da senha para segurança
            string hashedSenha = ComputeHash(senha);

            // String de conexão com o banco de dados
            string connectionString = @"Data Source=DESKTOP-L96BIJ6;Initial Catalog=CadastroDB;Integrated Security=True";

            // Inserir os dados no banco
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                try
                {
                    conn.Open();
                    string query = "INSERT INTO Usuarios (Nome, Email, Senha) VALUES (@Nome, @Email, @Senha)";

                    using (SqlCommand cmd = new SqlCommand(query, conn))
                    {
                        cmd.Parameters.Add("@Nome", SqlDbType.NVarChar).Value = nome;
                        cmd.Parameters.Add("@Email", SqlDbType.NVarChar).Value = email;
                        cmd.Parameters.Add("@Senha", SqlDbType.NVarChar).Value = hashedSenha;

                        int rowsAffected = cmd.ExecuteNonQuery();

                        if (rowsAffected > 0)
                        {
                            lblMensagem.Text = "Usuário cadastrado com sucesso!";
                            // Redireciona para a página de administração
                            Response.Redirect("pagADM.aspx");
                        }
                        else
                        {
                            lblMensagem.Text = "Erro ao cadastrar usuário.";
                        }
                    }
                }
                catch (Exception ex)
                {
                    lblMensagem.Text = "Erro: " + ex.Message;
                }
            }
        }

        // Método para verificar se o e-mail já está cadastrado no banco de dados
        private bool IsEmailCadastrado(string email)
        {
            string connectionString = @"Data Source=DESKTOP-L96BIJ6;Initial Catalog=CadastroDB;Integrated Security=True";
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                try
                {
                    conn.Open();
                    string query = "SELECT COUNT(*) FROM Usuarios WHERE Email = @Email";

                    using (SqlCommand cmd = new SqlCommand(query, conn))
                    {
                        cmd.Parameters.Add("@Email", SqlDbType.NVarChar).Value = email;

                        int count = (int)cmd.ExecuteScalar();
                        return count > 0;
                    }
                }
                catch (Exception ex)
                {
                    lblMensagem.Text = "Erro ao verificar e-mail: " + ex.Message;
                    return false;
                }
            }
        }

        // Método para gerar o hash da senha
        private string ComputeHash(string input)
        {
            using (var sha256 = System.Security.Cryptography.SHA256.Create())
            {
                byte[] bytes = sha256.ComputeHash(System.Text.Encoding.UTF8.GetBytes(input));
                return BitConverter.ToString(bytes).Replace("-", "").ToLower();
            }
        }
    }
}