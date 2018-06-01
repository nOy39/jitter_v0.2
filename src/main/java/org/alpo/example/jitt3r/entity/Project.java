package org.alpo.example.jitt3r.entity;

import javax.persistence.*;
import java.time.LocalDate;
import java.util.Set;

/**
 * Сущность таблицы Project
 */
@Entity
public class Project {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
    /**
     * Название проекта.
     */
    private String projectName;
    /**
     * Описание проекта
     */
    private String description;
    /**
     * Уникальный номер проекта
     */
    private String uniqid;
    /**
     * расшаренность проета для других пользователей
     */
    private boolean isShare;
    /**
     * публичность проекта
     */
    private boolean publ;
    /**
     * Дата создания проекта
     */
    private LocalDate createdDate;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "user_id")
    private User author;

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
        this.isShare = false;
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

    public LocalDate getCreatedDate() {
        return createdDate;
    }

    public void setCreatedDate(LocalDate createdDate) {
        this.createdDate = createdDate;
    }

    public boolean isShare() {
        return isShare;
    }

    public void setShare(boolean share) {
        isShare = share;
    }
}
