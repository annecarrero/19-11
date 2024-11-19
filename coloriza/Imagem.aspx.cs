using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Data.SqlClient; //Add

public partial class Imagem : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString.HasKeys())
        {
            int IdImagem = Convert.ToInt32(Request.QueryString["ID"].ToString());
            CarregarImagem(IdImagem);
        }
        else
        {
            Response.Redirect("cadastrar_aluno.aspx");
        }
    }
    private void CarregarImagem(int IdImagem)
    {
        using (SqlConnection objConexao = new SqlConnection(ConfigurationManager.ConnectionStrings["produtosConexao"].ConnectionString))
        {
            try
            {

                const string strSelect = "Select Extensao, Imagem From Imagens Where Código_Imagem = @IdImagem";
                SqlCommand cmd = new SqlCommand(strSelect, objConexao);
                cmd.Parameters.AddWithValue("@IdImagem", IdImagem);

                objConexao.Open();
                SqlDataReader reader = cmd.ExecuteReader();

                while (reader.Read())
                {

                    Response.ContentType = reader["Extensao"].ToString();
                    Response.BinaryWrite((byte[])reader["Imagem"]);
                }
                
                reader.Close();
                objConexao.Close();
            }
            catch (Exception ex)
            {
                Response.Write("Ocorreu o seguinte erro: " + ex.Message);
            }


        }

    }

}
