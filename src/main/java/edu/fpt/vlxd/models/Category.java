package edu.fpt.vlxd.models;

import lombok.*;

@Data
@NoArgsConstructor
public class Category {
    private int cid;
    private String cname;
    
    public Category(int cid, String cname) {
        this.cid = cid;
        this.cname = cname;
    }
}
