package org.alpo.example.sb_mustache.repos;

import org.alpo.example.sb_mustache.entity.Desk;
import org.alpo.example.sb_mustache.entity.Note;
import org.alpo.example.sb_mustache.entity.Project;
import org.alpo.example.sb_mustache.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface NoteRepo extends JpaRepository<Note, Long> {
    List<Project> findAllByDesk(Desk desk);
}
