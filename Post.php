<?php

include_once "BancoDados.php";
include_once "Publicacao.php";

Class Post extends Publicacao{
	public static function cadastrarPost($id_Post, $conteudo){
		//Criar uma conexão para o banco de dados
        try{
                $conexao = BancoDados::getInstance()->getConnection();
        //Criar a SQL para executar
                $stmt = $conexao->prepare("INSERT INTO post(id_Post, conteudo) VALUES (?, ?)");
        //Executar
                $stmt->execute([$id_Post, $conteudo]);
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

    public static function deletarPost($id_Post){
        //Criar uma conexão para o banco de dados
        try{
                $conexao = BancoDados::getInstance()->getConnection();
        //Criar a SQL para executar
                $stmt = $conexao->prepare("DELETE FROM post WHERE id_Post = :id");
        //Executar
                $stmt->execute(['id' => $id_Post]);
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