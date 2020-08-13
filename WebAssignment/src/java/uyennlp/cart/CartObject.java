/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uyennlp.cart;

import java.io.Serializable;
import java.util.HashMap;
import java.util.Map;

/**
 *
 * @author SE140355
 */
public class CartObject implements Serializable {

    private Map<String, Integer> items;

    public Map<String, Integer> getItems() {
        return items;
    }

    public void addItemToCart(String title) {
        if (this.items == null) {
            this.items = new HashMap<String, Integer>();
        }//end if item is not existed
        
        int quantity = 1;
        if (this.items.containsKey(title)) {
            quantity = this.items.get(title) + 1;
        }
        
        this.items.put(title, quantity);
    }
    
    public void removeItemFromCart(String title) {
        if (this.items == null) {
            return;
        }
        
        if (this.items.containsKey(title)) {
            this.items.remove(title);
            
            if (this.items.isEmpty()) {
                this.items = null;
            }
        }
    }
    
    public void clearCart() {
        if (this.items != null) {
            items = null;
        }
    }

}
