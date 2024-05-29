package com.restexample.servicerest.model;

import lombok.Data;

import java.math.BigDecimal;

@Data
public class ExternalPaymentRequest {
    private Long paymentDate;
    private String collectionReference;
    private BigDecimal amount;
    private String currency;
    private String transactionId;
    private String paymentCenter;
    private Integer collectionId;
    private String cancelMessage;
}
