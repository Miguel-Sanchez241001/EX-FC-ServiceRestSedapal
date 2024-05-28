package com.restexample.servicerest.model;

import java.math.BigDecimal;

import lombok.AllArgsConstructor;

@lombok.Data
public class AccountResponse {

    private Data data;

    public AccountResponse(Account account) {
        this.data = new Data(
                account.getCustomerName(),
                account.getAccountReference(),
                account.getAccountBalance(),
                account.getLastBillAmount(),
                account.getLastBillDueDate(),
                account.getCurrencyId(),
                account.getCurrencyIsoCode()
        );
    }

    @AllArgsConstructor
    @lombok.Data
    public static class Data {
        private String customerName;
        private String accountReference;
        private BigDecimal accountBalance;
        private BigDecimal lastBillAmount;
        private Long lastBillDueDate;
        private Integer currencyId;
        private String currencyIsoCode;
    }
}