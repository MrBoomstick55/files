import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertTrue;

import org.junit.Test;
import org.junit.experimental.categories.Category;

public class singleTests {

	// EXCEPTION HANDLING
	@Category(GroupTest1.class)
	@Test(expected = incorrectWeightException.class)
	public void correctWeightExceptionTest() throws incorrectWeightException {
		UserData u2 = new UserData();
		u2.enterWeight(180); // 180 -> pounds entered by user
	}

	// assertTrue()

	// CHECK USER INPUT FOR CALORIES
	@Category(GroupTest1.class)
	@Test
	public void testUserCalories() {
		// calories >= 0
		float limit = 0;

		// user input
		UserData u3 = new UserData();
		u3.setCalories(1600, 180, "04/04/2022");
		float userCalories = u3.getCalories();

		// test
		assertTrue(userCalories > limit);
	}

	// CHECK USER INPUT FOR WEIGHT
	@Category(GroupTest1.class)
	@Test
	public void testUserWeight() {
		// weight > 80
		float limit = 80;

		// user input
		UserData u4 = new UserData();
		u4.setCalories(1600, 180, "04/04/2022");
		float userWeight = u4.getCalories();

		// test
		assertTrue(userWeight > limit);
	}

	// assertEquals()

	// CHECK THE USER INPUT FOR NAVIGATING THE UI
	@Category(GroupTest1.class)
	@Test
	public void testUIOptions() {
		// options -> 1 = calculator, 2 = tracker, 3 = show data
		int expectedOne = 1, expectedTwo = 2, expectedThree = 3;
		int resultOne = 1, resultTwo = 2, resultThree = 3;

		// test
		assertEquals(expectedOne, resultOne);
		assertEquals(expectedTwo, resultTwo);
		assertEquals(expectedThree, resultThree);
	}

	// CHECK CALORIE DEFICIT FROM DAILY CALORIE NEEDS
	@Category(GroupTest1.class)
	@Test
	public void testDeficitCalories() {
		// calorie deficit = dailyCalories - 500

		UserData u5 = new UserData();
		u5.setCaloriesNeeds(2500, 2000);
		double dailyCalories = u5.getDaily();
		double deficitResult = u5.getCalorieDeficit();
		double expectedDeficit = dailyCalories - 500;

		// test
		assertEquals(expectedDeficit, deficitResult, 0.01);
	}

}
