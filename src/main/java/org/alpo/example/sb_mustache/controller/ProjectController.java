package org.alpo.example.sb_mustache.controller;

import org.alpo.example.sb_mustache.entity.Project;
import org.alpo.example.sb_mustache.entity.User;
import org.alpo.example.sb_mustache.repos.ProjectsRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.jws.WebParam;
import java.util.UUID;

@Controller
@RequestMapping(value = "projects")
public class ProjectController {

    @Autowired
    ProjectsRepo projectsRepo;

    @GetMapping
    public String projectList(@AuthenticationPrincipal User user, Model model) {

        model.addAttribute("projects", projectsRepo.findAll());
        return "projects";
    }

    @GetMapping(value = "add")
    public String addProjectTemplate(@AuthenticationPrincipal User user, Model model) {
        return "add";
    }

    @PostMapping(value = "add")
    public String addProject(@AuthenticationPrincipal User user,
                             @RequestParam String name,
                             Model model) {
        Project project = new Project(name,UUID.randomUUID().toString(),user);
        projectsRepo.save(project);
        return "projects";
    }

}
