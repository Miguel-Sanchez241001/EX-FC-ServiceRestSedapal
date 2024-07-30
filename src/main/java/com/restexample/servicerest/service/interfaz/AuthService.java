package com.restexample.servicerest.service.interfaz;

import com.restexample.servicerest.config.AuthResponse;
import com.restexample.servicerest.config.RegisterRequest;
import com.restexample.servicerest.config.Usuario;

public interface AuthService {
  public  AuthResponse login(Usuario loginRequest);

    AuthResponse registro(RegisterRequest registerRequest);
}
