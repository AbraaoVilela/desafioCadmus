Dado('que realizo a request para buscar o usuário') do
  
end

Quando('envio a busca para o usuário Naik') do
  
end

Então('é mostrado os dados do usuário') do
  
end



Dado('que realizo a busca na lista de todos os usuarios') do
  @id = @page.(Usuarios).pegarUsuarios 
end

Quando('busco o primeiro ID da lista dos usuarios') do
  @responsePrimeiroId = @page.(Usuarios).pegarPrimeiroUsuario(@id)
end

Então('valido os detalher do usuario') do
  @page = @page.(Usuarios).verificarOsDetalhesDoUsuario(@usuarioNaik)
end

Dado('que realizo a request para criar o usuário') do
  @payload = @page.(Usuarios).formatarJsonUsuario
end

Quando('envio a request para criação do usuário') do
  @criacaoUsuario = @page.(Usuarios).createUsuario(@payload)
end

Então('a criação do novo usuário é realizada com sucesso') do
 @page = @page.(Usuarios).verificarOsDetalhesDoUsuario(@criacaoUsuario)
end

Dado('que realizo a request para atualizar o usuário') do
   steps %{
    Dado que realizo a request para criar o usuário
    Quando envio a request para criação do usuário
   }
   @payloadAtualizarUsuario = @page.(Usuarios).formatarJsonUsuario

end

Quando('envio a request para atualizar o usuário') do
  @atualizarUsuario = @page.(Usuarios).atualizarUsuario(@criacaoUsuario, @payloadAtualizarUsuario)
end

Então('meu usuário é atualizado com sucesso') do
 @page.(Usuarios).atualzarUsuarioComSucesso(@atualizarUsuario)
end

Dado('que realizo a request para deletar o usuário') do
  steps %{
    Dado que realizo a request para criar o usuário
    Quando envio a request para criação do usuário
}
end

Quando('envio a request para deletar o usuário') do
 @usuarioDeletado = @page.(Usuarios).deletarUsuario(@usuarioCriado)
end

Então('valido que o usuário é deletado com sucesso') do
  @page.(Usuarios).deletarUsuarioComSucesso(@usuarioDeletado)
end