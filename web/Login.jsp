<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <link rel="stylesheet" href="CSS/EstilosLogin.css">
    <link rel="icon" href="Imagenes/PeruBus.png"/>
</head>
<body>
    <div class="login-box"> <!--Div contenedor del Login-->
        <img class="avatar" src="Imagenes/PeruBus.png" alt="Logo">
        <h1>Inicio de sesión</h1><br>
        <form action="controladorLogin" method="post">
            <!--Usuario-->
            <label for="username">Usuario <img class="icon-user" src="Imagenes/Icon-User.png"/> </label> 
            <input type="text" id="username" name="username" placeholder="Ingresar usuario">

            <!--Contraseña-->
            <label for="password">Contraseña <img class="icon-password" src="Imagenes/Icon-Password.png"/></label>
            <input type="password" id="password" name="password" placeholder="Ingresar contraseña">
            <br><br>
            <input class="Login" type="submit" value="Iniciar Sesión">
            <a href="#" class= Pregunta>¿Olvidaste tu contraseña?</href></a><br>
        </form>
    </div>
</body>
</html>