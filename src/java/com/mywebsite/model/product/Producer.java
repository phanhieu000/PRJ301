package com.mywebsite.model.product;

public class Producer {
    private int producerID;
    private String producerName;
    private String producerMeta;
    private String country;

    public Producer() {
    }

    public Producer(int producerID, String producerName, String producerMeta, String country) {
        this.producerID = producerID;
        this.producerName = producerName;
        this.producerMeta = producerMeta;
        this.country = country;
    }

    public int getProducerID() {
        return producerID;
    }

    public void setProducerID(int producerID) {
        this.producerID = producerID;
    }

    public String getProducerName() {
        return producerName;
    }

    public void setProducerName(String producerName) {
        this.producerName = producerName;
    }

    public String getProducerMeta() {
        return producerMeta;
    }

    public void setProducerMeta(String producerMeta) {
        this.producerMeta = producerMeta;
    }

    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country;
    }
    
    
}
