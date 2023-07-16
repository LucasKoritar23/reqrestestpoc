#language:pt

@AllScenarios
Funcionalidade: Deleção de usuários

  @deletarUsuario
  Cenario: Deletar usuario com sucesso
    Dado que tenho um usuario
    Quando enviar requisicao DELETE para o path /users/{id}
    Entao deve retornar o status code 204