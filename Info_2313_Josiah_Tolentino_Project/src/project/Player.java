/* 
 * @author Josiah Tolentino 100304547 
 * @version 1.0
 */
package project;

/**
 * This class encapsulates a player in a game of crazy eights.
 */
public abstract class Player {

    /** The name of the player */
    protected String name;
    
    /** The hand: the cards held by one player. */
    protected Hand hand;
    
    /**
     * Instantiates a new player with an empty hand.
     *
     * @param name, the name of the player
     */
    public Player(String name) {
        this.name = name;
        this.hand = new Hand();
    }

    /**
     * Gets the name.
     *
     * @return the name of the player.
     */
    public String getName() {
        return name;
    }

    /**
     * Gets the hand.
     *
     * @return the player's hand. */
    public Hand getHand() {
        return hand;
    }

    /**
     * Play: this is an abstract method and must be 
     * implemented in any derived class.
     *
     * @param crazyEight, gives access to the "draw pile".
     * @param prev, the previously played card. 
     * @return a card from the player's hand.
     */
    public abstract Card play(Game crazyEight, Card prev);

    
    /**
     * Score: calculates the player's score (penalty points).
	 * <p>
	 * Note: as soon as a player has no cards, the game ends and 
	 * all other players score penalty points for their remaining cards. 
	 * Eights are worth 20, face cards are worth 10, and all others 
	 * are worth their rank.
	 * </p>
     * @return the score
     */
    public int score() {
    	
    	// initiates the final score
    	int score = 0;

    	// creates a temporary hand card array
    	CardArray tempHand = new Hand();
    	
    	// while loop once a players hand is empty
    	while (hand.size() > 0) {

    		// pops cards from hand
        	Card pop = hand.popCard();
    		
        	// else if statement grabbing specific scores from ranks
        	if (pop.getRank() == 8)
        		score += 20;
        	else if (pop.getRank() == 11)
        		score += 10;
        	else if (pop.getRank() == 12)
        		score += 10;
        	else if (pop.getRank() == 13)
        		score += 10;
        	else 
        		// adds the number in the rank to score
        		score += pop.getRank();
        	
        	// adds cards from pop to temphand
        	tempHand.addCard(pop);
    	}
    	
    	// hand class is associated with the tempHand card array
    	hand = (Hand) tempHand;
    	
    	// returns the the total amount of score 
    	// includes the total deducted by the loser
    	return -score;
    }

    /**
     * Display the cards in player's hand.
     */
    public void display() {
    	System.out.println(name + "'s hand:");
        System.out.println(hand);
    }

    /**
     * Display the player's name and score.
     */
    public void displayScore() {
        System.out.println(name + " has " + score() + " points");
    }

    /**
     * Card matches: two cards match if their rank or suit is the same. 
	 * <p>
	 * Note: if card1's rank is 8, it is a Wild Card.
	 * A wild card can match any other card
	 * </p>
     * @param card1, the card 1
     * @param card2, the card 2
     * @return true, if card1 matches card2
     */
    public static boolean cardMatches(Card card1, Card card2) {

    	// checks for either rank or suit cards for match
    	boolean match = (card1.getRank() == card2.getRank()) || (card1.getSuit() == card2.getSuit()); 

    	// returns boolean results
    	return match;
    }
}

