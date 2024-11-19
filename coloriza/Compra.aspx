<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Compra.aspx.cs" Inherits="coloriza.Compra" %>

<!DOCTYPE html>
<html>
<head>
    <title>Finalizar Compra</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.qrcode/1.0/jquery.qrcode.min.js"></script>
</head>
<body>
    <div class="container my-5">
        <h2>Finalizar Compra</h2>
        
        <!-- Lista de produtos do carrinho -->
        <div class="mt-4">
            <h5>Produtos no Carrinho:</h5>
            <ul id="listaCarrinho" class="list-group mb-3">
                <!-- Produtos do carrinho carregados com JavaScript -->
            </ul>
            <p><strong>Total da Compra:</strong> <span id="totalCompra">R$ 0,00</span></p>
        </div>

        <!-- Formulário de dados do usuário -->
        <h5>Dados do Cliente</h5>
        <form id="formFinalizarCompra" method="post" runat="server">
            <div class="mb-3">
                <label for="nome" class="form-label">Nome Completo</label>
                <input type="text" id="nome" name="nome" class="form-control" required />
            </div>
            <div class="mb-3">
                <label for="email" class="form-label">Email</label>
                <input type="email" id="email" name="email" class="form-control" required />
            </div>
            <div class="mb-3">
                <label for="endereco" class="form-label">Endereço</label>
                <input type="text" id="endereco" name="endereco" class="form-control" required />
            </div>
            <button type="button" id="btnFinalizarCompra" class="btn btn-success w-100">Finalizar Compra</button>
        </form>

        <!-- QR Code do boleto/pagamento -->
        <div id="qrcode" class="mt-5"></div>
    </div>

    <script>
        // Carregar os dados do carrinho
        document.addEventListener("DOMContentLoaded", function () {
            const carrinhoItens = JSON.parse(localStorage.getItem('carrinhoItens')) || [];
            const total = parseFloat(localStorage.getItem('totalCarrinho')) || 0;

            const listaCarrinho = document.getElementById('listaCarrinho');
            const totalCompra = document.getElementById('totalCompra');
            totalCompra.textContent = total.toLocaleString('pt-BR', { style: 'currency', currency: 'BRL' });

            carrinhoItens.forEach(item => {
                const listItem = document.createElement('li');
                listItem.classList.add('list-group-item');
                listItem.textContent = `${item.nome} - ${item.preco}`;
                listaCarrinho.appendChild(listItem);
            });

            // Enviar dados ao servidor e gerar QRCode
            document.getElementById('btnFinalizarCompra').addEventListener('click', function () {
                const nome = document.getElementById('nome').value;
                const email = document.getElementById('email').value;
                const endereco = document.getElementById('endereco').value;

                // Enviar dados para o backend via AJAX ou Fetch
                fetch('FinalizarCompra.aspx/SalvarCompra', {
                    method: 'POST',
                    headers: { 'Content-Type': 'application/json' },
                    body: JSON.stringify({ nome, email, endereco, carrinhoItens, total })
                })
                .then(response => response.json())
                .then(data => {
                    // Gerar QR Code com URL de pagamento ou dados de boleto
                    $('#qrcode').qrcode({ text: "http://boleto/pagamento-url" });
                    alert("Compra finalizada! QR Code gerado.");
                })
                .catch(error => alert("Erro ao finalizar compra: " + error));
            });
        });
    </script>
</body>
</html>

