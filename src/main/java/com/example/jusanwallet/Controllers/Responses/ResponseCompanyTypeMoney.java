package com.example.jusanwallet.Controllers.Responses;

import com.example.jusanwallet.Entities.CompanyType;
import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Data
public class ResponseCompanyTypeMoney {
    private String category;
    private double sum;
    private double bonuses;
    private double possibleBonuses;

    public ResponseCompanyTypeMoney(CompanyType companyType, double sum, double bonuses) {
        this.category = companyType.getName();
        this.sum = sum;
        this.bonuses = bonuses;
        this.possibleBonuses = sum * companyType.getPercent();
    }
}
