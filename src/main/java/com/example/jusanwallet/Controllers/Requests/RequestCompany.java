package com.example.jusanwallet.Controllers.Requests;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Data
public class RequestCompany {
    private String name;
    private int companyTypeID;
}
