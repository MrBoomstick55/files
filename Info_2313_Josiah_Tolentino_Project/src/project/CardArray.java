/* 
 * @author Josiah Tolentino 100304547 
 * @version 1.0
 */
package project;

import java.util.ArrayList;

/**
 * This abstract class encapsulates 
 * an array of playing cards. 
 */
public abstract class CardArray 
{
	
	/** The cards. */
    protected ArrayList<Card> cards;

    /**
     *  Constructs an empty ArrayList of type Card. 
     */
    public CardArray() {
        this.cards = new ArrayList<Card>();
    }

    /**
     * Adds the card to ArrayList cards.
     *
     * @param card, the card
     */
    public void addCard(Card card) {
        cards.add(card);
    }

    /**
     * Pop card: remove and return the last card 
     * in ArrayList cards. 
     *
     * @return the last card in ArrayList cards
     */
    public Card popCard() {
    	
    	// grabs the top card and places it in pop
    	Card pop = cards.get(cards.size() - 1);
    	
    	// removes the top card
    	cards.remove(cards.size()-1);
    	
    	// returns the card "popped"
    	return pop;
    }

    /**
     * Size.
     *
     * @return the number of cards in the ArrayList cards.
     */
    public int size() {
        return cards.size();
    }

    /**
     * Empty.
     *
     * @return true, if the ArrayList cards is empty;
     * false, otherwise. 
     */
    public boolean empty() {
        return cards.size() == 0;
    }
    
}
