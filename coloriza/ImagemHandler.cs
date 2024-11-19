using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace paginadoADM
{
    public class ImagemHandler : IHttpHandler
    {
        public void ProcessRequest(HttpContext context)
        {
            string idImagem = context.Request.QueryString["ID"];

            if (!string.IsNullOrEmpty(idImagem))
            {
                string conexao = ConfigurationManager.ConnectionStrings["produtosConexao"].ConnectionString;
                using (SqlConnection conn = new SqlConnection(conexao))
                {
                    string query = "SELECT Imagem, Extensao FROM Imagens WHERE CodigoImagem = @CodigoImagem";
                    SqlCommand cmd = new SqlCommand(query, conn);
                    cmd.Parameters.AddWithValue("@CodigoImagem", idImagem);

                    conn.Open();
                    SqlDataReader dr = cmd.ExecuteReader();

                    if (dr.Read())
                    {
                        byte[] imagemBytes = (byte[])dr["Imagem"];
                        string extensao = dr["Extensao"].ToString();

                        context.Response.ContentType = "image/" + extensao;
                        context.Response.BinaryWrite(imagemBytes);
                    }
                }
            }
        }

        public bool IsReusable
        {
            get { return false; }
        }
    }
}