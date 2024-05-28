package com.restexample.servicerest.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.restexample.servicerest.model.Account;

public interface AccountRepository extends JpaRepository<Account, String> {
}
