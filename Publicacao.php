<?php

include_once "BancoDados.php";

abstract class Publicacao{
	public static function CadastrarPublicacao($id_usuario){


		//Criar uma conexão para o banco de dados
        try{
                $conexao = BancoDados::getInstance()->getConnection();
        //Criar a SQL para executar
                $stmt = $conexao->prepare("INSERT INTO publicacao(id_usuario, DataHora) VALUES (?, CURRENT_TIMESTAMP)");
        //Executar
                $stmt->execute([$id_usuario]);
        //Checar o resultado
                $linhas_alteradas =$stmt->rowCount();
        //Fechar a conexão --- automático
                
              
            }catch(Exception $e){
                echo $e->getMessage();
                exit;
            }

            if($linhas_alteradas>0){
            return true;
            $id_pub = $conexao->prepare("SELECT id FROM publicacao ");
            print('<h1>'.$id_pub.'</h1>');
        }
        else{
            return false;
        }
	}
}

?>