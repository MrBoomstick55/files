import java.util.Scanner;

public class FitnessApp {

	public static void main(String[] args) {

		// user input variables
		int userIn1, userBackTo1;
		float userWeight, userCalories;
		String userDate;

		// variables for calculator
		int age, height, weight, activity, gender, BMR = 0;
		double calc = 0, daily, calorieDeficit;
		Scanner inputs = new Scanner(System.in);
		// create object
		UserData u1 = new UserData();

		// opening message
		System.out.println("Start App? : (yes = 1/no = 0)");
		Scanner userInAns1 = new Scanner(System.in);
		userBackTo1 = userInAns1.nextInt();

		// MAIN SCREEN
		while (userBackTo1 == 1) {
			System.out.print("\t\tMenu");
			System.out.println("\n\nEnter (1) for Calorie Deficit Calculator");
			System.out.println("Enter (2) to Track Calories");
			System.out.println("Enter (3) to Show Data");

			// user input
			Scanner userI1 = new Scanner(System.in);
			userIn1 = userI1.nextInt();

			// SCREEN 1 - Calculator
			if (userIn1 == 1) {
				System.out.println("Activity Levels 1-4");
				System.out.println("1 = Little to no exercise: (desk job)");
				System.out.println("2 = Light exercise: 1-3 times a week");
				System.out.println("3 = Moderate exercise: 3-5 times a week");
				System.out.println("4 = Heavy exercise: 6-7");

				System.out.println("What is your height in inches: ");
				height = inputs.nextInt();

				System.out.println("What is your weight in pounds: ");
				weight = inputs.nextInt();

				System.out.println("What is your age: ");
				age = inputs.nextInt();

				System.out.println("What is your gender? Type 1 for Male or 2 for Female");
				gender = inputs.nextInt();

				if (gender == 1) {
					BMR = (int) (66 + (6.23 * weight) + (12.7 * height) - (6.8 * age));
				} else if (gender == 2) {
					BMR = (int) (665 + (4.35 * weight) + (4.7 * height) - (4.7 * age));
				}

				// Show BMR
				System.out.println("Your BMR is " + BMR);
				System.out.println("Please enter your level of exercise");

				activity = inputs.nextInt();

				if (activity == 1) {
					calc = 1.2;
				} else if (activity == 2) {
					calc = 1.375;
				} else if (activity == 3) {
					calc = 1.55;
				} else if (activity == 4) {
					calc = 1.725;
				}

				daily = calc * BMR;
				calorieDeficit = daily - 500;

				System.out.println("Your daily calorie needs " + daily);
				System.out.println("Your calorie deficit is " + calorieDeficit);

				// call the setter method
				u1.setCaloriesNeeds(daily, calorieDeficit);

				// Back to menu screen? - user input
				System.out.println("\nBack to main? : (yes = 1/no = 0)");
				Scanner userInAns = new Scanner(System.in);
				userBackTo1 = userInAns.nextInt();

			}
			// SCREEN 2 - Track Calories - method
			else if (userIn1 == 2) {
				System.out.print("\n\t\tTrack Calories");
				System.out.print("\n\nEnter your weight (in pounds): ");
				Scanner userInWeight = new Scanner(System.in);
				userWeight = userInWeight.nextFloat();

				System.out.print("\nEnter your Calories: ");
				Scanner userInCalorie = new Scanner(System.in);
				userCalories = userInCalorie.nextFloat();

				System.out.print("\nEnter todays date (mm/dd/yyyy): ");
				Scanner userInDate = new Scanner(System.in);
				userDate = userInDate.next();

				// call the setter method
				u1.setCalories(userCalories, userWeight, userDate);

				// Back to menu screen? - user input
				System.out.println("\nBack to main? : (yes = 1/no = 0)");
				Scanner userInAns = new Scanner(System.in);
				userBackTo1 = userInAns.nextInt();

			}
			// SCREEN 3 - show data
			else if (userIn1 == 3) {
				System.out.print("\n\t\tShow Data");
				System.out.println("\n\nOn " + u1.getDate() + " your weight was " + u1.getWeight()
						+ " and the calories intake was " + u1.getCalories() + ".");
				System.out.println(
						"\n\nHere are the calories you need to maintain your current weight: " + u1.getDaily()
								+ " and to lose weight your calorie deficit is: " + u1.getCalorieDeficit() + ".");

				// Back to menu screen? - user input
				System.out.println("\nBack to main? : (yes = 1/no = 0)");
				Scanner userInAns = new Scanner(System.in);
				userBackTo1 = userInAns.nextInt();
			} // closes else if
		} // closes while

		// CLOSING MESSAGE
		System.out.println("Thank you for using our app!");

	} // closes main

} // closes class
