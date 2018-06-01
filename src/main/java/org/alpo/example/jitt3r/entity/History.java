package org.alpo.example.jitt3r.entity;

import javax.persistence.*;
import java.util.Date;

/**
 * Сущность таблицы History.
 * Таблица для введения истории всех действий пользователя
 */
@Entity
public class History {

    /**
     * id
     */
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private long id;
    /**
     * собщение о действиях.
     */
    private String message;
    /**
     * дата создания записи.
     */
    private Date created;
    /**
     * авторизированый пользователь чья история действий записывается
     * ривязывается к таблице USER - методом многие-к-одному
     */
    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "user_id")
    private User author;

    /**
     * история действий внутри конкретного проекта
     * привязка у таблице PROJECT - методом многие-к-одному
     */
    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "project_id")
    private Project project;

    /**
     * история действий внутри конкретной доски
     * привязка к таблице DESK - методом многие-к-одному
     */
    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "desk_id")
    private Desk desk;

    /**
     * история действий внутри конкретной ноты
     * привязка к таблице NOTE - методом многие-к-одному
     */
    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "note_id")
    private Note note;

    public History() {
    }

    public History(String message, User author) {
        this.message = message;
        this.created = new Date();
        this.author = author;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public Date getCreated() {
        return created;
    }

    public void setCreated(Date created) {
        this.created = created;
    }

    public User getAuthor() {
        return author;
    }

    public void setAuthor(User author) {
        this.author = author;
    }

    public Project getProject() {
        return project;
    }

    public void setProject(Project project) {
        this.project = project;
    }

    public Desk getDesk() {
        return desk;
    }

    public void setDesk(Desk desk) {
        this.desk = desk;
    }

    public Note getNote() {
        return note;
    }

    public void setNote(Note note) {
        this.note = note;
    }
}
