package org.alpo.example.jitt3r.service;

import org.alpo.example.jitt3r.entity.Comment;
import org.alpo.example.jitt3r.entity.Note;
import org.alpo.example.jitt3r.entity.User;
import org.alpo.example.jitt3r.repos.CommentRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.Period;
import java.time.temporal.ChronoUnit;
import java.util.Iterator;
import java.util.List;

/**
 * TODO Задокументировать методы
 */
@Service
public class CommentService{

    @Autowired
    private CommentRepo commentRepo;

    /**
     *
     * @param message
     * @param user
     * @param note
     * @param commentId
     * @return
     */
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

    /**
     *
     * @param comment
     * @param author
     * @param currentNote
     * @return
     */
    public boolean addNewComment(String comment, User author, Note currentNote) {

        Comment newComment = new Comment();
        newComment.setAuthor(author);
        newComment.setMessage(comment);
        newComment.setNote(currentNote);
        newComment.setDate(LocalDateTime.now());
        newComment.setLikes(0);
        newComment.setDislikes(0);
        newComment.setProject(currentNote.getProject());
        commentRepo.save(newComment);

        return true;
    }

    /**
     *
     * @param comment
     * @param author
     * @param note
     * @param commentId
     */
    public void addReply(String comment, User author, Note note, Comment commentId) {

        Comment newComment = new Comment();
        newComment.setAuthor(author);
        newComment.setMessage(comment);
        newComment.setNote(note);
        newComment.setReply(commentId);
        newComment.setDate(LocalDateTime.now());
        newComment.setLikes(0);
        newComment.setDislikes(0);
        newComment.setProject(note.getProject());
        commentRepo.save(newComment);
    }

    /**
     *
     * @param comment
     * @return
     */
    public List<Comment> setDifference(List<Comment> comment) {
        Iterator<Comment> commentIterator = comment.iterator();
        while (commentIterator.hasNext()) {
            Comment itteration = commentIterator.next();
            itteration.setDifference(differenceDate(itteration.getDate()));
        }
        return comment;
    }

    /**
     *
     * @param createDay
     * @return
     */
    private String differenceDate(LocalDateTime createDay) {
        String message = "";
        LocalDateTime today = LocalDateTime.now();

        long years = ChronoUnit.YEARS.between(createDay,today);
        long month = ChronoUnit.MONTHS.between(createDay,today);
        long days = ChronoUnit.DAYS.between(createDay,today);
        long hours = ChronoUnit.HOURS.between(createDay,today);
        long minutes = ChronoUnit.MINUTES.between(createDay,today);

        if (years>0 || month>0 || days>0) {
            message = createString(years,month,days);
        } else {
            if (hours>0) {
                message = minutes/60+" hours, "+minutes%60+" minutes ago.";
            } else {
                message = minutes+" minutes ago.";
            }
        }
        return message;
    }

    /**
     *
     * @param years
     * @param month
     * @param days
     * @return
     */
    private String createString(long years, long month, long days) {
        String message = "";
        if (years>1) {
            message = years+" years ago.";
        } else {
            if (years > 0) {
                if (month%12!=0)
                message = month/12 + " year, "+month%12+" month ago.";
                else {
                    message = month/12 + " year ago.";
                }
            } else {
                if (month > 0) {
                    message = month + " month ago.";
                } else {
                    message = message + days + " days ago.";
                }
            }
        }
            return message;
        }

        /**
         *
         * @param createDay
         * @return
         */

    }
