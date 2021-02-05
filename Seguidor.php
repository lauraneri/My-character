<?php 
include_once "BancoDados.php";
class Seguidor{
	public static function Seguir($id){
		try{
				$conexao = BancoDados::getInstance()->getConnection();
		//Criar a SQL para executar
				$stmt = $conexao->prepare("INSERT INTO seguidor(id_usuario) VALUES (?)");
		//Executar
				$stmt->execute([$id]);
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
	public static function Unfollow($id){
		try{ 
		$conexao = BancoDados::getInstance()->getConnection();
		//Criar a SQL para executar
				$stmt = $conexao->prepare("DELETE FROM seguidor WHERE id_usuario= :id");
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