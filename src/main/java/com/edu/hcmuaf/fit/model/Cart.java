package com.edu.hcmuaf.fit.model;
import com.edu.hcmuaf.fit.model.Product;
import java.util.Collection;
import java.util.HashMap;

public class Cart {
    private HashMap<Integer, Product> data;

    public Cart(HashMap<Integer, Product> data) {
        this.data = data;
    }

    public Cart() {
        this.data = new HashMap<Integer, Product>();
    }

    public HashMap<Integer, Product> getData() {
        return data;
    }

    public void setData(HashMap<Integer, Product> data) {
        this.data = data;
    }
    public Product get(int id) {
        return data.get(id);
    }
    public int put(Product item) {
        if(data.containsKey(item.getId()))
            data.get(item.getId()).quantityUp();
        else data.put(item.getId(), item);
        return data.get(item.getId()).getQuantity();
    }
    public int put(int id, int quantity) {
        if(data.containsKey(id)) data.get(id).quantityUp(quantity);
        return data.get(id).getQuantity();
    }
    public boolean remove(int id) {
        return data.remove(id) == null;
    }
    public double total() {
        double sum =0;
        for(Product p:data.values())
            sum +=(p.getQuantity()*p.getPrice());
        return sum;
    }
    public Collection<Product> list() {
        return data.values();
    }

}

