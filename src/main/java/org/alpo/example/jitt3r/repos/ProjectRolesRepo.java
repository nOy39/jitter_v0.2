package org.alpo.example.jitt3r.repos;

import org.alpo.example.jitt3r.entity.ProjectRole;
import org.alpo.example.jitt3r.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface ProjectRolesRepo extends JpaRepository<ProjectRole, Long> {
    List<ProjectRole> findAllByAuthor(User user);
}
