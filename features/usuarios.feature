#language: pt
#utf-8


Funcionalidade: Usuarios

@usuario_Naik
Cenário: Buscar Com Sucesso O Usuario 
    Dado que realize a request para buscar o usuário
    Quando envio a busca para o usuário Naik
    Então é mostrado os dados do usuário
