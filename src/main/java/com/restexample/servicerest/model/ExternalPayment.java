package com.restexample.servicerest.model;

import java.math.BigDecimal;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import lombok.Data;


@Entity
@Data
public class ExternalPayment {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private Long paymentDate;
    private String collectionReference;
    private BigDecimal amount;
    private String currency;
    private String transactionId;
    private String paymentCenter;
    private Integer collectionId;
    private String cancelMessage;
}