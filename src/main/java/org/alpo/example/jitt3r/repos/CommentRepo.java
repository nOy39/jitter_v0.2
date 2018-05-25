package org.alpo.example.jitt3r.repos;

import org.alpo.example.jitt3r.entity.Comment;
import org.alpo.example.jitt3r.entity.Note;
import org.alpo.example.jitt3r.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;


public interface CommentRepo extends JpaRepository <Comment, Long> {
    List<Comment> findAllByNote(Note note);
    List<Comment> findAllByUser(User user);
}
