// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package javaeeweather0524.domain;

import java.util.Date;
import javaeeweather0524.domain.City;
import javaeeweather0524.domain.Weather;

privileged aspect Weather_Roo_JavaBean {
    
    public int Weather.getTemperature() {
        return this.temperature;
    }
    
    public void Weather.setTemperature(int temperature) {
        this.temperature = temperature;
    }
    
    public String Weather.getDescription() {
        return this.description;
    }
    
    public void Weather.setDescription(String description) {
        this.description = description;
    }
    
    public Date Weather.getMydate() {
        return this.Mydate;
    }
    
    public void Weather.setMydate(Date Mydate) {
        this.Mydate = Mydate;
    }
    
    public long Weather.getMyid() {
        return this.Myid;
    }
    
    public void Weather.setMyid(long Myid) {
        this.Myid = Myid;
    }
    
    public City Weather.getCity() {
        return this.city;
    }
    
    public void Weather.setCity(City city) {
        this.city = city;
    }
    
}
