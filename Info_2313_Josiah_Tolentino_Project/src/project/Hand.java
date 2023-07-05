/* 
 * @author Josiah Tolentino 100304547 
 * @version 1.0
 */
package project;

/**
 * This class represents a hand: the cards held by one player.
 */
public class Hand extends CardArray{
	
	/**
	 * Instantiates a new hand.
	 */
	public Hand() {
		super();
	}
	
    /**
     * Pop card: removes and returns the card in Hand at 
     * the given index.
	 * <p>
	 * Note: this method overloads popCard() in CardArray class.
	 * </p>
     *
     * @param i, the (zero-based) index of a card in Hand.
     * @return the card
     */
    public Card popCard(int i) {
    	
    	// gets card at instance i and places it in pop
    	Card pop = cards.get(i);
    	
    	// removes card at instance i
    	cards.remove(i);
    	
    	// returns pop
    	return pop;
    }
	
    /**
     * Gets the card: returns (but does not remove) the card 
     * in Hand at the given index.
     *
     * @param i, the (zero-based) index of a card in Hand.
     * @return the card
     */
    public Card getCard(int i) {
    	
    	// gets card at instance i and places it in get
    	Card get = cards.get(i);
    	    	
    	// returns get
    	return get;
    }

    /* Returns a string representation of the Hand. */
    @Override
    public String toString() {
    	if(cards.isEmpty())
    		return "empty!";
    	
    	String output = "";
    	for(int i=0; i<cards.size(); i++){
    		output += "[" + Integer.toString(i+1) + "]: " + cards.get(i) + "\n";
    	}
    	return output;
    }
}
