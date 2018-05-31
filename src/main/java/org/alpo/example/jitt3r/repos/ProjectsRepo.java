package org.alpo.example.jitt3r.repos;

import org.alpo.example.jitt3r.entity.Project;
import org.alpo.example.jitt3r.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;
import java.util.Set;

public interface ProjectsRepo extends JpaRepository<Project, Long> {
    Project findByUniqid(String code);
    List<Project> findAllByAuthor(User user);
    List<Project> findAllByPubl(boolean isPublic);
    List<Project> findAllByAuthorNotAndPublIsTrue(User user);

}
