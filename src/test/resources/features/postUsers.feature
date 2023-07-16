#language:pt

@AllScenarios
Funcionalidade: Cadastro de usuários

  @cadastrarUsuario
  Cenario: Cadastrar usuario com sucesso
    Dado que tenho um usuario
    Quando enviar requisicao POST para o path /users
    Entao deve retornar o status code 201
    E deve retornar o contrato "postUser.json"

  @validarPreenchimentosCadastroUsuario
  Esquema do Cenário: Validar o preenhcimento do payload para o POST /users
    Dado que tenho um usuario
    E preencha no payload o campo <campo> com o valor "<valor>"
    Quando enviar requisicao POST para o path /users
    Entao deve retornar o status code <code>

    Exemplos:
      | campo | valor                       | code |
      | name  | 123                         | 201  |
      | name  | Gonçalves D'avó joão & você | 201  |
      | name  | aaaa                        | 201  |
      | name  |                             | 201  |
      | name  | null                        | 201  |
      | name  | 0                           | 201  |
      | name  | negativeNumber              | 201  |
      | name  | floatNumber                 | 201  |
      | name  | 5.generateNumbers           | 201  |
      | name  | 5.generateStringNumbers     | 201  |
      | name  | 100.generateString          | 201  |
      | name  | true                        | 201  |
      | name  | false                       | 201  |
      | job   | 123                         | 201  |
      | job   | aaaa                        | 201  |
      | job   |                             | 201  |
      | job   | null                        | 201  |
      | job   | 0                           | 201  |
      | job   | negativeNumber              | 201  |
      | job   | floatNumber                 | 201  |
      | job   | 5.generateNumbers           | 201  |
      | job   | 5.generateStringNumbers     | 201  |
      | job   | 100.generateString          | 201  |
      | job   | true                        | 201  |
      | job   | false                       | 201  |