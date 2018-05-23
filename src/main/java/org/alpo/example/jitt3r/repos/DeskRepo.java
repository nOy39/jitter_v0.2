package org.alpo.example.jitt3r.repos;

import org.alpo.example.jitt3r.entity.Desk;
import org.alpo.example.jitt3r.entity.Project;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface DeskRepo extends JpaRepository<Desk,Long> {
    List<Desk> findAllByProject(Project project);
}
