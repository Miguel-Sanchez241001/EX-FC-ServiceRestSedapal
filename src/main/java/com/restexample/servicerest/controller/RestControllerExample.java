package com.restexample.servicerest.controller;

import java.math.BigDecimal;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.restexample.servicerest.model.Account;
import com.restexample.servicerest.model.AccountResponse;
import com.restexample.servicerest.repository.AccountRepository;

@RestController
@RequestMapping("/api/example")
public class RestControllerExample {


        @Autowired
    private AccountRepository accountRepository;

    @GetMapping("/{accountReference}/balance")
   public ResponseEntity<?> getAccountBalance(@PathVariable String accountReference) {
        return accountRepository.findById(accountReference)
                .map(account -> ResponseEntity.ok(new AccountResponse(account)))
                .orElseGet(() -> ResponseEntity.ok(generateRandomAccountResponse(accountReference)));
    }

    private AccountResponse generateRandomAccountResponse(String accountReference) {
        Random random = new Random();
        Account account = new Account();
        account.setAccountReference(accountReference);
        account.setCustomerName("Random Customer");
        account.setAccountBalance(BigDecimal.valueOf(random.nextDouble() * 10000).setScale(2, BigDecimal.ROUND_HALF_UP));
        account.setLastBillAmount(BigDecimal.valueOf(random.nextDouble() * 1000).setScale(2, BigDecimal.ROUND_HALF_UP));
        account.setLastBillDueDate(System.currentTimeMillis() / 1000);
        account.setCurrencyId(random.nextInt(999));
        account.setCurrencyIsoCode("USD");

        return new AccountResponse(account);
    }
}
