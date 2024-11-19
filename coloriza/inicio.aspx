<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="inicio.aspx.cs" Inherits="cadastro.inicio" %>

<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>COLORIZA</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@700&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #000;
            color: #fff;
            margin: 0;
            padding: 0;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            min-height: 100vh;
            position: relative;
        }

        .logo {
            position: absolute;
            top: 20px;
            left: 20px;
            width: 150px; /* Defina o tamanho da logo conforme necessário */
        }

        h1 {
            font-family: 'Playfair Display', serif;
            font-size: 90px;
            margin-bottom: 5px; 
            text-transform: uppercase;
            color: #eee9e9;
        }

        h4 {
            font-size: 24px;
            margin-bottom: 5px; 
            color: #eee9e9;
        }

        p {
            font-family: 'Courier New', serif;
            font-size: 18px;
            line-height: 1.4;
            margin-bottom: 30px;
        }

        .button-container {
            display: flex;
            gap: 20px;
        }

        button {
            padding: 15px 30px;
            border: 2px solid #fff;
            background-color: transparent;
            color: #fff;
            font-size: 16px;
            cursor: pointer;
            transition: all 0.3s ease;
        }

        button:hover {
            background-color: #ED297B;
            border-color: #D18B82;
        }

        .button-container a {
            text-decoration: none; 
        }
    </style>
</head>
<body>

    <img class="logo" src="~/images/logo.png" alt="Coloriza Logo">

    <h1>COLORIZA</h1>
    <h4>SUA CASA COM MAIS VIDA, SÓ NA COLORIZA</h4>     
    <p>Encontre a cor perfeita para suas ideias brilharem.</p>

    <div class="button-container">
        <button style="background-color: #ED297B; border-color: #D18B82;">NÃO SABE POR ONDE COMEÇAR?</button>
        <a href="Login.aspx"> <button>LOGIN</button></a>
         <a href="Cadastrar.aspx"> <button>CADASTRO</button></a>
    </div>

</body>
</html>
