package org.alpo.example.sb_mustache.entity;

import javax.persistence.*;

@Entity
public class Desk {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    private String name;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "project_id")
    private Project project;

    private boolean isImportant;
    private boolean isComplete;

    public Desk() {
    }

    public Desk(String name, Project project) {
        this.name = name;
        this.project = project;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Project getProject() {
        return project;
    }

    public void setProject(Project project) {
        this.project = project;
    }

    public boolean isImportant() {
        return isImportant;
    }

    public void setImportant(boolean important) {
        isImportant = important;
    }

    public boolean isComplete() {
        return isComplete;
    }

    public void setComplete(boolean complete) {
        isComplete = complete;
    }

    @Override
    public String toString() {
        return "Desk{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", project=" + project +
                ", isImportant=" + isImportant +
                ", isComplete=" + isComplete +
                '}';
    }
}
