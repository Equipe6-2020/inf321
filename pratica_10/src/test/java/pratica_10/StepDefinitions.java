package pratica_10;

import io.cucumber.java.After;
import io.cucumber.java.Before;
import io.cucumber.java.en.Given;
import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;
import java.util.Map;
import java.util.concurrent.TimeUnit;
import java.util.function.Function;
import java.util.stream.Collectors;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.firefox.FirefoxDriver;
import static org.junit.Assert.*;

public class StepDefinitions {

    private StringBuffer verificationErrors = new StringBuffer();
    private WebDriver driver;

    @Before()
    public void before() {
        if (System.getProperty("os.name").startsWith("Windows")) {
            System.setProperty("webdriver.gecko.driver", "./src/test/resources/geckodriver.exe");
        } else {
            System.setProperty("webdriver.gecko.driver", "./src/test/resources/geckodriver");
        }

        driver = new FirefoxDriver();
        driver.manage().timeouts().implicitlyWait(30, TimeUnit.SECONDS);
        driver.get("http://multibags.1dt.com.br/shop");
    }

    @Given("the user accessed the following options:")
    public void the_user_accessed_the_following_options(io.cucumber.datatable.DataTable dataTable) {
        String linkText0 = dataTable.asList().get(0).trim();
        String linkText1 = dataTable.asList().get(1).trim();

        Map<String, WebElement> elementByText = driver.findElements(By.cssSelector(".usefull-link li a"))
                .stream()
                .collect(Collectors.toMap(element -> element.getAttribute("text").trim(), Function.identity()));

        driver.findElement(By.linkText(linkText0)).click();
        driver.manage().timeouts().implicitlyWait(2, TimeUnit.SECONDS);
        elementByText.get(linkText1).click();
    }

    @When("the user provides the following {string} and {string} pressing SIGN IN button")
    public void the_user_provides_the_following_and_pressing_sign_in_button(String email, String password) {
        driver.findElement(By.id("signin_userName")).click();
        driver.findElement(By.id("signin_userName")).clear();
        driver.findElement(By.id("signin_userName")).sendKeys(email);
        driver.findElement(By.id("signin_password")).clear();
        driver.findElement(By.id("signin_password")).sendKeys(password);
        driver.findElement(By.id("genericLogin-button")).click();
    }

    @Then("the following {string} shall be shown")
    public void the_following_message_shall_be_shown(String message) {
        String loginError = driver.findElement(By.id("loginError")).getText();
        assertEquals(message, loginError);
    }

    @After
    public void tearDown() throws Exception {
        driver.quit();
        String verificationErrorString = verificationErrors.toString();
        if (!"".equals(verificationErrorString)) {
            fail(verificationErrorString);
        }
    }

}
