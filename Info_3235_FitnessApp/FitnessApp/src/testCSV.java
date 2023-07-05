import static org.junit.Assert.assertTrue;
import org.junit.jupiter.params.ParameterizedTest;
import org.junit.jupiter.params.provider.CsvFileSource;

public class testCSV {

	@ParameterizedTest
	@CsvFileSource(resources = "/calorieTest.csv", numLinesToSkip = 1)
	void testCaloriesCSV(int userCalories, int calorieLimit) {
		assertTrue(userCalories > calorieLimit);
	}
}
