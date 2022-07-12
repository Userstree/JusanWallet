package com.example.jusanwallet.Controllers.Requests;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

import java.util.Date;

@Getter
@Setter
@Data
public class RequestPeriod {
    private Date from;
    private Date to;
}
