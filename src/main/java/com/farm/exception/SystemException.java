package com.farm.exception;


public class SystemException extends RuntimeException {

    public SystemException() {
        super("系统异常");
    }

    public SystemException(String message) {
        super(message);
    }

    public SystemException(String message, Throwable cause) {
        super(message, cause);
    }
}
