package org.alpo.example.jitt3r.entity;

import javax.persistence.*;

/**
 * Сущьность таблицы ProjectRole,
 * таблица используется для расшаривания проектов
 */
@Entity
public class ProjectRole {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "project_id")
    private Project project;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "user_id")
    private User author;

    public ProjectRole() {
    }

    public ProjectRole(Project project, User user) {
        this.project = project;
        this.author = user;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Project getProject() {
        return project;
    }

    public void setProject(Project project) {
        this.project = project;
    }

    public User getAuthor() {
        return author;
    }

    public void setAuthor(User author) {
        this.author = author;
    }
}
