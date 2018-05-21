package org.alpo.example.sb_mustache.repos;

import org.alpo.example.sb_mustache.entity.Project;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ProjectsRepo extends JpaRepository<Project, Long> {
}
