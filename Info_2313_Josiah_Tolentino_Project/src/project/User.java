/* 
 * @author Josiah Tolentino 100304547 
 * 
 */
package project;

import java.util.Scanner;

/**
 * This class represents a human player (user) in a game of crazy eights.
 */
public class User extends Player {
	
	/** The input. */
	private Scanner input;
	
	/**
	 * Instantiates a human player with an empty hand.
	 *
	 * @param name, the name of the player
	 */
	public User(String name){
		super(name);
		input = new Scanner(System.in);
	}

	/* This method implements play from Player class  */
    public Card play(Game crazyEight, Card prev) {
    	
    	// loops while the conditions are applicable
        while (true){
        	
        	// prompts user to play a card or draw one
        	System.out.println("Select a card from your hand ");
        	System.out.println("or enter 0 to draw a new card: ");
        	
        	// scanner applied to number
        	int number = input.nextInt();
        	
        	// if player plays 0 draws from pile and adds to hand
        	if (number == 0)
        		this.hand.addCard(crazyEight.draw());    	
        	// pops number from hand
        	else 
        		return this.hand.popCard(number - 1);
        }    		
    }

}
