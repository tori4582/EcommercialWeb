package edu.fpt.vlxd.models;
import lombok.*;

@Data
@NoArgsConstructor
public class Order {
    private int oid;
    private Product product;
    private int amount;
    private int orderStatus;
}
