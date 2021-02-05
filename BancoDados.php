<?php


class BancoDados {//classe sington para fazer a conexão com o banco de dados
  private static $instance = null;
  private $conn;
  // necessário quatro elementos para se conectar com o banco de de dado:
  private $host = 'localhost';//----Host->Onde 
  private $user = '******';//---Usuario--
  private $pass = '******';//--Senha-- 
  private $dbname = 'id16062462_mychara';//nome do banco id16062462_mychara
  //construtor 
  private function __construct() {
    $opcoes = [
        PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
        PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,
        PDO::ATTR_EMULATE_PREPARES => false
    ];
    try {//try->tenta realizar os comandos
        $linha = "mysql:host=" . $this->host . ";dbname=" . $this->dbname;
        $this->conn = new PDO($linha, $this->user, $this->pass, $opcoes);
    } catch (Exception $e) {//catch-> se algo deu errado no try o catch executa outra coisa//
        echo $e->getMessage();
        exit;//exit cancela o php fechando-o e não executa mais nada
    }
  }
  
  public static function getInstance() {
    if(!self::$instance){
      self::$instance = new BancoDados();
    }
   
    return self::$instance;
  }
  
  public function getConnection() {
    return $this->conn;
  }
}
?>