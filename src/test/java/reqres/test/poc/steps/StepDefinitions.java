package reqres.test.poc.steps;

import io.cucumber.java.pt.Dado;
import io.cucumber.java.pt.E;
import io.cucumber.java.pt.Entao;
import io.cucumber.java.pt.Quando;
import io.qameta.allure.restassured.AllureRestAssured;
import io.restassured.builder.RequestSpecBuilder;
import io.restassured.http.ContentType;
import io.restassured.http.Method;
import io.restassured.module.jsv.JsonSchemaValidator;
import io.restassured.response.Response;
import io.restassured.specification.RequestSpecification;
import org.testng.Assert;
import reqres.test.poc.payloads.Usuario;
import net.datafaker.Faker;

import static io.restassured.RestAssured.given;
import static reqres.test.poc.helpers.TransformData.transform;

public class StepDefinitions {

    Response response;
    RequestSpecification requestSpec = new RequestSpecBuilder().build();
    Usuario usuario = new Usuario();
    Faker faker = new Faker();

    @Dado("que tenho um usuario")
    public void queTenhoUmUsuario() {
        requestSpec.body(usuario);
    }

    @Quando("enviar requisicao {} para o path {word}")
    public void enviarRequisicaoGetParaOPathUsers(Method method, String path) {
        requestSpec.baseUri("https://reqres.in/api/");

        if (path.equalsIgnoreCase("/users/{id}")) {
            // como a API não realiza a persistência de dados, inserindo um ID fixo
            // requestSpec.pathParam("id", response.jsonPath().get("id"));
            requestSpec.pathParam("id", "1");
        }

        if (method.equals(Method.PATCH)) {
            usuario.setName(faker.name().fullName() + " edited");
            usuario.setJob(faker.job().position() + " edited");
            requestSpec.body(usuario);
        }

        response = given()
                .spec(requestSpec)
                .contentType(ContentType.JSON)
                .filter(new AllureRestAssured())
                .log().all()
                .when()
                .request(method, path)
                .then()
                .log().all()
                .extract()
                .response();

    }

    @E("preencha no payload o campo {word} com o valor {string}")
    public void variarPayloadParaUsers(String campo, String valor) {
        if (campo.equalsIgnoreCase("name")) {
            usuario.setName(transform(valor));
        } else if (campo.equalsIgnoreCase("job")) {
            usuario.setJob(transform(valor));
        }
        requestSpec.body(usuario);
    }

    @Entao("deve retornar o status code {int}")
    public void deveRetornarStatusCodeX(int statusCode) {
        Assert.assertEquals(response.getStatusCode(), statusCode);
    }

    @Entao("o ID deve ser o inserido no path")
    public void deveRetornarIDInseridoNoPath() {
        int id = response.jsonPath().getInt("data.id");
        Assert.assertEquals(id, 1, "O valor do campo 'id' não é igual a 1");
    }

    @E("deve retornar o contrato {string}")
    public void deveRetornarOContratoEsperado(String schema) {
        response.then().body(JsonSchemaValidator.matchesJsonSchemaInClasspath("schemas/" + schema));
    }
}


