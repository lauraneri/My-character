<?php
include_once "BancoDados.php";

class Genero{
	public static function PegarGeneros(){
		//Criar uma conexão para o banco de dados
		try{
				$conexao = BancoDados::getInstance()->getConnection();
		//Criar a SQL para executar
				$stmt = $conexao->prepare("SELECT nome FROM genero");
		//Executar
				$stmt->execute();
				foreach ($stmt as $linha) {
					echo $linha["nome"].", ";
				}
				
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