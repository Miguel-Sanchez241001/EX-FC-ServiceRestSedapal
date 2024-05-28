package com.restexample.servicerest.model;

import java.math.BigDecimal;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import lombok.Data;

@Entity
@Data
public class Account {
    @Id
    private String accountReference;
    private String customerName;
    private BigDecimal accountBalance;
    private BigDecimal lastBillAmount;
    private Long lastBillDueDate;
    private Integer currencyId;
    private String currencyIsoCode;
}