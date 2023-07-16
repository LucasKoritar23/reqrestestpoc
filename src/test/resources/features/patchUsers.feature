#language:pt

@AllScenarios
Funcionalidade: Edição de usuários

  @editarUsuario
  Cenario: Atualizar usuario com sucesso
    Dado que tenho um usuario
    E enviar requisicao POST para o path /users
    Quando enviar requisicao PATCH para o path /users/{id}
    Entao deve retornar o status code 200
    E deve retornar o contrato "patchUser.json"

  @validarPreenchimentosEditarUsuario
  Esquema do Cenário: Validar o preenhcimento do payload para o PATCH /users/{id}
    Dado que tenho um usuario
    E preencha no payload o campo <campo> com o valor "<valor>"
    Quando enviar requisicao PATCH para o path /users/{id}
    Entao deve retornar o status code <code>

    Exemplos:
      | campo | valor                       | code |
      | name  | 123                         | 200  |
      | name  | Gonçalves D'avó joão & você | 200  |
      | name  | aaaa                        | 200  |
      | name  |                             | 200  |
      | name  | null                        | 200  |
      | name  | 0                           | 200  |
      | name  | negativeNumber              | 200  |
      | name  | floatNumber                 | 200  |
      | name  | 5.generateNumbers           | 200  |
      | name  | 5.generateStringNumbers     | 200  |
      | name  | 100.generateString          | 200  |
      | name  | true                        | 200  |
      | name  | false                       | 200  |
      | job   | 123                         | 200  |
      | job   | aaaa                        | 200  |
      | job   |                             | 200  |
      | job   | null                        | 200  |
      | job   | 0                           | 200  |
      | job   | negativeNumber              | 200  |
      | job   | floatNumber                 | 200  |
      | job   | 5.generateNumbers           | 200  |
      | job   | 5.generateStringNumbers     | 200  |
      | job   | 100.generateString          | 200  |
      | job   | true                        | 200  |
      | job   | false                       | 200  |
