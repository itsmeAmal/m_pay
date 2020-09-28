package com.caller.entity;

public class Smodel
{
    private String name;
    private String sid;

    public Smodel() {
    }

    public Smodel(String name, String sid) {
        this.name = name;
        this.sid = sid;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getSid() {
        return sid;
    }

    public void setSid(String sid) {
        this.sid = sid;
    }
}
