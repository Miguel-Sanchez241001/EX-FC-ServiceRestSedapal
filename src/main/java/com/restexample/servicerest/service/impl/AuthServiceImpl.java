package com.restexample.servicerest.service.impl;

import com.restexample.servicerest.config.AuthResponse;
import com.restexample.servicerest.config.RegisterRequest;
import com.restexample.servicerest.config.Role;
import com.restexample.servicerest.config.Usuario;
import com.restexample.servicerest.reposirio.UsuarioRepository;
import com.restexample.servicerest.service.interfaz.AuthService;
import io.jsonwebtoken.Jwts;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

@Service
public class AuthServiceImpl implements AuthService {
    @Autowired
    private  UsuarioRepository usuarioRepository;
    @Autowired
    private PasswordEncoder passwordEncoder;


    @Override
    public AuthResponse login(Usuario loginRequest) {

        return null;
    }

    @Override
    public AuthResponse registro(RegisterRequest registerRequest) {
        Usuario usuario = Usuario.builder()
                .username(registerRequest.getUsername())
                .password(passwordEncoder.encode(registerRequest.getPassword()))
                .role(Role.USER)
                .build();
        usuarioRepository.save(usuario);

        return AuthResponse.builder()
                .token(getToken(usuario))
                .build();
    }

    private String getToken(UserDetails usuario) {
        return Jwts
                .builder().claims()
                .empty().toString();
    }
}
