#language:pt

@AllScenarios
Funcionalidade: Consulta de usuários

  @consultarUsuarios
  Cenario: Consultar todos os usuarios
    Quando enviar requisicao GET para o path /users
    Entao deve retornar o status code 200

  @consultarUsuarios
  Cenario: Consultar um usuario por id
    Dado que tenho um usuario
    Quando enviar requisicao POST para o path /users
    Quando enviar requisicao GET para o path /users/{id}
    Entao deve retornar o status code 200
    E deve retornar o contrato "getUserByID.json"