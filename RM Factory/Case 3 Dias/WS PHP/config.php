<?php 
/**
* Parâmetros de configuração com banco de dados
*
*
* @author Rodrigo Carreiro Mourão
* @link http://www.rmfactory.com.br
* 
*	HOSPEDE SEUS WEBSERVICES PARA MOBILE COM A RM FACTORY, 
*   A PARTIR DE R$ 19,90 COM BANCO DE DADOS MYSQL NA NUVEM INCLUIDO
*
* @version 1.0
* @package Hotel Mobile
*/

//  Configurações do Script
// ==============================
$_SG['conectaServidor'] = true;    // Abre uma conexão com o servidor MySQL?
$_SG['abreSessao'] = true;         // Inicia a sessão com um session_start()?
$_SG['caseSensitive'] = false;     // Usar case-sensitive? Onde 'thiago' é diferente de 'THIAGO'
$_SG['validaSempre'] = true;       // Deseja validar o usuário e a senha a cada carregamento de página?
                                   // Evita que, ao mudar os dados do usuário no banco de dado o mesmo contiue logado.

$_SG['servidor'] = "mysql.rmfactory.com.br";    // Servidor MySQL
$_SG['usuario'] = "rmfactory";                // Usuário MySQL
$_SG['senha'] = "123456";                     // Senha MySQL
$_SG['banco'] = "rmfactory";                  // Banco de dados MySQL

$_SG['paginaLogin'] = 'login.php'; // Página de login
$_SG['tabela'] = 'user';       // Nome da tabela onde os usuários são salvos


// Verifica se precisa fazer a conexão com o MySQL
if ($_SG['conectaServidor'] == true) {
  $_SG['link'] = mysql_connect($_SG['servidor'], $_SG['usuario'], $_SG['senha']) or die("MySQL: Não foi possível conectar-se ao servidor [".$_SG['servidor']."].");
  mysql_select_db($_SG['banco'], $_SG['link']) or die("MySQL: Não foi possível conectar-se ao banco de dados [".$_SG['banco']."].");
}

// Verifica se precisa iniciar a sessão
if ($_SG['abreSessao'] == true) {session_start();}

/**
	* Função que valida um usuário e senha
	*
	* @param string $usuario - O usuário a ser validado
	* @param string $senha - A senha a ser validada 
	*
	* @return bool - Se o usuário foi validado ou não (true/false)
	*/
	function validaUsuario($usuario, $senha) {
	  global $_SG;

	  $cS = ($_SG['caseSensitive']) ? 'BINARY' : '';

	  $nusuario = addslashes($usuario);
	  $nsenha = addslashes($senha);

	  $sql = "SELECT `userid`, `login`, `senha` FROM `".$_SG['tabela']."` WHERE ".$cS." `login` = '".$nusuario."' AND ".$cS." `senha` = '".$nsenha."' LIMIT 1";
	  $query = mysql_query($sql);
	  $resultado = mysql_fetch_assoc($query);

	  if (empty($resultado)) {
		return 0;
	  } else {
		$_SESSION['usuarioID'] = $resultado['userid']; // Pega o valor da coluna 'id' do registro encontrado no MySQL
		$_SESSION['usuarioLogin'] = $resultado['login']; // Pega o valor da coluna 'login' do registro encontrado no MySQL

		if ($_SG['validaSempre'] == true) {
		  $_SESSION['usuarioLogin'] = $usuario;
		  $_SESSION['usuarioSenha'] = $senha;
		}

		return $resultado[userid];
	  }
	}
	
	
/**
* Função que requer autencicação para acesso ao script
*/
function needAuth() {
  global $_SG;

  if (!isset($_SESSION['usuarioID']) OR !isset($_SESSION['usuarioLogin'])) {
	return false;
  } elseif ($_SG['validaSempre'] == true) {
    if (!validaUsuario($_SESSION['usuarioLogin'], $_SESSION['usuarioSenha'])) {
			return false;
		}else{ 
			return true;
		}
    }else{
		return true;
	}
}

/**
* Função para desfazer autenticação
*/
function UnAuthAcess() {
  global $_SG;

  unset($_SESSION['usuarioID'], $_SESSION['usuarioLogin'], $_SESSION['usuarioSenha']);
  $object = new stdclass();
  $object->result =  ERR_900;
  echo json_encode($object);  
}

  /*
    Código de retorno dos métodos em caso de erro
	1xx Erros de Login
	2xx Erros de Hotel
	3xx Erros de Status
	4xx Erros de Reservas
	9xx Erros genericos
  */
  define('ERR_100', '0100');  //usuário não localizado
  define('ERR_101', '0101');  //senha inválida  
  define('ERR_102', '0102');  //usuário bloqueado
  
  define('ERR_900','Unauthorized You do not have permission to view this directory or page using the credentials that you supplied');
    
?>