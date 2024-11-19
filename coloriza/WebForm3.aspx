<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm3.aspx.cs" Inherits="TESTE2.WebForm3" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.qrcode/1.0/jquery.qrcode.min.js"></script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- Seção do carrinho -->
    <button class="btn btn-primary" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasCarrinho" aria-controls="offcanvasCarrinho">Ver Carrinho</button>

    <!-- Offcanvas para o Carrinho -->
    <div class="offcanvas offcanvas-end" tabindex="-1" id="offcanvasCarrinho" aria-labelledby="offcanvasCarrinhoLabel">
        <div class="offcanvas-header">
            <h5 id="offcanvasCarrinhoLabel">Carrinho de Compras</h5>
            <button type="button" class="btn-close" data-bs-dismiss="offcanvas" aria-label="Close"></button>
        </div>
        <div class="offcanvas-body">
            <!-- Aqui será exibido o conteúdo do carrinho -->
            <div id="carrinhoConteudo"></div>

            <!-- Formulário de Finalização -->
            <form id="finalizarCompraForm">
                <div class="mb-3">
                    <label for="nome" class="form-label">Nome</label>
                    <input type="text" class="form-control" id="nome" required />
                </div>
                <div class="mb-3">
                    <label for="email" class="form-label">Email</label>
                    <input type="email" class="form-control" id="email" required />
                </div>
                <div class="mb-3">
                    <label for="endereco" class="form-label">Endereço</label>
                    <input type="text" class="form-control" id="endereco" required />
                </div>
                <div class="mb-3">
                    <label for="total" class="form-label">Total</label>
                    <input type="text" class="form-control" id="total" disabled />
                </div>
                <button type="submit" class="btn btn-success">Finalizar Compra</button>
            </form>
        </div>
    </div>
</asp:Content>

<script>
    $(document).ready(function () {
        // Adicionar ao carrinho (exemplo, pode ser modificado conforme o carrinho real)
        var carrinho = [
            { nome: "Produto 1", preco: 50.00 },
            { nome: "Produto 2", preco: 30.00 },
        ];

        // Exibir itens no carrinho
        function exibirCarrinho() {
            var carrinhoConteudo = $('#carrinhoConteudo');
            var total = 0;
            carrinhoConteudo.html('');
            carrinho.forEach(function (item) {
                carrinhoConteudo.append('<p>' + item.nome + ' - R$ ' + item.preco.toFixed(2) + '</p>');
                total += item.preco;
            });
            $('#total').val('R$ ' + total.toFixed(2));
        }

        // Exibir carrinho ao abrir o offcanvas
        $('#offcanvasCarrinho').on('show.bs.offcanvas', function () {
            exibirCarrinho();
        });

        // Enviar dados do formulário de finalização via AJAX
        $('#finalizarCompraForm').submit(function (e) {
            e.preventDefault();

            var nome = $('#nome').val();
            var email = $('#email').val();
            var endereco = $('#endereco').val();
            var total = $('#total').val().replace('R$ ', '').replace(',', '.');  // Converte para formato decimal

            // Enviar os dados via AJAX
            $.ajax({
                url: 'processar_compra.aspx',
                type: 'POST',
                data: {
                    nome: nome,
                    email: email,
                    endereco: endereco,
                    total: total
                },
                success: function (response) {
                    alert(response);  // Mensagem de sucesso ou erro
                    $('#offcanvasCarrinho').offcanvas('hide');  // Fecha o offcanvas
                },
                error: function (xhr, status, error) {
                    alert("Erro ao finalizar a compra: " + error);
                }
            });
        });
    });
</script>
