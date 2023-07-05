
import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertTrue;

import java.util.Arrays;
import java.util.Collection;

import org.junit.Test;
import org.junit.experimental.categories.Category;
import org.junit.runner.RunWith;
import org.junit.runners.Parameterized;
import org.junit.runners.Parameterized.Parameters;

@RunWith(Parameterized.class)
public class testUserData {

	private int userWeight, weightLimit;

	@Parameters
	public static Collection getParameters() {
		return Arrays.asList(new Object[][] { 
			{ 81, 80 }, { 180, 80 }, 
			{ 220, 80 }, { 95, 80 }, 
			{ 140, 80 } });
	} // closes getParamaters

	// constructor
	public testUserData(int userWeight, int weightLimit) {
		this.userWeight = userWeight;
		this.weightLimit = weightLimit;
	} // closes constructor

	@Test
	@Category(GroupTest1.class)
	// userWeight -> the weight entered by the user
	// weightLimit -> the entered weight can't be less than 80
	public void checkWeightTest() {
		UserData u1 = new UserData();
		assertEquals(true, u1.checkWeight(userWeight, weightLimit));
	}

}
