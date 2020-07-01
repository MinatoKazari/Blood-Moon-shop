package org.bloodmoon.model;

public class Order {
    private int ugoid;
    private int ugosid;
    private int ugoUidb;
    private int ugoUids;
    private String ugoSname;
    private int ugoPrices;
    private String ugoAddress;
    private String ugodealinfo;
    private String ugoState;
    private String createtime;
    private String modified;

    public int getUgosid() {
        return ugosid;
    }

    public void setUgosid(int ugosid) {
        this.ugosid = ugosid;
    }

    public int getUgoid(){return ugoid;}
    public void setUgoid(int ugoid){this.ugoid = ugoid;}

    public int getUgoUidb(){return ugoUidb;}
    public void setUgoUidb(int ugoUidb){this.ugoUidb=ugoUidb;}

    public int getUgoUids(){return ugoUids;}
    public void setUgoUids(int ugoUids){this.ugoUids=ugoUids;}

    public String getUgoSname(){return ugoSname;}
    public void setUgoSname(String ugoSname){this.ugoSname = ugoSname;}

    public int getUgoPrices(){ return ugoPrices;}
    public void setUgoPrices(int ugoPrices){this.ugoPrices = ugoPrices;}

    public String getUgoAddress(){return ugoAddress;}
    public void setUgoAddress(String ugoAddress){this.ugoAddress = ugoAddress;}

    public String getUgodealinfo(){return ugodealinfo;}
    public void setUgodealinfo(String ugodealinfo){this.ugodealinfo = ugodealinfo;}

    public String getUgoState(){return ugoState;}
    public void setUgoState(String ugoState){this.ugoState = ugoState;}

    public String getCreatetime(){return createtime;}
    public void setCreatetime(String createtime){this.createtime = createtime;}

    public String getModified(){return modified;}
    public void setModified(String modified){this.modified = modified;}
}