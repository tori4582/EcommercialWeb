package edu.fpt.vlxd.models;
import lombok.*;

@Data
@NoArgsConstructor
public class Product {
    private int id;
    private String name;
    private String image;
    private double price;
    private String title;
    private String description;

    public Product(int id, String name, String image, double price, String title, String description) {
        this.id = id;
        this.name = name;
        this.image = image;
        this.price = price;
        this.title = title;
        this.description = description;
    }
}
