package com.example.jusanwallet.Controllers;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Data
public class Response {
    private String category;
    private double sum;
    private double bonuses;

    Response (String category, double sum, double bonuses) {
        this.category = category;
        this.sum = sum;
        this.bonuses = bonuses;
    }
}
