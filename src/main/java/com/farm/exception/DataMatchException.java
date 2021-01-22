package com.farm.exception;


public class DataMatchException extends SystemException {
    public DataMatchException(String message) {
        super(message);
    }

    public DataMatchException(String message, Throwable cause) {
        super(message, cause);
    }
}
