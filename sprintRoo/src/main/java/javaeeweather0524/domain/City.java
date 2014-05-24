package javaeeweather0524.domain;

import java.util.HashSet;
import java.util.Set;
import javax.persistence.CascadeType;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.validation.constraints.NotNull;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;

@RooJavaBean
@RooToString
@RooJpaActiveRecord(sequenceName = "CITY_SEQ")
public class City {

    @NotNull
    private long Myid;

    @NotNull
    private String Myname;

    @OneToMany(cascade = CascadeType.ALL)
    private Set<Weather> weather = new HashSet<Weather>();

    @ManyToMany(cascade = CascadeType.ALL)
    private Set<MyUser> Myuser = new HashSet<MyUser>();
}
