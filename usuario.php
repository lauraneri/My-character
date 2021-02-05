<?php
include_once "BancoDados.php";
class Usuario{
	public static function cadastrarUsuario($FotoPerfil,$Nome,$Sobrenome,$NomeUsuario,$descricao,$email,$senha,$Nome_Tipo){
		//Criar uma conexão para o banco de dados
		try{
				$conexao = BancoDados::getInstance()->getConnection();
		//Criar a SQL para executar
				$stmt = $conexao->prepare("INSERT INTO usuario(FotoPerfil,Nome,Sobrenome,NomeUsuario,descricao,email,senha,Nome_Tipo) VALUES (?,?,?,?,?,?,?,?)");
		//Executar
				$stmt->execute([$FotoPerfil,$Nome,$Sobrenome,$NomeUsuario,$descricao,$email,$senha,$Nome_Tipo]);
		//Checar o resultado
				$linhas_alteradas =$stmt->rowCount();
		//Fechar a conexão --- automático

			}catch(Exception $e){
				echo $e->getMessage();
				exit;
			}

			if($linhas_alteradas>0){
			return true;
		}
		else{
			return false;
		}

	}

	public static function AlterarFotoPerfil($id,$FotoPerfil){
		//Criar uma conexão para o banco de dados
		try{
				$conexao = BancoDados::getInstance()->getConnection();
		//Criar a SQL para executar
				$stmt = $conexao->prepare("UPDATE usuario SET  FotoPerfil ='$FotoPerfil' WHERE id='$id'");

		//Executar
				$stmt->execute();
		//Checar o resultado
				$linhas_alteradas =$stmt->rowCount();
		//Fechar a conexão --- automático

			}catch(Exception $e){
				echo $e->getMessage();
				exit;
			}

			if($linhas_alteradas>0){
			return true;
		}
		else{
			return false;
		}

	}
	public static function AlterarNomeUsuario($id,$descricao){
		try{
				$conexao = BancoDados::getInstance()->getConnection();
		//Criar a SQL para executar
				$stmt = $conexao->prepare("UPDATE usuario SET  descricao = '$descricao'  WHERE id='$id'");
		//Executar
				$stmt->execute();
		//Checar o resultado
				$linhas_alteradas =$stmt->rowCount();
		//Fechar a conexão --- automático

			}catch(Exception $e){
				echo $e->getMessage();
				exit;
			}

			if($linhas_alteradas>0){
			return true;
		}
		else{
			return false;
		}
	}
	public static function AlterarSenha($id,$senha){
		try{
				$conexao = BancoDados::getInstance()->getConnection();
		//Criar a SQL para executar
				$stmt = $conexao->prepare("UPDATE  usuario SET  senha = '$senha'  WHERE id='$id'");
		//Executar
				$stmt->execute();
		//Checar o resultado
				$linhas_alteradas =$stmt->rowCount();
		//Fechar a conexão --- automático

			}catch(Exception $e){
				echo $e->getMessage();
				exit;
			}

			if($linhas_alteradas>0){
			return true;
		}
		else{
			return false;
		}
	}
	public static function DeletarConta($id){
		try{
				$conexao = BancoDados::getInstance()->getConnection();
		//Criar a SQL para executar
				$stmt = $conexao->prepare("DELETE FROM usuario WHERE id = :id");
		//Executar
				$stmt->execute(['id' => $id]);
		//Checar o resultado
				$linhas_alteradas =$stmt->rowCount();
		//Fechar a conexão --- automático

			}catch(Exception $e){
				echo $e->getMessage();
				exit;
			}

			if($linhas_alteradas>0){
			return true;
		}
		else{
			return false;
		}
	}
}
?>