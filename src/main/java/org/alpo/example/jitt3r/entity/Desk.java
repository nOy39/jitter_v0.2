package org.alpo.example.jitt3r.entity;

import javax.persistence.*;

@Entity
public class Desk {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
    private String classStyle;
    private String name;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "project_id")
    private Project project;

    private boolean isPublic;

    public Desk() {
    }

    public Desk(String name, String classStyle, Project project, boolean isPublic) {
        this.name = name;
        this.classStyle = classStyle;
        this.project = project;
        this.isPublic = isPublic;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getClassStyle() {
        return classStyle;
    }

    public void setClassStyle(String classStyle) {
        this.classStyle = classStyle;
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

    public boolean isPublic() {
        return isPublic;
    }

    public void setPublic(boolean aPublic) {
        isPublic = aPublic;
    }

    @Override
    public String toString() {
        return "Desk{" +
                "id=" + id +
                ", classStyle='" + classStyle + '\'' +
                ", name='" + name + '\'' +
                ", project=" + project +
                ", isPubl=" + isPublic +
                '}';
    }
}
