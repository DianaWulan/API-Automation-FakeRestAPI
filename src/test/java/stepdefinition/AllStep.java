package stepdefinition;

import io.cucumber.java.en.And;
import io.cucumber.java.en.Given;
import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;
import pages.AllPage;

public class AllStep {
    private AllPage activityPage = new AllPage();

    @Given("the basefakerest URL is {string}")
    public void theBasefakerestURLIs(String url) {
        activityPage.toBaseUrl(url);
    }

    @When("I send a {} request to {} with body {}")
    public void iSendARequestToWithBody(String methodeAPI, String endpoint, String body) {
        activityPage.caseMethode(methodeAPI, endpoint, body);
    }

    @Then("the response status code is {int}")
    public void theResponseStatusCodeIs(Integer statusCode) {
        activityPage.validateStatusCode(statusCode);
    }

    @And("the response output should contain {} is {}")
    public void theResponseOutputShouldContainIs(String key, String value) {
        activityPage.validateKeyValueResponse(key, value);
    }
}
