package com.example.jusanwallet.Controllers.Responses;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Data
public class ResponsePlan {
    private String companyType;
    private double spend;
    private double plan;
}
