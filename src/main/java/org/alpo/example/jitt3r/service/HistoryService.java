package org.alpo.example.jitt3r.service;

import org.alpo.example.jitt3r.entity.Desk;
import org.alpo.example.jitt3r.entity.History;
import org.alpo.example.jitt3r.entity.Note;
import org.alpo.example.jitt3r.entity.User;
import org.alpo.example.jitt3r.repos.HistoryRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;

@Service
public class HistorySevice {

    @Autowired
    HistoryRepo historyRepo;

    private History history;

    public void saveCreatedNote(Desk currentDesk, Note currentNote, User currentUser) {

        String message = currentUser.getUsername()+" created new note with name ";
        history = new History(message, new Date(),currentUser);
        history.setDesk(currentDesk);
        history.setProject(currentDesk.getProject());
        historyRepo.save(history);
    }
}
