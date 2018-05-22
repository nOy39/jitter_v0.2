package org.alpo.example.sb_mustache.repos;

import org.alpo.example.sb_mustache.entity.Desk;
import org.alpo.example.sb_mustache.entity.Project;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface DeskRepo extends JpaRepository<Desk,Long> {
    List<Desk> findAllByProject(Project project);
}
