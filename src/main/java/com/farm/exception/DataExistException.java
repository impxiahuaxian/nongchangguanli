package com.farm.exception;


public class DataExistException extends SystemException {

    public DataExistException(String message) {
        super(message);
    }

    public DataExistException(String message, Throwable cause) {
        super(message, cause);
    }
}
