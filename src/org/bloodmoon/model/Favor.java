package org.bloodmoon.model;

public class Favor {
    private int ufid;
    private int ufSid;
    private String ufSimg;
    private String ufSname;
    private int ufSlevel;
    private int ufSprice;
    private int ufUid;
    private String modified;

    public int getUfid(){return ufid;}
    public void setUfid(int ufid){this.ufid=ufid;}

    public int getUfSid(){return ufSid;}
    public void setUfSid(int ufSid){this.ufSid=ufSid;}

    public String getUfSimg() {
        return ufSimg;
    }
    public void setUfSimg(String ufSimg) {
        this.ufSimg = ufSimg;
    }

    public String getUfSname() {
        return ufSname;
    }
    public void setUfSname(String ufSname) {
        this.ufSname = ufSname;
    }

    public int getUfSlevel() {
        return ufSlevel;
    }

    public void setUfSlevel(int ufSlevel) {
        this.ufSlevel = ufSlevel;
    }

    public int getUfSprice() {
        return ufSprice;
    }
    public void setUfSprice(int ufSprice) {
        this.ufSprice = ufSprice;
    }

    public int getUfUid() {
        return ufUid;
    }
    public void setUfUid(int ufUid) {
        this.ufUid = ufUid;
    }

    public String getModified() {
        return modified;
    }
    public void setModified(String modified) {
        this.modified = modified;
    }
}
