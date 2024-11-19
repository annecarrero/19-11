<%@ Page Title="Página Inicial" Language="C#" MasterPageFile="~/menu.Master" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="Coloriza.index" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <!-- Adicionando links para novos estilos e fontes -->
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="styles.css">
    <style>
        /* Estilo para garantir que os cards do catálogo tenham a mesma altura */
        .catalog .card {
            height: 100%;
        }

        .catalog .card-img-top {
            height: 200px; /* Ajuste a altura conforme necessário */
            object-fit: cover; /* Garante que a imagem preencha o espaço corretamente */
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <!-- Seção de Carrossel -->
    <div id="myCarousel" class="carousel slide" data-ride="carousel">
        <ol class="carousel-indicators">
            <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
            <li data-target="#myCarousel" data-slide-to="1"></li>
            <li data-target="#myCarousel" data-slide-to="2"></li>
        </ol>
        <div class="carousel-inner">
            <div class="carousel-item active">
                <img src="img/1.png" alt="Chania" class="d-block w-100">
                <div class="carousel-caption d-none d-md-block">
                    <h5>Transforme Seus Espaços</h5>
                    <p>Encontre a cor perfeita para cada ambiente.</p>
                </div>
            </div>
            <div class="carousel-item">
                <img src="img/2.png" alt="Chicago" class="d-block w-100">
                <div class="carousel-caption d-none d-md-block">
                    <h5>Qualidade e Variedade</h5>
                    <p>Explore nossa ampla gama de tintas.</p>
                </div>
            </div>
            <div class="carousel-item">
                <img src="img/3.png" alt="New York" class="d-block w-100">
                <div class="carousel-caption d-none d-md-block">
                    <h5>Cores que Inspiram</h5>
                    <p>Encontre a inspiração para seu próximo projeto.</p>
                </div>
            </div>
        </div>
        <a class="carousel-control-prev" href="#myCarousel" role="button" data-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
        </a>
        <a class="carousel-control-next" href="#myCarousel" role="button" data-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
        </a>
    </div>

    <!-- Seção Sobre Nós -->
    <section class="about-us text-center py-5">
        <div class="container">
            <h1 class="display-4">Sobre Nós</h1>
            <p class="lead">Bem-vindo à Coloriza, sua loja online de tintas. Oferecemos uma vasta gama de tintas e acessórios, com qualidade e um atendimento ao cliente excepcional.</p>
        </div>
    </section>

    <!-- Seção Catálogo -->
    <section class="catalog py-5">
        <div class="container">
            <h2 class="text-center mb-4">Nossas Cores</h2>
            <div class="row">
                <article class="col-md-4 mb-4">
                    <div class="card shadow-sm">
                        <img src="img/azul.jpg" class="card-img-top" alt="Cor Azul">
                        <div class="card-body">
                            <h5 class="card-title">Cor Azul</h5>
                            <p class="card-text">Ideal para criar ambientes calmos e relaxantes.</p>
                        </div>
                    </div>
                </article>
                <article class="col-md-4 mb-4">
                    <div class="card shadow-sm">
                        <img src="img/vermelho.jpg" class="card-img-top" alt="Cor Vermelha">
                        <div class="card-body">
                            <h5 class="card-title">Cor Vermelha</h5>
                            <p class="card-text">Perfeita para adicionar energia e vibração aos espaços.</p>
                        </div>
                    </div>
                </article>
                <article class="col-md-4 mb-4">
                    <div class="card shadow-sm">
                        <img src="img/verde_resized (1).jpg" class="card-img-top" alt="Cor Verde">
                        <div class="card-body">
                            <h5 class="card-title">Cor Verde</h5>
                            <p class="card-text">Ideal para decorações com temas naturais.</p>
                        </div>
                    </div>
                </article>
            </div>
        </div>
    </section>

    <!-- Seção Filosofia -->
    <section class="philosophy py-5 bg-light">
        <div class="container">
            <div class="row">
                <div class="col-md-6">
                    <h2>Nossa Filosofia</h2>
                    <p>Acreditamos que cada cor tem o poder de transformar ambientes e despertar emoções. Nossa missão é oferecer uma seleção curada de tintas de alta qualidade, garantindo que cada projeto se torne uma expressão única de criatividade e estilo.</p>
                </div>
                <div class="col-md-6">
                    <h2>Compromisso com a Qualidade</h2>
                    <p>Oferecemos apenas produtos das melhores marcas e com a tecnologia mais avançada, assegurando durabilidade e excelência. Trabalhamos com práticas sustentáveis para minimizar nosso impacto ambiental e promover um futuro mais verde.</p>
                    <h2>Atendimento Personalizado</h2>
                    <p>Cada cliente é único, e nossa equipe está sempre disponível para oferecer suporte especializado e recomendações personalizadas. Estamos aqui para tornar sua experiência de compra inesquecível.</p>
                </div>
            </div>
        </div>
    </section>

    <!-- Scripts -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</asp:Content>
