package com.restexample.servicerest.controller;

import com.restexample.servicerest.config.AuthResponse;
import com.restexample.servicerest.config.RegisterRequest;
import com.restexample.servicerest.config.Usuario;
import com.restexample.servicerest.service.interfaz.AuthService;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/auth")
 public class AutenticaController {

    @Autowired
    private AuthService authService;

    @PostMapping("/login")
    public ResponseEntity<AuthResponse> login(@RequestBody Usuario loginRequest)
    {
        return ResponseEntity.ok(authService.login(loginRequest));
    }
    @PostMapping("/register")
    public ResponseEntity<AuthResponse> register(@RequestBody RegisterRequest registerRequest)
    {
        return ResponseEntity.ok(authService.registro(registerRequest));
    }

}
