package org.alpo.example.jitt3r.entity;

import javax.persistence.*;

/**
 * Сущность меток привязываются к пользователю
 */
@Entity
public class Tag {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    private String color;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "user_id")
    private User author;

    public Tag() {
    }

    public Tag(String color, User author) {
        this.color = color;
        this.author = author;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }

    public User getAuthor() {
        return author;
    }

    public void setAuthor(User author) {
        this.author = author;
    }

    @Override
    public String toString() {
        return "Tag{" +
                "id=" + id +
                ", color='" + color + '\'' +
                ", author=" + author +
                '}';
    }
}