package org.alpo.example.sb_mustache.repos;

import org.alpo.example.sb_mustache.entity.Project;
import org.alpo.example.sb_mustache.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface ProjectsRepo extends JpaRepository<Project, Long> {
    Project findByUniqid(String code);
    List<Project> findAllByAuthor(User user);
    List<Project> findAllByisPublic(boolean isPublic);
}
