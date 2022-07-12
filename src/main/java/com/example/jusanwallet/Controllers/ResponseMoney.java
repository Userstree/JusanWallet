package com.example.jusanwallet.Controllers;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Data
@AllArgsConstructor
public class ResponseMoney {
    private double sum;
    private double bonuses;
}
