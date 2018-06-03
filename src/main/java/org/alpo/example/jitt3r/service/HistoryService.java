package org.alpo.example.jitt3r.service;

import org.alpo.example.jitt3r.entity.*;
import org.alpo.example.jitt3r.repos.HistoryRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

//TODO: Переделать конструктор new History()
@Service
public class HistoryService {

    @Autowired
    HistoryRepo historyRepo;

    private History history;

    /**
     * Записываем в историю сообщение о создании новой ноты
     * @param currentDesk - текущая доска
     * @param currentNote - текущая нота
     * @param currentUser - текущий пользователь
     */
    public void saveCreatedNote(Desk currentDesk, Note currentNote, User currentUser) {

        String message = "Created new note.";
        history = new History(message,currentUser);
        history.setNote(currentNote);
        history.setDesk(currentDesk);
        history.setProject(currentDesk.getProject());
        historyRepo.save(history);
    }

    /**
     * Записывает сообщение о добавления описания ноте
     * @param currentNote - текущая нота
     * @param currentUser - пользователь
     */
    public void addDescriptionNote(Note currentNote, User currentUser) {

        String message = "Added new description.";
        history = new History(message,currentUser);
        history.setNote(currentNote);
        history.setDesk(currentNote.getDesk());
        history.setProject(currentNote.getProject());
        historyRepo.save(history);
    }

    /**
     * Записывает сообщение о том что пользователь загрузил в ноту файл
     * @param originalName - название файла
     * @param currentNote - текущая нота
     * @param currentUser - авторизированный пользователь
     */
    public void uploadFile(String originalName, Note currentNote, User currentUser) {
        String message = "Uploaded new file";
        history = new History(message, currentUser);
        history.setNote(currentNote);
        history.setDesk(currentNote.getDesk());
        history.setProject(currentNote.getProject());
        historyRepo.save(history);
    }

    /**
     * Делает запись о том что пользователь ответил на коментарий
     * @param currentNote - текущая нота
     * @param currentUser - текущий пользователь
     * @param commentId - id коментария на который отвечаем
     */
    public void replyToComment(Note currentNote, User currentUser, Comment commentId) {
        String message = "<u>"+currentUser.getUsername()+"</u> answer to <u>"+commentId.getAuthor().getUsername()+"</u> on message <small>ID:"+commentId.getId()+"</small>";
        history = new History(message, currentUser);
        history.setNote(currentNote);
        history.setDesk(currentNote.getDesk());
        history.setProject(currentNote.getProject());
        historyRepo.save(history);
    }

    /**
     * Запись о создании нового коментария
     * @param user авторизированный пользователь
     * @param currentNote - текущая нота.
     */
    public void newCommentSave(User user, Note currentNote) {
        String message = "<u>"+user.getUsername()+"</u> added new comment.";
        history = new History(message, user);
        history.setNote(currentNote);
        history.setDesk(currentNote.getDesk());
        history.setProject(currentNote.getProject());
        historyRepo.save(history);
    }

    /**
     * Делает запись о создании нового проекта
     * @param currentProject - текущий проет который мы записываем в историю
     * @param author - автор
     * @param isPublic - в формировании сообщения указывает какой проект публичный или приватный.
     */
    public void createNewProject(Project currentProject, User author, boolean isPublic) {
        String message = "";
        if (isPublic) {
            message = "Create new public project";
        } else {
            message = "Create new private project";
        }
        history = new History(message,author);
        history.setProject(currentProject);
        historyRepo.save(history);
    }

    /**
     * Метод делает запись об удалении проекта
     * @param currentProject - проект который удаляется
     */
    public void deleteProject(Project currentProject) {
        String message = "Project ID:"+currentProject.getId()+", Name:"+currentProject.getProjectName()+", was delete user:"+currentProject.getAuthor().getUsername();
        history = new History(message,currentProject.getAuthor());
        historyRepo.save(history);
    }

    /**
     * Метод делает запись о том что проект был расшарен
     * @param author - автор проекта
     * @param currentProject - текущий проект
     * @param inviteUsername - приглашённый пользователь
     */
    public void projectShared(User author, Project currentProject, String inviteUsername) {
        String message = inviteUsername+" was invoke to project \""+currentProject.getProjectName()+"\"";
        history = new History(message, author);
        history.setProject(currentProject);
        historyRepo.save(history);
    }

    /**
     * Метод делает запись в историю о переименовании проекта
     * @param user - авторизированый пользователь который переименовал проект
     * @param project - проект
     * @param projectName - новое имя проекта.
     */
    public void projectRenamed(User user, Project project, String projectName) {
        String message = project.getProjectName()+" was renamed to "+projectName;
        history = new History(message, user);
        history.setProject(project);
        historyRepo.save(history);
    }

    /**
     * Метод записывает в историю информацию о изменении описания проекта
     * @param author - авторизированный пользователь который сделал изменения
     * @param currentProject - проект в котором изменили описание
     */
    public void prjectChangeDescription(User author, Project currentProject) {
        String message = author.getUsername()+" edit description in "+currentProject.getProjectName();
        history = new History(message, author);
        history.setProject(currentProject);
        historyRepo.save(history);
    }

    /**
     *  Добавляем в историю запись о создании ТЭГА
     * @param author - авторизированный пользователь который создал тэг
     * @param currentNote - текущая нота
     * @param tag - добавляемый ТЭГ
     */
    public void addedTags(User author, Note currentNote, String tag) {
        String message = "<u>"+author.getUsername()+"</u> added new tag: <b>"+tag+".</b>";
        history = new History(message, author);
        history.setProject(currentNote.getProject());
        history.setDesk(currentNote.getDesk());
        history.setNote(currentNote);
        historyRepo.save(history);
    }

    /**
     * Удаление ТЭГА
     * @param user - авторизированный пользователь который удаляет тэг
     * @param tag
     */
    public void deleteTag(User user, Tag tag) {
        String message = "<u>"+user.getUsername()+"</u> delete tag: <b>"+tag.getName()+".</b>";
        history = new History(message,user);
        history.setProject(tag.getProject());
        history.setNote(tag.getNote());
        history.setDesk(tag.getNote().getDesk());
        historyRepo.save(history);
    }
}
