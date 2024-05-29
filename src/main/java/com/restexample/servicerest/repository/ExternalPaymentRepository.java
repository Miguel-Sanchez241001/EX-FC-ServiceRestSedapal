package com.restexample.servicerest.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.restexample.servicerest.model.ExternalPayment;

public interface ExternalPaymentRepository extends JpaRepository<ExternalPayment, Long> {
}
