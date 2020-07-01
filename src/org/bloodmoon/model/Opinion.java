package org.bloodmoon.model;

public class Opinion {
    private int id;
    private int uid;
    private String name;
    private String context;
    private String time;

    public int getId() {
        return id;
    }
    public void setId(int id) {
        this.id = id;
    }

    public int getUid() {
        return uid;
    }
    public void setUid(int uid) {
        this.uid = uid;
    }

    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
    }

    public String getContext() {
        return context;
    }
    public void setContext(String context) {
        this.context = context;
    }

    public String getTime() {
        return time;
    }
    public void setTime(String time) {
        this.time = time;
    }
}
