package com.restexample.servicerest.controller;

import java.math.BigDecimal;
import java.util.Optional;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.restexample.servicerest.model.Account;
import com.restexample.servicerest.model.AccountResponse;
import com.restexample.servicerest.model.Datarest;
import com.restexample.servicerest.model.ErrorResponse;
import com.restexample.servicerest.model.ExternalPayment;
import com.restexample.servicerest.model.ExternalPaymentRequest;
import com.restexample.servicerest.model.ExternalPaymentResponse;
import com.restexample.servicerest.repository.AccountRepository;
import com.restexample.servicerest.repository.ExternalPaymentRepository;

@RestController
@RequestMapping("/api/v1")
public class RestControllerExample {

  @Autowired
    private ExternalPaymentRepository externalPaymentRepository;
        @Autowired
    private AccountRepository accountRepository;

    @GetMapping("/{accountReference}/balance")
   public ResponseEntity<?> getAccountBalance(@PathVariable String accountReference) {
        return accountRepository.findById(accountReference)
                .map(account -> ResponseEntity.ok(new AccountResponse(account)))
                .orElseGet(() -> {
                    AccountResponse response = generateRandomAccountResponse(accountReference);
                    Account account = response.getData().toAccount();
                    accountRepository.save(account);
                    return ResponseEntity.ok(response);
                });
    }

@PostMapping("/externalPayment")
    public ResponseEntity<?> processExternalPayment(@RequestBody ExternalPaymentRequest paymentRequest) {
        if (paymentRequest.getPaymentCenter() == null) {
            return ResponseEntity.status(422).body(new ErrorResponse());
        }

        Optional<Account> accountOpt = accountRepository.findById(paymentRequest.getCollectionReference());
        if (!accountOpt.isPresent()) {
            return ResponseEntity.status(402).body(new ErrorResponse());
        }

  
        Account account = accountOpt.get();
        account.setAccountBalance(account.getAccountBalance().subtract(paymentRequest.getAmount()));
        accountRepository.save(account);

        ExternalPayment payment = new ExternalPayment();
        payment.setPaymentDate(paymentRequest.getPaymentDate());
        payment.setCollectionReference(paymentRequest.getCollectionReference());
        payment.setAmount(paymentRequest.getAmount());
        payment.setCurrency(paymentRequest.getCurrency());
        payment.setTransactionId(paymentRequest.getTransactionId());
        payment.setPaymentCenter(paymentRequest.getPaymentCenter());


        externalPaymentRepository.save(payment);

        ExternalPaymentResponse response = new ExternalPaymentResponse(payment.getId(), 
            "Payment successful", "Completed", account.getAccountBalance());
        
          Datarest data =   Datarest.builder().data(response).build();
        return ResponseEntity.ok(  data );
    }






    @PostMapping("/sedCancelExternalPayment")
    public ResponseEntity<?> processExternalPaymentAnulacion(@RequestBody ExternalPaymentRequest cancelRequest) {
        if (cancelRequest.getPaymentCenter() == null) {
            return ResponseEntity.status(422).body(new ErrorResponse());
        }

        Optional<Account> accountOpt = accountRepository.findById(cancelRequest.getCollectionReference());
        if (!accountOpt.isPresent()) {
            return ResponseEntity.status(422).body(new ErrorResponse());
        }

        Account account = accountOpt.get();
        account.setAccountBalance(account.getAccountBalance().add(cancelRequest.getAmount()));
        accountRepository.save(account);

        ExternalPayment payment = new ExternalPayment();
        payment.setPaymentDate(cancelRequest.getPaymentDate());
        payment.setCollectionReference(cancelRequest.getCollectionReference());
        payment.setAmount(cancelRequest.getAmount());
        payment.setCurrency(cancelRequest.getCurrency());
        payment.setTransactionId(cancelRequest.getTransactionId());
        payment.setPaymentCenter(cancelRequest.getPaymentCenter());
        payment.setCollectionId(cancelRequest.getCollectionId());
        payment.setCancelMessage(cancelRequest.getCancelMessage());

        externalPaymentRepository.save(payment);

        ExternalPaymentResponse response = new ExternalPaymentResponse(payment.getId(), 
            "Payment cancellation successful", "Cancelled", account.getAccountBalance());
            Datarest data =   Datarest.builder().data(response).build();
            return ResponseEntity.ok(  data );
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
        account.setCurrencyIsoCode("PEN");

        return new AccountResponse(account);
    }
}
