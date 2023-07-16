package reqres.test.poc.helpers;

import net.datafaker.Faker;

public class TransformData {


    public static Object transform(String value) {
        Faker faker = new Faker();

        switch (value) {
            case "":
                return "";
            case "null":
                return null;
            case "0":
                return 0;
            case "negativeNumber":
                return -1;
            case "floatNumber":
                return 1.0;
            case "5.generateNumbers":
                return Integer.valueOf(faker.number().digits(5));
            case "5.generateStringNumbers":
                return faker.number().digits(10);
            case "100.generateString":
                return faker.lorem().characters(100);
            case "true":
                return true;
            case "false":
                return false;
            default:
                return value;
        }
    }
}

