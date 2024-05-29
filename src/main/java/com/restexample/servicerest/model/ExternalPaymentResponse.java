package com.restexample.servicerest.model;
import lombok.AllArgsConstructor;
import lombok.Data;

import java.math.BigDecimal;

@Data
@AllArgsConstructor
public class ExternalPaymentResponse {
    
    private Long collectionId;
    private String confirmationMessage;
    private String collectionStatus;
    private BigDecimal accountBalance;
}
