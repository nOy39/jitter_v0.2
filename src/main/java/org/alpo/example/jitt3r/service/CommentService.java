package org.alpo.example.jitt3r.service;

import org.alpo.example.jitt3r.entity.Comment;
import org.alpo.example.jitt3r.entity.Note;
import org.alpo.example.jitt3r.entity.User;
import org.alpo.example.jitt3r.repos.CommentRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CommentService{

    @Autowired
    private CommentRepo commentRepo;

    public boolean checkMessage(String textarea, User user, Note note, String commentId) {

        boolean checkResult = false;

        Comment comment = new Comment();
        if (!textarea.equals("")) {
            comment.setMessage(textarea);
            comment.setAuthor(user);
            commentRepo.save(comment);
            checkResult = true;
        }
        return checkResult;
    }
}
