using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Web.UI;


namespace cadastro
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string email = txtEmail.Text;
            string senha = txtSenha.Text;

            // String de conexão com o banco de dados
            string connectionString = @"Data Source=DESKTOP-L96BIJ6;Initial Catalog=CadastroDB;Integrated Security=True";

            // Verificar se o campo de email e senha não estão vazios
            if (string.IsNullOrEmpty(email) || string.IsNullOrEmpty(senha))
            {
                lblMensagem.Text = "Por favor, preencha todos os campos.";
                return;
            }

            // Consulta no banco de dados para verificar se o usuário existe
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                try
                {
                    conn.Open();
                    string query = "SELECT COUNT(1) FROM Usuarios WHERE Email = @Email AND Senha = @Senha";

                    using (SqlCommand cmd = new SqlCommand(query, conn))
                    {
                        // Parâmetros para prevenir SQL Injection
                        cmd.Parameters.AddWithValue("@Email", email);
                        cmd.Parameters.AddWithValue("@Senha", senha);

                        int count = Convert.ToInt32(cmd.ExecuteScalar());

                        if (count == 1) // Login validado no banco
                        {
                            if (email.EndsWith("@adm.com")) // Verifica se o email termina com "@adm.com"
                            {
                                lblMensagem.Text = "Login realizado com sucesso como administrador!";
                                Response.Redirect("pagADM.aspx"); // Redireciona para a página do administrador
                            }
                            else
                            {
                                lblMensagem.Text = "Acesso permitido apenas para administradores com email @adm.com."; // Bloqueia o login
                            }
                        }
                        else
                        {
                            lblMensagem.Text = "Email ou senha inválidos."; // Mensagem de login inválido
                            txtSenha.Text = ""; // Limpa o campo senha
                            txtSenha.Focus(); // Foca no campo senha
                        }

                    }
                }
                catch (Exception ex)
                {
                    // Exibe mensagem de erro caso ocorra alguma exceção
                    lblMensagem.Text = "Erro: " + ex.Message;
                }
            }
        }
    }
}
