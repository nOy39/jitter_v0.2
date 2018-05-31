package org.alpo.example.jitt3r.entity;

import javax.persistence.*;
import java.time.LocalDate;
import java.util.Set;

@Entity
public class Project {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    private String projectName;
    private String description;
    private String uniqid;

    private boolean isactive;
    private boolean publ;

    private LocalDate createdDate;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "user_id")
    private User author;

    @OneToMany(fetch = FetchType.LAZY)
    @JoinColumn(name = "share_id")
    private Set<ProjectRole> share;

    public Project() {
    }

    public Project(String projectName,
                   String description,
                   String uniqid,
                   boolean is_public,
                   LocalDate createdDate,
                   User author) {

        this.description = description;
        this.projectName = projectName;
        this.uniqid = uniqid;
        this.author = author;
        this.publ = is_public;
        this.createdDate = createdDate;
    }


    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getProjectName() {
        return projectName;
    }

    public void setProjectName(String projectName) {
        this.projectName = projectName;
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

    public LocalDate getCreatedDate() {
        return createdDate;
    }

    public void setCreatedDate(LocalDate createdDate) {
        this.createdDate = createdDate;
    }

    public Set<ProjectRole> getShare() {
        return share;
    }

    public void setShare(Set<ProjectRole> share) {
        this.share = share;
    }

}
