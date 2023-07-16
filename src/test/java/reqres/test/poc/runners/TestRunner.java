package reqres.test.poc.runners;

import io.cucumber.testng.AbstractTestNGCucumberTests;
import io.cucumber.testng.CucumberOptions;
import org.testng.annotations.DataProvider;

@CucumberOptions(
        tags = "@AllScenarios",
        features = {"src/test/resources/features/"},
        glue = {"classpath:reqres/test/poc"},
        snippets = CucumberOptions.SnippetType.CAMELCASE,
        plugin = {
                "rerun:target/rerun/failed_scenarios.txt", //Cria um arquivo txt com os cenários que falharam
                "io.qameta.allure.cucumber7jvm.AllureCucumber7Jvm", // Estrutura para o allure
        })
public class TestRunner extends AbstractTestNGCucumberTests {
    @Override
    @DataProvider(parallel = true) // seta o paralelismo
    public Object[][] scenarios() {
        return super.scenarios();
    }
}
