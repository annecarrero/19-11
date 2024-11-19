using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace paginadoADM
{
    public partial class WebForm2 : System.Web.UI.Page
    {

        string fileType = string.Empty; // variÃ¡vel global
        int ultimoRegistro = 0;
        int numRegistro = 0;
        string ver_salvar_imagem;
        string xAnoLetivo;
        bool bRetorno = false;

        protected void Page_Load(object sender, EventArgs e)
        {
            ver_salvar_imagem = "";
        }

        private bool atualizarFotoTabAlunos(string CodigoImagem, string codigoProduto)
        {

            //â€â€â€â€â€â€â€ ApÃ³s gravar a imagem, buscarÃ¡ na tabela de paramentros o ANO Letivo e pesquisarÃ¡ o RA.
            string conexaoClass = System.Web.Configuration.WebConfigurationManager.ConnectionStrings["produtosConexao"].ConnectionString;
            string SQL = "UPDATE PRODUTOS SET Foto_codigo = " + CodigoImagem + " WHERE Codigo_produto = " + codigoProduto + "";

            SqlDataReader dr = null;
            SqlConnection conn = null;
            try
            {
                conn = new SqlConnection(conexaoClass);
                if (conn.State == ConnectionState.Closed)
                {
                    conn.Open();
                }
                SqlCommand cmd = new SqlCommand(SQL, conn);
                dr = cmd.ExecuteReader();
                if (dr.RecordsAffected > 0) // se o datareader contiver linhas...
                {
                    return true;
                }
                else
                {
                    return false; ;
                }
            }
            catch (Exception ex)

            {
                return false;
            }
        }

        protected void Grid_PRODUTOS_SelectedIndexChanged(object sender, EventArgs e)
        {
            string codigoFoto = Grid_PRODUTOS.SelectedRow.Cells[4].Text;
            lblCodigoDaFoto.Text = codigoFoto;

            string codigoProduto = Grid_PRODUTOS.SelectedRow.Cells[1].Text;
            lblCodigoDoProduto.Text = codigoProduto;

            string nomeProd = Grid_PRODUTOS.SelectedRow.Cells[3].Text;
            nomeProd = HttpUtility.HtmlDecode(nomeProd);
            txtEditarNomeProd.Text = nomeProd;

            pnlEditar_e_Foto.Visible = true;

            if (lblCodigoDaFoto.Text.Length > 0 && lblCodigoDaFoto.Text != "&nbsp;")
            {
                Image1.ImageUrl = "~/Imagem.aspx?ID=" + lblCodigoDaFoto.Text;
            }
            else
            {
                Image1.ImageUrl = "~/imagens/sem_produtos.jpg";
            }
        }

        private void SalvarImagem(bool bRetorno)
        {

            if (bRetorno)
            {

                using (SqlConnection objConexao = new
                SqlConnection(ConfigurationManager.ConnectionStrings["produtosConexao"].ConnectionString))
                {

                    try
                    {

                        const string strInsert = "Insert Into Imagens (Extensao, Imagem) values(@Extensao, @Imagem) Select Scope_Identity()";

                        SqlCommand cmd = new SqlCommand(strInsert, objConexao);

                        //cmd.Parameters.AddWithValue("@Nome", txtNomeArquivo.Text.Trim());

                        cmd.Parameters.AddWithValue("@Extensao", fileType);

                        byte[] imagemBytes = new
                        byte[FileUpload1.PostedFile.InputStream.Length + 1];

                        FileUpload1.PostedFile.InputStream.Read(imagemBytes, 0,
                        imagemBytes.Length);

                        cmd.Parameters.AddWithValue("@Imagem", imagemBytes);

                        objConexao.Open();
                        int imagemId = Convert.ToInt32("0" + cmd.ExecuteScalar());
                        Session["SImagemId"] = imagemId;

                        //hypExibeImagem.NavigateUrl = "~/Imagem.aspx?ID=" +
                        imagemId.ToString();

                        //cmd.ExecuteNonQuery(); //Comentei este trecho em 18/09/12

                        objConexao.Close();

                        lblAvisoFoto.Text = "Upload efetuado com Sucesso!";

                    }

                    catch (Exception ex)
                    {

                        lblAvisoFoto.Text = "Ocorreu o seguinte erro: " + ex.Message;

                    }

                }

            }

            else

            {

                lblAvisoFoto.Text = "<br />Erro â€ tipo de arquivo invÃ¡lido.<br />";

            }

        }

        private void VerificaImagem()
        {
            //O VerificaImagem, no final, salva a Imagem se tudo OK !

            //bool bRetorno = false;
            bRetorno = false;

            string extension = Path.GetExtension(FileUpload1.PostedFile.FileName).ToLower();

            switch (extension)
            {
                case ".gif":
                    fileType = "gif";
                    bRetorno = true;
                    break;

                case ".jpg":
                case ".jpeg":

                    fileType = "jpeg";
                    bRetorno = true;
                    break;

                case ".png":
                    fileType = "png";
                    bRetorno = true;
                    break;

                default:
                    lblAvisoFoto.Text = "<br />Erro â€ tipo de arquivo invÃ¡lido.<br />";
                    bRetorno = false;
                    break;
            }
            if (bRetorno == true)
            {
                SalvarImagem(bRetorno);
            }
        } //Fim VerificaImagem

        protected void btnAdicionarProduto_Click(object sender, EventArgs e)
        {
            string nomeProduto = txtAddNomeProd.Text;
            double precoProduto = Convert.ToDouble(txtAddPrecoProd.Text);


            string conexao = System.Web.Configuration.WebConfigurationManager.ConnectionStrings["produtosConexao"].ConnectionString;
            string SQL = "INSERT INTO Produtos (NomeProduto, Valor) VALUES ('" + nomeProduto + "', " + precoProduto + ")";

            SqlDataReader dr = null;
            SqlConnection conn = null;

            try
            {
                conn = new SqlConnection(conexao);

                if (conn.State == ConnectionState.Closed)
                {
                    conn.Open();
                }

                SqlCommand cmd = new SqlCommand(SQL, conn);
                dr = cmd.ExecuteReader();

                if (dr.RecordsAffected > 0)
                {
                    lblAviso.Text = "Produto incluÃ­do com sucesso !";
                    Grid_PRODUTOS.DataBind();
                }
                else
                {
                    lblAviso.Text = "Nenhum produto foi incluÃ­do. Por favor tente novamente !";
                }

            }
            catch (Exception ex)
            {

            }
            finally
            {
                if (conn != null)
                {
                    conn.Close();
                }
            }

        }

        protected void btnNovoItem_Click(object sender, EventArgs e)
        {
            pnlNovoItem.Visible = true;
        }

        protected void btnSalvarFoto_Click(object sender, EventArgs e)
        {
            try
            {
                if (FileUpload1.PostedFile.FileName.Length > 0)
                {

                    VerificaImagem();

                    //lbl_aviso_foto.Text = Session["SImagemId"].ToString();
                    if (bRetorno == true)
                    {
                        Image1.ImageUrl = "~/Imagem.aspx?ID=" + Session["SImagemId"].ToString();

                        string codigoImagem = Session["SImagemId"].ToString();
                        string codigoProduto = lblCodigoDoProduto.Text;

                        bool atualizar = atualizarFotoTabAlunos(codigoImagem, codigoProduto);
                        //A linha anterior, chama a funÃ§Ã£o de AtualizarFotos na tabela de alunos.
                        //Ou seja: ApÃ³s inserir a foto na tabela imagens, esse cÃ³digo da foto precisa ser atualizado tambÃ©m
                        //na tabela de pessoas.

                        if (atualizar == true)
                        {
                            lblAvisoFoto.Text = "Foto registrada com sucesso na tabela de Pessoas";
                        }
                        else
                        {
                            lblAvisoFoto.Text = "Foto registrada com erro na tabela de Pessoas â€ Por favor avisar TI para anÃ¡lisar.";

                        }

                        Grid_PRODUTOS.DataBind();

                    }//Se foto nÃ£o tiver formato correto, nÃ£o deverÃ¡ ser salva.

                }

            }
            catch (Exception EX)
            {

                //throw;
            }

            try
            {
                string editarNome = txtEditarNomeProd.Text;
                double editarPreco = Convert.ToDouble(txtAddPrecoProd.Text);
                string editarCodProduto = lblCodigoDoProduto.Text;


                string conexao = System.Web.Configuration.WebConfigurationManager.ConnectionStrings["produtosConexao"].ConnectionString;
                string SQL = "UPDATE Produtos SET NomeProduto = '" + editarNome + "', Valor = " + editarPreco + " WHERE Codigo_produto = " + editarCodProduto + "";

                SqlDataReader dr = null;
                SqlConnection conn = null;

                try
                {
                    conn = new SqlConnection(conexao);

                    if (conn.State == ConnectionState.Closed)
                    {
                        conn.Open();
                    }

                    SqlCommand cmd = new SqlCommand(SQL, conn);
                    dr = cmd.ExecuteReader();

                    if (dr.RecordsAffected > 0)
                    {
                        lblAviso.Text = " Salvo com sucesso !";
                        Grid_PRODUTOS.DataBind();
                    }
                    else
                    {
                        lblAviso.Text = " Por favor tente novamente !";
                    }

                }
                catch (Exception ex)
                {

                }
                finally
                {
                    if (conn != null)
                    {
                        conn.Close();
                    }
                }

            }
            catch (Exception ex)
            {

                //throw;
            }


        }
    }
}


