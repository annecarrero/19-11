<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Cadastrar.aspx.cs" Inherits="cadastro.WebForm2" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Página de Cadastro</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;500;600&display=swap" rel="stylesheet">

    <style>
        *, *:before, *:after {
            padding: 0;
            margin: 0;
            box-sizing: border-box;
        }
        body {
            background-color: #080710;
        }
        .background {
            width: 430px;
            height: 520px;
            position: absolute;
            transform: translate(-50%, -50%);
            left: 50%;
            top: 50%;
        }
        .background .shape {
            height: 200px;
            width: 200px;
            position: absolute;
            border-radius: 50%;
        }
        .shape:first-child {
            background: linear-gradient(#1845ad, #23a2f6);
            left: -80px;
            top: -80px;
        }
        .shape:last-child {
            background: linear-gradient(to right, #bd4816, #f01976);
            right: -30px;
            bottom: -80px;
        }
        form {
            height: 520px;
            width: 400px;
            background-color: rgba(255,255,255,0.13);
            position: absolute;
            transform: translate(-50%, -50%);
            top: 50%;
            left: 50%;
            border-radius: 10px;
            backdrop-filter: blur(10px);
            border: 2px solid rgba(255,255,255,0.1);
            box-shadow: 0 0 40px rgba(8,7,16,0.6);
            padding: 50px 35px;
        }
        form * {
            font-family: 'Poppins', sans-serif;
            color: #ffffff;
            letter-spacing: 0.5px;
            outline: none;
            border: none;
        }
        form h3 {
            font-size: 32px;
            font-weight: 500;
            line-height: 42px;
            text-align: center;
        }
        label {
            display: block;
            margin-top: 30px;
            font-size: 16px;
            font-weight: 500;
        }
        input {
            display: block;
            height: 50px;
            width: 100%;
            background-color: rgba(255,255,255,0.07);
            border-radius: 3px;
            padding: 0 10px;
            margin-top: 8px;
            font-size: 14px;
            font-weight: 300;
        }
        ::placeholder {
            color: #e5e5e5;
        }
        .button-container {
            display: flex;
            justify-content: space-between;
            gap: 15px;
            margin-top: 50px;
        }
        .styled-button {
            width: 48%; /* Mesma largura para ambos os botões */
            background-color: #ffffff;
            color: #080710;
            padding: 15px 0;
            font-size: 18px;
            font-weight: 600;
            border-radius: 5px;
            cursor: pointer;
            text-align: center;
            transition: background-color 0.3s ease, color 0.3s ease;
        }
        .styled-button:hover {
            background-color: #ED297B;
            color: #ffffff;
        }
    </style>
</head>
<body>
    <div class="background">
        <div class="shape"></div>
        <div class="shape"></div>
    </div>
    <form id="form1" runat="server">
        <h3>CADASTRO</h3>

        <asp:Label ID="lblNome" runat="server" Text="Nome:"></asp:Label>
        <asp:TextBox ID="txtNome" runat="server" placeholder="Nome"></asp:TextBox>

        <asp:Label ID="lblEmail" runat="server" Text="Email:" style="margin-top: 20px;"></asp:Label>
        <asp:TextBox ID="txtEmail" runat="server" placeholder="Email"></asp:TextBox>

        <asp:Label ID="lblSenha" runat="server" Text="Senha:" style="margin-top: 20px;"></asp:Label>
        <asp:TextBox ID="txtSenha" runat="server" TextMode="Password" placeholder="Senha"></asp:TextBox>

        <div class="button-container">
            <asp:Button ID="btnCadastrar" runat="server" Text="Cadastrar" OnClick="btnCadastrar_Click" CssClass="styled-button" />
            <button type="button" onclick="window.location.href='inicio.aspx';" class="styled-button">Voltar</button>
        </div>

        <asp:Label ID="lblMensagem" runat="server" Text="" ForeColor="Red" style="display:block; margin-top: 20px;"></asp:Label>
    </form>
</body>
</html>
