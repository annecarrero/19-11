using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.IO;
using System.Net;
using System.Net.Mail;
using iText.Kernel.Pdf;
using iText.Layout;
using iText.Layout.Element;

namespace coloriza
{
    public partial class catalago : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CarregarProdutos();
                finalizarCompra.ServerClick += new EventHandler(FinalizarCompra_Click);
            }
        }

        private void CarregarProdutos()
        {
            string connectionString = ConfigurationManager.ConnectionStrings["produtosConnectionString"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = "SELECT Codigo_produto, NomeProduto, Valor, Foto_codigo FROM produtos";
                SqlDataAdapter da = new SqlDataAdapter(query, conn);
                DataTable dt = new DataTable();
                da.Fill(dt);

                repeaterProdutos.DataSource = dt;
                repeaterProdutos.DataBind();
            }
        }

        protected void FinalizarCompra_Click(object sender, EventArgs e)
        {
            string nome = Request.Form["nomeUsuario"];
            string email = Request.Form["emailUsuario"];
            string telefone = Request.Form["telefoneUsuario"];
            string endereco = Request.Form["enderecoUsuario"];
            string total = Request.Form["totalCarrinho"];

            // Caminho temporário para salvar o PDF antes do envio
            string pdfPath = Server.MapPath("~/temp/CompraFinalizada.pdf");

            // Gera o PDF com os dados do cliente
            GerarPDF(nome, email, telefone, endereco, total, pdfPath);

            // Envia o PDF para o Gmail
            EnviarEmailComPDF(email, pdfPath);

            // Exibe mensagem de sucesso
            lblMensagemSucesso.Text = "O resumo da sua compra foi enviado com sucesso para o seu email!";
            lblMensagemSucesso.Visible = true;

            // Limpa o PDF após o envio
            File.Delete(pdfPath);
        }

        private void GerarPDF(string nome, string email, string telefone, string endereco, string total, string filePath)
        {
            using (PdfWriter writer = new PdfWriter(filePath))
            {
                using (PdfDocument pdf = new PdfDocument(writer))
                {
                    Document document = new Document(pdf);

                    document.Add(new Paragraph("Resumo da Compra"));
                    document.Add(new Paragraph($"Nome: {nome}"));
                    document.Add(new Paragraph($"Email: {email}"));
                    document.Add(new Paragraph($"Telefone: {telefone}"));
                    document.Add(new Paragraph($"Endereço: {endereco}"));
                    document.Add(new Paragraph($"Total da Compra: {total}"));

                    document.Close();
                }
            }
        }

        private void EnviarEmailComPDF(string paraEmail, string pdfPath)
        {
            MailMessage mail = new MailMessage();
            SmtpClient smtpServer = new SmtpClient("smtp.gmail.com");

            mail.From = new MailAddress("aliceeferreiracampos@gmail.com");  // Insira seu email
            mail.To.Add(paraEmail);
            mail.Subject = "Resumo da sua compra";
            mail.Body = "Olá, segue em anexo o resumo da sua compra.";

            Attachment attachment = new Attachment(pdfPath);
            mail.Attachments.Add(attachment);

            smtpServer.Port = 587;
            smtpServer.Credentials = new NetworkCredential("aliceeferreiracampos@gmail.com", "aLiceC4007");
            smtpServer.EnableSsl = true;

            smtpServer.Send(mail);
        }
    }
}

