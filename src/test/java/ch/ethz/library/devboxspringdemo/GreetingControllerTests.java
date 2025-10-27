package ch.ethz.library.devboxspringdemo;

import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.web.servlet.client.RestTestClient;

import static org.assertj.core.api.AssertionsForClassTypes.assertThat;

@SpringBootTest
public class GreetingControllerTests {

    RestTestClient client =
            RestTestClient.bindToController(new GreetingController()).build();

    @Test
    public void noParamGreetingShouldReturnDefaultMessage() throws Exception {
        client.get().uri("/greeting")
                .exchange()
                .expectStatus().isOk()
                .expectBody(Greeting.class)
                .consumeWith(result -> {
                    assertThat(result.getResponseBody().content())
                        .isEqualTo("Hello, World!");
                });
    }

    @Test
    public void paramGreetingShouldReturnTailoredMessage() throws Exception {

        client.get().uri("/greeting?name=Spring Community")
                .exchange()
                .expectStatus().isOk()
                .expectBody(Greeting.class)
                .consumeWith(result -> {
                    assertThat(result.getResponseBody().content())
                        .isEqualTo("Hello, Spring Community!");
                });
    }

}