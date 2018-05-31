package org.alpo.example.jitt3r.controller;

import org.alpo.example.jitt3r.entity.Project;
import org.alpo.example.jitt3r.entity.User;
import org.alpo.example.jitt3r.repos.ProjectRolesRepo;
import org.alpo.example.jitt3r.repos.ProjectsRepo;
import org.alpo.example.jitt3r.service.HistoryService;
import org.alpo.example.jitt3r.service.ProjectService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.Map;

@Controller
@RequestMapping(value = "projects")
public class ProjectController {

    @Autowired
    ProjectsRepo projectsRepo;

    @Autowired
    ProjectService projectService;

    @Autowired
    ProjectRolesRepo projectRolesRepo;

    @Autowired
    HistoryService historyService;

    @GetMapping
    public String projectList(@AuthenticationPrincipal User user,
                              Map<String, Object> model) {

        model = projectService.modelPut(user, model);

        return "projects";
    }

    @PostMapping
    public String createProject(@AuthenticationPrincipal User user,
                             @RequestParam String name,
                             @RequestParam String description,
                             @RequestParam String radioIsPublic,
                             Map<String, Object> model) {

        boolean isPublic = (radioIsPublic.equals("public"));
        Project project = new Project(name,
                description,
                projectService.getUID(),
                isPublic,
                projectService.getToday(),
                user);

        projectsRepo.save(project);
        historyService.createNewProject(project, user, isPublic);

        model = projectService.modelPut(user, model);
        model.put("message","Project "+name+" was created.");

        return "projects";
    }

    /**
     * Удаление проекта
     * @param user
     * @param project
     * @param projectName
     * @param model
     * @return
     */
    @PostMapping(value = "delete")
    public String deleteProject(@AuthenticationPrincipal User user,
                                @RequestParam Project project,
                                @RequestParam String projectName,
                                Map<String, Object> model) {

        boolean confirmDelete = (projectName.equals(project.getProjectName()));
        if (confirmDelete && user.getUsername()==project.getAuthor().getUsername()) {
            projectService.deleteProject(project, user);
            model = projectService.modelPut(user, model);
            model.put("message","Project "+projectName+" was deleted.");
            return "projects";
        }
        model = projectService.modelPut(user, model);
        model.put("message","Project "+projectName+" was not delete.");
        return "projects";

    }


    @GetMapping(value = "setting/{project}")
    public String settingProject(@AuthenticationPrincipal User user,
                                  @PathVariable Project project,
                                  Model model) {
        model.addAttribute("project",project);
        return "chatmessage";
    }

}
