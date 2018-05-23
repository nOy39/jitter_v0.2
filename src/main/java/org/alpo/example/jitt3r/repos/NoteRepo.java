package org.alpo.example.jitt3r.repos;

import org.alpo.example.jitt3r.entity.Desk;
import org.alpo.example.jitt3r.entity.Note;
import org.alpo.example.jitt3r.entity.Project;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface NoteRepo extends JpaRepository<Note, Long> {
    List<Project> findAllByDesk(Desk desk);

    List<Note> findAllByProject(Project project);
}
