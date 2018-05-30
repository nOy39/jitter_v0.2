package org.alpo.example.jitt3r.repos;

import org.alpo.example.jitt3r.entity.Desk;
import org.alpo.example.jitt3r.entity.History;
import org.alpo.example.jitt3r.entity.Note;
import org.alpo.example.jitt3r.entity.Project;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface HistoryRepo extends JpaRepository<History, Long> {

    List<History> findAllByProjectOrderById(Project project);
    List<History> findAllByDeskOrderById(Desk desk);
    List<History> findAllByNoteOrderById(Note note);
}
