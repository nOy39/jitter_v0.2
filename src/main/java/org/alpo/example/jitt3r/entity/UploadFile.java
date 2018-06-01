package org.alpo.example.jitt3r.entity;

import javax.persistence.*;

/**
 * Сущность таблицы загрузки файлов
 */
@Entity
public class UploadFile {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private long id;

    /**
     * {@value} filename - имя файла, генерируемое название, для хранения на сервере
     */
    private String filename;

    /**
     * {@value} originalName - оригинальное имя файла, для отображения пользователю.
     */
    private String originalName;

    /**
     * Не используется возможно будет удалена
     * TODO: Определиться с "desk_id" в UploadFile
     * @serial desk -
     */
    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "desk_id")
    private Desk desk;

    /**
     * @serialField note - привязка загруженного файла к ноте, чтобы каждая нота имела свою галерею
     */
    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "note_id")
    private Note note;

    /**
     * TODO: Определиться с "user_id" в UploadFile
     * @serialField author - пользователь который произвел загрузку файла.
     */
    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "user_id")
    private User author;
    /**
     * @serialField project_id - проект к которому относятся загружаемые файлы.
     */
    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "project_id")
    private Project project;

    public UploadFile() {
    }

    public String getOriginalName() {
        return originalName;
    }

    public void setOriginalName(String originalName) {
        this.originalName = originalName;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getFilename() {
        return filename;
    }

    public void setFilename(String filename) {
        this.filename = filename;
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
}
