<?php

include_once "BancoDados.php";
include_once "Publicacao.php";

Class Personagem extends Publicacao{
	public static function CadastrarPersonagem($nome, $fotoPerfil, $descricao){
		//Criar uma conexão para o banco de dados
        try{
                $conexao = BancoDados::getInstance()->getConnection();
        //Criar a SQL para executar
                $stmt = $conexao->prepare("INSERT INTO Personagem(Nome, FotoPerfil, Descricao) VALUES (?, ?, ?)");
        //Executar
                $stmt->execute([$nome, $fotoPerfil, $descricao]);
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

    public static function DeletarPersonagem($id){
        try{
                $conexao = BancoDados::getInstance()->getConnection();
        //Criar a SQL para executar
                $stmt = $conexao->prepare("DELETE FROM personagem WHERE id = :id");
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

    public static function AlterarNomePersonagem($id, $nome){
        try{
                $conexao = BancoDados::getInstance()->getConnection();
        //Criar a SQL para executar
                $stmt = $conexao->prepare("UPDATE personagem SET  nome = '$nome'  WHERE id='$id'");
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

    public static function AlterarFotoPerfilPersonagem($id, $FotoPerfil){
        //Criar uma conexão para o banco de dados
        try{
                $conexao = BancoDados::getInstance()->getConnection();
        //Criar a SQL para executar
                $stmt = $conexao->prepare("UPDATE personagem SET  FotoPerfil ='$FotoPerfil' WHERE id='$id'");

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

    public static function AlterarDescricaoPersonagem($id, $descricao){
        try{
                $conexao = BancoDados::getInstance()->getConnection();
        //Criar a SQL para executar
                $stmt = $conexao->prepare("UPDATE personagem SET  descricao = '$descricao'  WHERE id='$id'");
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
}

?>