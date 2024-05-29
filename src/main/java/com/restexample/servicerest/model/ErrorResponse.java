package com.restexample.servicerest.model;

import lombok.Data;

@Data
public class ErrorResponse {
    private int httpStatus = 422;
    private String code = "CB001522";
    private String helpLink = "CB001522";
    private String errorSequence = "2742ff8:18d40f6030c:-7fc4";
    private String msgUser = "InCMS-BL-CB001522. No existe el código de la agencia contenido en el cobro";
}