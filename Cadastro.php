<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title> Cadastro </title>
	<link rel="icon" type="image/png" href="fenix.png">
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
  <style type="text/css">
    #fonte{
      font-family: IM FELL English,Sitka Display;
      font-size:58px;
      float: left;
    }

  </style>
</head>
<body style="background-color: #efebe9;">
  <div class="formulario"></div>
	<div class="container" style="margin-top:37px;">
    <div class="row" style="margin-right:200px;">
      <div class="col">
        <img src="fenix.png" style="float: right;">
      </div>
      <div class="col-6">
          <p id="fonte">MyCharacter</p>
      </div>
    </div>
     <hr style="border-top: 1px solid black;">
     <br>
     <div class="row justify-content-md-center">
      <div class="col-md-auto">
        <div class="container">
          <div class="row">
            <div class="col">
              <form method="POST" enctype="multipart/form-data">
                  <div class="form-row">
                      <div class="col">
                        <input type="text" class="form-control" name="nome" placeholder="Nome">
                      </div>
                  </div>
                  <br>
                  <div class="form-row">
                      <div class="col">
                         <input type="text" class="form-control" name="sobrenome" placeholder="Sobrenome">
                      </div>
                  </div>
                  <br>
                  <div class="form-row">
                    <div class="col">
                       <input type="text" class="form-control" name="username" placeholder="Username">
                    </div>
                </div>
                <br>
                <div class="form-row">
                    <div class="col">
                       <input type="text" class="form-control" name="descricao" placeholder="Descrição">
                    </div>
                </div>
                <br>
              </div>
            <div class="col">
                  <div class="form-group row">
                    <div class="col-sm-10">
                      <input type="email" class="form-control" name="email" id="inputEmail3" placeholder="Email">
                    </div>
                  </div>
                  <div class="form-group row">
                    <div class="col-sm-10">
                      <input type="password" class="form-control" name="senha" id="inputPassword3" placeholder="Senha">
                    </div>
                  </div>
                <input type="file" name="arquivo" accept="image/png, image/jpeg">
              <button>Registrar-se</button>
            </form>
            <?php
            if(isset($_POST["nome"]) && isset($_POST["sobrenome"]) && isset($_POST["username"]) && isset($_POST["descricao"]) && isset($_POST["email"]) && isset($_POST["senha"]) && isset($_Files["arquivo"]["name"])){         
                if(empty($_POST["nome"]) || empty($_POST["sobrenome"]) || empty($_POST["username"]) || empty($_POST["descricao"]) || empty($_POST["email"]) || empty($_POST["senha"]) || empty($_FILES["arquivo"]["name"])){
                    echo "todos campos devem estar preenchidos";
                }
                else{
                  $nome =$_POST["nome"];
                  $sobrenome=$_POST["sobrenome"];
                  $username=$_POST["username"];
                  $descricao=$_POST["descricao"];
                  $email=$_POST["email"];
                  $senha=$_POST["senha"];
                  if ($_FILES['arquivo']['size'] >= 50 * 1024 * 1024) {
                    echo "<p>O arquivo enviado excede o tamanho máximo esperado!</p>";
                   
                  }
                  elseif($_FILES['file']['type'] != "image/jpeg") {
                      echo "<p>Arquivo com formato inválido</p>";
                     
                  }
                  else{
                    $extensao = pathinfo($_FILES['arquivo']['name'], PATHINFO_EXTENSION);
                    include_once "usuario.php";
                    $resultado=Usuario::cadastrarUsuario("file_get_contents('$extensao')",$nome,$sobrenome,$username,$descricao,$email,$senha,"Comum");
                    if($resultado){
                      echo "<p>cadastrado com sucesso </p>";
                    }
                    else{
                      echo "<p>NÃO foi cadastrado com sucesso </p>";
                    }
                  }

                }
            }
          ?>
            </div>
          </div>
      </div>
      <br>
    </div>
  </div>
</div>

</body>
</html>