// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package javaeeweather0524.domain;

import javaeeweather0524.domain.MyUser;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Version;

privileged aspect MyUser_Roo_Jpa_Entity {
    
    declare @type: MyUser: @Entity;
    
    @Id
    @SequenceGenerator(name = "myUserGen", sequenceName = "MYUSER_SEQ")
    @GeneratedValue(strategy = GenerationType.AUTO, generator = "myUserGen")
    @Column(name = "id")
    private Long MyUser.id;
    
    @Version
    @Column(name = "version")
    private Integer MyUser.version;
    
    public Long MyUser.getId() {
        return this.id;
    }
    
    public void MyUser.setId(Long id) {
        this.id = id;
    }
    
    public Integer MyUser.getVersion() {
        return this.version;
    }
    
    public void MyUser.setVersion(Integer version) {
        this.version = version;
    }
    
}
