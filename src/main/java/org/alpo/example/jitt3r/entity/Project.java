package org.alpo.example.jitt3r.entity;

import javax.persistence.*;
import java.util.Set;

@Entity
public class Project {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    private String prj_name;
    private String description;
    private String uniqid;

    private boolean isactive;
    private boolean publ;

    private String createdDate;
    private String deadlineDate;


    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "user_id")
    private User author;

    @OneToMany(fetch = FetchType.LAZY)
    @JoinColumn(name = "share_id")
    private Set<ProjectRole> share;

    public Project() {
    }

    public Project(String prj_name, String description, String uniqid, boolean is_public, String createdDate, User author) {

        this.description = description;
        this.prj_name = prj_name;
        this.uniqid = uniqid;
        this.author = author;
        this.publ = is_public;
        this.createdDate = createdDate;
    }

    public Project(String prj_name,
                   String description,
                   String uniqid,
                   boolean publ,
                   String createdDate,
                   String deadlineDate,
                   User author) {

        this.prj_name = prj_name;
        this.description = description;
        this.uniqid = uniqid;
        this.publ = publ;
        this.createdDate = createdDate;
        this.deadlineDate = deadlineDate;
        this.author = author;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getPrj_name() {
        return prj_name;
    }

    public void setPrj_name(String prj_name) {
        this.prj_name = prj_name;
    }

    public User getAuthor() {
        return author;
    }

    public void setAuthor(User author) {
        this.author = author;
    }

    public String getUniqid() {
        return uniqid;
    }

    public void setUniqid(String uniqid) {
        this.uniqid = uniqid;
    }

    public boolean isPubl() {
        return publ;
    }

    public void setPubl(boolean publ) {
        this.publ = publ;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public boolean isIsactive() {
        return isactive;
    }

    public void setIsactive(boolean isactive) {
        this.isactive = isactive;
    }

    public String getCreatedDate() {
        return createdDate;
    }

    public void setCreatedDate(String createdDate) {
        this.createdDate = createdDate;
    }

    public String getDeadlineDate() {
        return deadlineDate;
    }

    public void setDeadlineDate(String deadlineDate) {
        this.deadlineDate = deadlineDate;
    }

    public Set<ProjectRole> getShare() {
        return share;
    }

    public void setShare(Set<ProjectRole> share) {
        this.share = share;
    }

    @Override
    public String toString() {
        return "Project{" +
                "id=" + id +
                ", prj_name='" + prj_name + '\'' +
                ", description='" + description + '\'' +
                ", uniqid='" + uniqid + '\'' +
                ", isactive=" + isactive +
                ", publ=" + publ +
                ", createdDate='" + createdDate + '\'' +
                ", deadlineDate='" + deadlineDate + '\'' +
                ", author=" + author +
                '}';
    }
}
