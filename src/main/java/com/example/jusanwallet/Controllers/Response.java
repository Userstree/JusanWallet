package com.example.jusanwallet.Controllers;

import com.example.jusanwallet.Entities.CompanyType;
import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Data
public class Response {
    private String companyType;
    private double sum;
    private double bonuses;
    private double possibleBonuses;

    Response (CompanyType companyType, double sum, double bonuses) {
        this.companyType = companyType.getName();
        this.sum = sum;
        this.bonuses = bonuses;
        this.possibleBonuses = sum * companyType.getPercent();
    }
}
