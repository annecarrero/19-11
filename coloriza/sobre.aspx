<%@ Page Title="" Language="C#" MasterPageFile="~/menu.Master" AutoEventWireup="true" CodeBehind="sobre.aspx.cs" Inherits="Coloriza.sobre" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<!DOCTYPE html>
<html lang="pt-BR">
      <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="styles.css">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Coloriza - Loja de Tintas Online</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <!-- Cabeçalho -->
    

    <!-- Banner principal -->
    <section class="banner">
        <div class="banner-content">
            <h2>Dê cor aos seus projetos com a Coloriza</h2>
            <p>As melhores tintas com a maior variedade de cores para todos os tipos de superfícies.</p>
            <a href="#" class="cta-button">Ver Produtos</a>
        </div>
    </section>

    <!-- Produtos em Destaque -->
    <section class="produtos">
        <h2>Produtos em Destaque</h2>
        <div class="grid-produtos">
            <div class="produto">
                <img src="vermelho1.jpg" alt="Tinta Premium">
                <h3>Tinta Premium</h3>
                <p>R$ 79,90</p>
            </div>
            <div class="produto">
                <img src="verde1.jpg" alt="Tinta Econômica">
                <h3>Tinta Econômica</h3>
                <p>R$ 49,90</p>
            </div>
            <div class="produto">
                <img src="roxo1.jpg" alt="Tinta Exterior">
                <h3>Tinta Exterior</h3>
                <p>R$ 89,90</p>
            </div>
            <div class="produto">
                <img src="azul1.jpg" alt="Tinta Interior">
                <h3>Tinta Interior</h3>
                <p>R$ 69,90</p>
            </div>
        </div>
    </section>

    <!-- Galeria de Cores -->
    <section class="galeria-cores">
        <h2>Galeria de Cores</h2>
        <div class="cores">
            <div class="cor" style="background-color: #FF5733;"></div>
            <div class="cor" style="background-color: #33FF57;"></div>
            <div class="cor" style="background-color: #3357FF;"></div>
            <div class="cor" style="background-color: #FF33A6;"></div>
            <div class="cor" style="background-color: #A633FF;"></div>
            <div class="cor" style="background-color: #FFFF33;"></div>
        </div>
    </section>

    <!-- Vantagens de Comprar na Coloriza -->
    <section class="vantagens">
        <h2>Por que escolher a Coloriza?</h2>
        <div class="vantagens-grid">
            <div class="vantagem">
                <h3>Qualidade Superior</h3>
                <p>Nossas tintas passam por rigorosos testes de qualidade para garantir o melhor desempenho.</p>
            </div>
            <div class="vantagem">
                <h3>Variedade de Cores</h3>
                <p>Encontre a cor perfeita com a nossa ampla paleta de cores exclusivas.</p>
            </div>
            <div class="vantagem">
                <h3>Entrega Rápida</h3>
                <p>Receba seu pedido no conforto de sua casa, com agilidade e segurança.</p>
            </div>
            <div class="vantagem">
                <h3>Atendimento Personalizado</h3>
                <p>Uma equipe de especialistas pronta para ajudar você a escolher a tinta ideal.</p>
            </div>
        </div>
    </section>
     
   
    <style>
        /* Reset básico */
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

/* Estilo geral da página */




/* Banner principal */
.banner {
    background-image: url('imga/fundo.png');
    background-size: cover;
    background-position: center;
    color: #000000;
    height: 400px;
    display: flex;
    align-items: center;
    justify-content: center;
    text-align: center;
}

.banner h2 {
    font-size: 36px;
    margin-bottom: 10px;
}

.banner p {
    font-size: 18px;
    margin-bottom: 20px;
}

.banner .cta-button {
    background-color: #ff5733;
    color: #fff;
    padding: 10px 20px;
    text-decoration: none;
    font-size: 18px;
    border-radius: 5px;
}

.banner .cta-button:hover {
    background-color: #e74c3c;
}

/* Produtos em Destaque */
.produtos {
    padding: 40px;
    background-color: #fff;
    text-align: center;
}

.produtos h2 {
    margin-bottom: 20px;
    font-size: 28px;
    color: #333;
}

.grid-produtos {
    display: grid;
    grid-template-columns: repeat(4, 1fr);
    gap: 20px;
}

.produto {
    background-color: #f4f4f4;
    padding: 20px;
    border-radius: 10px;
    text-align: center;
}

.produto img {
    max-width: 100%;
    border-radius: 10px;
}

.produto h3 {
    margin: 15px 0;
    font-size: 20px;
    color: #333;
}

.produto p {
    font-size: 18px;
    color: #ff5733;
    font-weight: bold;
}

/* Galeria de Cores */
.galeria-cores {
    padding: 40px;
    background-color: #f9f9f9;
    text-align: center;
}

.galeria-cores h2 {
    margin-bottom: 20px;
    font-size: 28px;
    color: #333;
}

.cores {
    display: flex;
    justify-content: center;
    gap: 15px;
}

.cor {
    width: 100px;
    height: 100px;
    border-radius: 50%;
    border: 2px solid #ccc;
}

/* Vantagens */
.vantagens {
    padding: 40px;
    background-color: #fff;
    text-align: center;
}

.vantagens h2 {
    margin-bottom: 20px;
    font-size: 28px;
    color: #333;
}

.vantagens-grid
{ display: grid; grid-template-columns: repeat(2, 1fr); gap: 20px; }

.vantagem { background-color: #f4f4f4; padding: 20px; border-radius: 10px; }

.vantagem h3 { margin-bottom: 15px; font-size: 22px; color: #333; }

.vantagem p { font-size: 16px; color: #555; }


    </style>
</body>
</html>

</asp:Content>
