
public class UserData {

	float userCalories, weight;
	double daily, calorieDeficit;
	String date;

	// data setter method - track data
	public void setCalories(float userCalories, float weight, String date) {
		this.userCalories = userCalories;
		this.weight = weight;
		this.date = date;
	}

	// data setter method - daily calorie needs/calorie deficit
	public void setCaloriesNeeds(double daily, double calorieDeficit) {
		this.daily = daily;
		this.calorieDeficit = calorieDeficit;
	}

	// data getter method - show data
	public float getCalories() {
		return userCalories;
	}

	public float getWeight() {
		return weight;
	}

	public String getDate() {
		return date;
	}

	// CALCULATOR VALUES
	public double getDaily() {
		return daily;
	}

	public double getCalorieDeficit() {
		return calorieDeficit;
	}

	// ------------------- TEST ------------------------------------

	// boolean function - is the userWeight > 80
	boolean checkWeight(int userWeight, int weightLimit) {
		if (userWeight > 80) {
			return true;
		} else {
			return false;
		}
	}

	// EXCEPTION HANDLING
	public void enterWeight(int weight) throws incorrectWeightException {
		if (weight > 80) {
			throw new incorrectWeightException("\nYour weight can't equal to or be less than 80!");
		}
	} // closes enterWeight
}
