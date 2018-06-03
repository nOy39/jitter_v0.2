package org.alpo.example.jitt3r.repos;

import org.alpo.example.jitt3r.entity.Note;
import org.alpo.example.jitt3r.entity.Project;
import org.alpo.example.jitt3r.entity.Tag;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface TagRepo extends JpaRepository<Tag, Long> {

    List<Tag> findAllByProject(Project project);
    List<Tag> findAllByNote(Note note);
}
