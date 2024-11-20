//
package orders;

import java.util.ArrayList;
import java.util.List;

public class Cart {
    private List<ItemDTO> items;
    
    public Cart(){
        items = new ArrayList<>();        
    }
    
    public Cart(List<ItemDTO> items){
        this.items = items;
    }

    public List<ItemDTO> getItems() {
        return items;
    }

    public void setItems(List<ItemDTO> items) {
        this.items = items;
    }
    
    
    
    private ItemDTO getItemById(int id){
        for (ItemDTO i : items)
            if(i.getProduct().getId() == id)
                return i;
         return null;
    }
    public int getQuantityById(int id ){
        return getItemById(id).getQuantity();
    }
    public void addItem(ItemDTO t){
        if(getItemById(t.getProduct().getId()) != null){
            ItemDTO i = getItemById(t.getProduct().getId());
            i.setQuantity(i.getQuantity() + t.getQuantity());
        }else{
            items.add(t);
        }
    }
    
    public void removeItem(int id){
        if(getItemById(id) != null){
            items.remove(getItemById(id));
        }
    }
    public double getTotalMoney(){
        double t = 0;
        for (ItemDTO i : items) {
            t += i.getQuantity() * i.getPrice();
        }
        return t;
    }
}
