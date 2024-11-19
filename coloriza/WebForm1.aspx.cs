using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TESTE2
{
    public partial class WebForm1 : Page
    {
        protected void btnAdicionar_Click(object sender, EventArgs e)
        {
            List<Item> carrinho = Session["Carrinho"] as List<Item>;
            if (carrinho == null)
            {
                carrinho = new List<Item>();
            }

            decimal valorTotal = 0;
            int numeroItens = 0;

            // Iterar pelas linhas do GridView
            foreach (GridViewRow row in GridViewProdutos.Rows)
            {
                CheckBox chkSelect = (CheckBox)row.FindControl("chkSelect");
                if (chkSelect != null && chkSelect.Checked)
                {
                    // Captura o item selecionado
                    string nome = row.Cells[2].Text; // Nome do produto
                    decimal valor = Convert.ToDecimal(row.Cells[3].Text); // Valor do produto

                    // Adicionar o item ao carrinho
                    carrinho.Add(new Item { Nome = nome, Valor = valor });

                    // Calcular total
                    valorTotal += valor;
                    numeroItens++;

                    // Inserindo o item no banco de dados Carrinhos
                    try
                    {
                        using (SqlConnection conn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["LojaDeTintasConexao"].ConnectionString))
                        {
                            string query = "INSERT INTO Carrinhos (Nome, Valor, Data) VALUES (@Nome, @Valor, GETDATE())";
                            SqlCommand cmd = new SqlCommand(query, conn);
                            cmd.Parameters.AddWithValue("@Nome", nome);
                            cmd.Parameters.AddWithValue("@Valor", valor);

                            conn.Open();
                            cmd.ExecuteNonQuery();
                        }
                    }
                    catch (Exception ex)
                    {
                        // Tratar erros ao inserir no banco de dados
                        Response.Write("Erro ao adicionar o item ao carrinho: " + ex.Message);
                    }
                }
            }

            // Atualizar sessão do carrinho
            Session["Carrinho"] = carrinho;

            // Atualizar labels de total e número de itens
            lblValorTotal.Text = $"Valor Total: {valorTotal:F2}"; // Formatação de moeda
            lblNumeroItens.Text = $"Nº Itens: {numeroItens}";
        }
    }

    public class Item
    {
        public string Nome { get; set; }
        public decimal Valor { get; set; }
    }
}
