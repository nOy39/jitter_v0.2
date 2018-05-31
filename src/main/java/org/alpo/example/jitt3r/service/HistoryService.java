package org.alpo.example.jitt3r.service;

import org.alpo.example.jitt3r.entity.*;
import org.alpo.example.jitt3r.repos.HistoryRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;

@Service
public class HistoryService {

    @Autowired
    HistoryRepo historyRepo;

    private History history;

    public void saveCreatedNote(Desk currentDesk, Note currentNote, User currentUser) {

        String message = "Created new note.";
        history = new History(message, new Date(),currentUser);
        history.setNote(currentNote);
        history.setDesk(currentDesk);
        history.setProject(currentDesk.getProject());
        historyRepo.save(history);
    }

    public void addDescriptionNote(Note currentNote, User currentUser) {

        String message = "Added new description.";
        history = new History(message, new Date(),currentUser);
        history.setNote(currentNote);
        history.setDesk(currentNote.getDesk());
        history.setProject(currentNote.getProject());
        historyRepo.save(history);
    }

    public void uploadFile(String originalName, Note currentNote, User currentUser) {
        String message = "Uploaded new file";
        history = new History(message,new Date(),currentUser);
        history.setNote(currentNote);
        history.setDesk(currentNote.getDesk());
        history.setProject(currentNote.getProject());
        historyRepo.save(history);
    }

    public void replyToComment(Note currentNote, User currentUser, Comment commentId) {
        String message = "<u>"+currentUser.getUsername()+"</u> answer to <u>"+commentId.getAuthor().getUsername()+"</u> on message <small>ID:"+commentId.getId()+"</small>";
        history = new History(message,new Date(),currentUser);
        history.setNote(currentNote);
        history.setDesk(currentNote.getDesk());
        history.setProject(currentNote.getProject());
        historyRepo.save(history);
    }

    public void newCommentSave(User user, Note currentNote) {
        String message = "<u>"+user.getUsername()+"</u> added new comment.";
        history = new History(message, new Date(),user);
        history.setNote(currentNote);
        history.setDesk(currentNote.getDesk());
        history.setProject(currentNote.getProject());
        historyRepo.save(history);
    }

    public void createNewProject(Project currentProject, User author, boolean isPublic) {
        String message = "";
        if (isPublic) {
            message = "Create new public project";
        } else {
            message = "Create new private project";
        }
        history = new History(message, new Date(),author);
        history.setProject(currentProject);
        historyRepo.save(history);
    }

    public void deleteProject(Project currentProject) {
        String message = "Project ID:"+currentProject.getId()+", Name:"+currentProject.getProjectName()+", was delete user:"+currentProject.getAuthor().getUsername();
        history = new History(message, new Date(),currentProject.getAuthor());
        historyRepo.save(history);
    }
}
