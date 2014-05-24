package javaeeweather0524.domain;

import java.util.HashSet;
import java.util.Set;
import javax.persistence.CascadeType;
import javax.persistence.ManyToMany;
import javax.validation.constraints.NotNull;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;

@RooJavaBean
@RooToString
@RooJpaActiveRecord(sequenceName = "MYUSER_SEQ")
public class MyUser {

    @NotNull
    private String Mypassword;

    @NotNull
    private long Myid;

    @NotNull
    private String Myname;

    @ManyToMany(cascade = CascadeType.ALL)
    private Set<City> city = new HashSet<City>();
}
