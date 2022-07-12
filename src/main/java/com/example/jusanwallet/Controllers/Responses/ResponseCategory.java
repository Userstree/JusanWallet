package com.example.jusanwallet.Controllers.Responses;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Data
public class ResponseCategory {
    private String category;
    private double sum;
    private double bonuses;

    public ResponseCategory(String category, double sum, double bonuses) {
        this.category = category;
        this.sum = sum;
        this.bonuses = bonuses;
    }
}
