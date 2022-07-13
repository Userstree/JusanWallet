package com.example.jusanwallet.Controllers.Requests;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

import java.util.Date;

@Getter
@Setter
@Data
public class RequestTransaction {
    private double monetary;
    private double bonus;
    private Date date;
    private int clientID;
    private int companyID;
    private int categoryID;
}
