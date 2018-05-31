package org.alpo.example.jitt3r.service;

import org.alpo.example.jitt3r.entity.Comment;
import org.alpo.example.jitt3r.entity.Note;
import org.alpo.example.jitt3r.entity.User;
import org.alpo.example.jitt3r.repos.CommentRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.util.Date;

@Service
public class CommentService{

    @Autowired
    private CommentRepo commentRepo;

    public boolean checkMessage(String message, User user, Note note, Comment commentId) {

        boolean checkResult = false;

        Comment reply = new Comment();
        if (!message.equals("")) {
            reply.setMessage(message);
            reply.setAuthor(user);
            reply.setReply(commentId);
            reply.setNote(note);
            commentRepo.save(reply);
            checkResult = true;
        }
        return checkResult;
    }

    public boolean addNewComment(String comment, User author, Note currentNote) {

        Comment newComment = new Comment();
        newComment.setAuthor(author);
        newComment.setMessage(comment);
        newComment.setNote(currentNote);
        newComment.setDate(LocalDate.now());
        newComment.setLikes(0);
        newComment.setDislikes(0);
        newComment.setProject(currentNote.getProject());
        commentRepo.save(newComment);

        return true;
    }

    public void addReply(String comment, User author, Note note, Comment commentId) {

        Comment newComment = new Comment();
        newComment.setAuthor(author);
        newComment.setMessage(comment);
        newComment.setNote(note);
        newComment.setReply(commentId);
        newComment.setDate(LocalDate.now());
        newComment.setLikes(0);
        newComment.setDislikes(0);
        newComment.setProject(note.getProject());
        commentRepo.save(newComment);
    }
}
