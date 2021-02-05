<?php
include_once "BancoDados.php";
include_once "Publicacao.php";
class Historia extends Publicacao{
	public static function CadastrarHistoria($id_historia,$capa,$titulo,$sinopse,$idadeIndicativa){
		
		//Criar uma conexão para o banco de dados
		try{
				$conexao = BancoDados::getInstance()->getConnection();
		//Criar a SQL para executar
				$stmt = $conexao->prepare("INSERT INTO historia(id_Historia,capa,titulo,sinopse,idadeIndicativa) VALUES (?,?,?,?,?)");
				
		//Executar
				$stmt->execute([$id_historia,$capa,$titulo,$sinopse,$idadeIndicativa]);
				
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
	public static function AlterarCapa($id,$capa){
		try{

				$conexao = BancoDados::getInstance()->getConnection();
		//Criar a SQL para executar
				$stmt = $conexao->prepare("UPDATE historia SET capa = '$capa' WHERE id_Historia='$id' ");
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
	public static function AlterarSinopse($id,$sinopse){
		try{
				$conexao = BancoDados::getInstance()->getConnection();
		//Criar a SQL para executar
				$stmt = $conexao->prepare("UPDATE historia SET sinopse = '$sinopse' WHERE id_Historia='$id'");
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
	public static function AlterarIdade($id,$idadeIndicativa){
		try{
				$conexao = BancoDados::getInstance()->getConnection();
		//Criar a SQL para executar
				$stmt = $conexao->prepare("UPDATE historia SET idadeIndicativa = '$idadeIndicativa' WHERE id_Historia='$id' ");
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
	public static function DeletarHistoria($id_historia){
		try{
				$conexao = BancoDados::getInstance()->getConnection();
		//Criar a SQL para executar
				$stmt = $conexao->prepare("DELETE FROM historia WHERE id_Historia = :id");
		//Executar
				$stmt->execute(['id' => $id_historia]);
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