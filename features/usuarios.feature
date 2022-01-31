#language: pt
#utf-8


Funcionalidade: Usuarios

@usuario_Naik
Cenário: Buscar Com Sucesso O Usuario 
    Dado que realizo a request para buscar o usuário
    Quando envio a busca para o usuário Naik
    Então é mostrado os dados do usuário

@primeiroId
Cenário: Validar ID Do Usuario Encontrado
    Dado que realizo a busca na lista de todos os usuarios
    Quando busco o primeiro ID da lista dos usuarios
    Então valido os detalher do usuario

@criacaoUsuarios
Cenário: Criar Novo Usuário Com Sucesso
    Dado que realizo a request para criar o usuário
    Quando envio a request para criação do usuário
    Então a criação do novo usuário é realizada com sucesso

@atualizarUsuario
Cenário: Fazer A Atualização Do Usuário Com Sucesso
    Dado que realizo a request para atualizar o usuário
    Quando envio a request para atualizar o usuário
    Então meu usuário é atualizado com sucesso

@deletarUsuario
    Dado que realizo a request para deletar o usuário
    Quando envio a request para deletar o usuário
    Então valido que o usuário é deletado com sucesso
    
