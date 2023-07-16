package reqres.test.poc.payloads;

import lombok.Getter;
import lombok.Setter;
import net.datafaker.Faker;

@Getter
@Setter
public class Usuario {
    Object name, job;

    public Usuario() {
        Faker faker = new Faker();
        this.name = faker.name().fullName();
        this.job = faker.job().position();
    }
}
