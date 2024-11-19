<%@ Page Title="" Language="C#" MasterPageFile="~/menu.Master" AutoEventWireup="true" CodeBehind="catalago.aspx.cs" Inherits="coloriza.catalago" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.qrcode/1.0/jquery.qrcode.min.js"></script>
    <link rel="stylesheet" href="styles.css">
    <style>
        body {
            background-color: #f4f4f4;
            font-family: 'Roboto', sans-serif;
        }
        .titulo-catalogo {
            text-align: center;
            font-size: 36px;
            font-weight: bold;
            color: #4a4a4a;
            margin: 40px 0;
            text-transform: uppercase;
        }
        .produtos-container {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            padding: 20px;
        }
        .produto {
            background-color: #fff;
            border: 1px solid #ddd;
            border-radius: 8px;
            margin: 10px;
            padding: 15px;
            text-align: center;
            width: calc(25% - 20px);
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            transition: transform 0.3s, box-shadow 0.3s;
        }
        .produto:hover {
            transform: translateY(-5px);
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.3);
        }
        .produto img {
            width: 100%;
            height: 200px;
            object-fit: cover;
            border-radius: 4px;
        }
        .produto h3 {
            font-size: 18px;
            color: #333;
            margin: 10px 0;
        }
        .produto p {
            font-size: 16px;
            color: #666;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <asp:Label ID="lblMensagemSucesso" runat="server" CssClass="alert alert-success" Visible="false"></asp:Label>

    <!-- Seção de Carrossel -->
    <div id="myCarousel" class="carousel slide" data-bs-ride="carousel">
        <ol class="carousel-indicators">
            <li data-bs-target="#myCarousel" data-bs-slide-to="0" class="active"></li>
            <li data-bs-target="#myCarousel" data-bs-slide-to="1"></li>
            <li data-bs-target="#myCarousel" data-bs-slide-to="2"></li>
        </ol>
        <div class="carousel-inner">
            <div class="carousel-item active">
                <img src="img/1.png" alt="Transforme Seus Espaços" class="d-block w-100">
                <div class="carousel-caption d-none d-md-block">
                    <h5>Transforme Seus Espaços</h5>
                    <p>Encontre a cor perfeita para cada ambiente.</p>
                </div>
            </div>
            <div class="carousel-item">
                <img src="img/2.png" alt="Qualidade e Variedade" class="d-block w-100">
                <div class="carousel-caption d-none d-md-block">
                    <h5>Qualidade e Variedade</h5>
                    <p>Explore nossa ampla gama de tintas.</p>
                </div>
            </div>
            <div class="carousel-item">
                <img src="img/3.png" alt="Cores que Inspiram" class="d-block w-100">
                <div class="carousel-caption d-none d-md-block">
                    <h5>Cores que Inspiram</h5>
                    <p>Encontre a inspiração para seu próximo projeto.</p>
                </div>
            </div>
        </div>
        <a class="carousel-control-prev" href="#myCarousel" role="button" data-bs-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
        </a>
        <a class="carousel-control-next" href="#myCarousel" role="button" data-bs-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
        </a>
    </div>

    <div class="titulo-catalogo">Catálogo</div>

    <div class="produtos-container">
        <asp:Repeater ID="repeaterProdutos" runat="server">
            <ItemTemplate>
                <div class="produto">
                    <img src='<%# Eval("Foto_codigo") %>' alt='<%# Eval("NomeProduto") %>' />
                    <h3><%# Eval("NomeProduto") %></h3>
                    <p>Preço: <%# Eval("Valor", "{0:C}") %></p>
                    <button type="button" class="btn btn-primary add-to-cart" data-nome='<%# Eval("NomeProduto") %>' data-preco='<%# Eval("Valor") %>'>
                        Adicionar ao Carrinho
                    </button>
                </div>
            </ItemTemplate>
        </asp:Repeater>
    </div>

    <!-- Botão para abrir o Carrinho -->
    <button class="btn btn-success" data-bs-toggle="offcanvas" data-bs-target="#offcanvasCarrinho" aria-controls="offcanvasCarrinho">Ver Carrinho</button>

    <!-- Offcanvas do Carrinho -->
    <div class="offcanvas offcanvas-end" tabindex="-1" id="offcanvasCarrinho" aria-labelledby="offcanvasCarrinhoLabel">
        <div class="offcanvas-header">
            <h5 class="offcanvas-title" id="offcanvasCarrinhoLabel">Carrinho</h5>
            <button type="button" class="btn-close text-reset" data-bs-dismiss="offcanvas" aria-label="Close"></button>
        </div>
        <div class="offcanvas-body">
            <ul id="carrinhoItens" class="list-group">
                <!-- Itens do carrinho aparecerão aqui -->
            </ul>

            <div class="mt-3">
                <strong>Total: </strong> <span id="totalCarrinho">R$ 0,00</span>
            </div>

            <!-- Formulário para Dados do Usuário -->
            <form id="formCompra">
                <div class="mb-3">
                    <label for="nomeUsuario" class="form-label">Nome</label>
                    <input type="text" class="form-control" id="nomeUsuario" required>
                </div>
                <div class="mb-3">
                    <label for="emailUsuario" class="form-label">E-mail</label>
                    <input type="email" class="form-control" id="emailUsuario" required>
                </div>
                <div class="mb-3">
                    <label for="telefoneUsuario" class="form-label">Telefone</label>
                    <input type="email" class="form-control" id="telefoneUsuario" required>
                </div>
                <div class="mb-3">
                    <label for="enderecoUsuario" class="form-label">Endereço</label>
                    <input type="text" class="form-control" id="enderecoUsuario" required>
                </div>
               <button type="button" class="btn btn-primary" id="finalizarCompra" runat="server" OnClick="FinalizarCompra_Click">Finalizar Compra</button>

            </form>
        </div>
    </div>

    <script>
        document.addEventListener("DOMContentLoaded", function () {
            const botoesAdicionar = document.querySelectorAll('.add-to-cart');
            const carrinhoItens = document.getElementById('carrinhoItens');
            const totalCarrinho = document.getElementById('totalCarrinho');
            let total = 0;

            botoesAdicionar.forEach(botao => {
                botao.addEventListener('click', function () {
                    const nomeProduto = this.getAttribute('data-nome');
                    const precoProduto = parseFloat(this.getAttribute('data-preco'));

                    const itemCarrinho = document.createElement('li');
                    itemCarrinho.classList.add('list-group-item', 'd-flex', 'justify-content-between', 'align-items-center');
                    itemCarrinho.textContent = nomeProduto;

                    const precoSpan = document.createElement('span');
                    precoSpan.classList.add('badge', 'bg-primary', 'rounded-pill');
                    precoSpan.textContent = precoProduto.toLocaleString('pt-BR', { style: 'currency', currency: 'BRL' });
                    itemCarrinho.appendChild(precoSpan);

                    carrinhoItens.appendChild(itemCarrinho);

                    total += precoProduto;
                    totalCarrinho.textContent = total.toLocaleString('pt-BR', { style: 'currency', currency: 'BRL' });

                    const offcanvas = new bootstrap.Offcanvas(document.getElementById('offcanvasCarrinho'));
                    offcanvas.show();
                });
            });

            document.getElementById('finalizarCompra').addEventListener('click', function () {
                alert("Compra finalizada com sucesso!");
            });
        });
    </script>
   
</asp:Content>
