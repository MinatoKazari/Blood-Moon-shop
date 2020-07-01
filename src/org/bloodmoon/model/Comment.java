package org.bloodmoon.model;

public class Comment {
    private int smid;
    private int smUid;
    private int smSid;
    private String smUname;
    private String smContext;
    private String modified;

    public int getSmid() {
        return smid;
    }
    public void setSmid(int smid) {
        this.smid = smid;
    }

    public int getSmUid() {
        return smUid;
    }
    public void setSmUid(int smUid) {
        this.smUid = smUid;
    }

    public int getSmSid() {
        return smSid;
    }
    public void setSmSid(int smSid) {
        this.smSid = smSid;
    }

    public String getSmUname() {
        return smUname;
    }
    public void setSmUname(String smUname) {
        this.smUname = smUname;
    }

    public String getSmContext() {
        return smContext;
    }
    public void setSmContext(String smContext) {
        this.smContext = smContext;
    }

    public String getModified() {
        return modified;
    }
    public void setModified(String modified) {
        this.modified = modified;
    }
}
