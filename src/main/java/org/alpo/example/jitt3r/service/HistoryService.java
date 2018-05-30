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

        String message = " created new note with name ";
        history = new History(message, new Date(),currentUser);
        history.setNote(currentNote);
        history.setDesk(currentDesk);
        history.setProject(currentDesk.getProject());
        historyRepo.save(history);
    }

    public void addDescriptionNote(Note currentNote, User currentUser) {

        String message = " created description in ";
        history = new History(message, new Date(),currentUser);
        history.setNote(currentNote);
        history.setDesk(currentNote.getDesk());
        history.setProject(currentNote.getProject());
        historyRepo.save(history);
    }

    public void uploadFile(String originalName, Note currentNote, User currentUser) {
        String message = " uploaded "+originalName+" file to ";
        history = new History(message,new Date(),currentUser);
        history.setNote(currentNote);
        history.setDesk(currentNote.getDesk());
        history.setProject(currentNote.getProject());
        historyRepo.save(history);
    }

    public void replyToComment(Note currentNote, User currentUser, Comment commentId) {
        String message = "answer to "+commentId.getAuthor().getUsername()+" on his message ID:"+commentId.getId();
        history = new History(message,new Date(),currentUser);
        history.setNote(currentNote);
        history.setDesk(currentNote.getDesk());
        history.setProject(currentNote.getProject());
        historyRepo.save(history);
    }

    public void newCommentSave(User user, Note currentNote) {
        String message = " added new comment at";
        history = new History(message, new Date(),user);
        history.setNote(currentNote);
        history.setDesk(currentNote.getDesk());
        history.setProject(currentNote.getProject());
        historyRepo.save(history);
    }
}
