package org.alpo.example.jitt3r.repos;

import org.alpo.example.jitt3r.entity.Comment;
import org.alpo.example.jitt3r.entity.Note;
import org.alpo.example.jitt3r.entity.Project;
import org.alpo.example.jitt3r.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;
import java.util.Set;


public interface CommentRepo extends JpaRepository <Comment, Long> {
    List<Comment> findAllByMessageIsNotNullOrderById();
    List<Comment> findAllByReplyIsNotNull();
    List<Comment> findAllByNoteOrderByDate(Note note);
    List<Comment> findAllByNoteAndReplyIsNotNull(Note note);

    List<Comment> findAllByProject(Project project);

    long countAllByNote(Note note);
}
