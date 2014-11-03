import java.util.*;

public class Cart {
  private ArrayList<String> products = new ArrayList<String>();

  public ArrayList<String> getProducts() {
    return products;
  }

  public void setProduct(String product) {
    this.products.add(product);
  }
}
