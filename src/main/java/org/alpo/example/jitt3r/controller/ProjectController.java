package org.alpo.example.jitt3r.controller;

import org.alpo.example.jitt3r.entity.Project;
import org.alpo.example.jitt3r.entity.User;
import org.alpo.example.jitt3r.repos.ProjectRolesRepo;
import org.alpo.example.jitt3r.repos.ProjectsRepo;
import org.alpo.example.jitt3r.service.ProjectService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.text.SimpleDateFormat;
import java.util.Date;
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

    @GetMapping
    public String projectList(@AuthenticationPrincipal User user,
                              Map<String, Object> model) {

        model.put("projects", projectsRepo.findAllByAuthor(user));

        model.put("publProjects",projectsRepo.findAllByPubl(true));

        model.put("shareProject", projectRolesRepo.findAllByAuthor(user));
        return "projects";
    }

    @GetMapping(value = "add")
    public String addProjectTemplate(@AuthenticationPrincipal User user, Model model) {
        return "add";
    }

    @PostMapping(value = "add")
    public String addProject(@AuthenticationPrincipal User user,
                             @RequestParam String name,
                             @RequestParam String description,
                             @RequestParam String deadline,
                             @RequestParam String radioIsPublic,
                             Model model) {

        SimpleDateFormat sformat = new SimpleDateFormat("yyyy.MM.dd");
        String dateForm = projectService.getDeadlineDate(deadline);

        boolean chekingDate = (sformat.format(new Date()).compareTo(dateForm)<0);
        boolean isPublic = (radioIsPublic.equals("public"));
        System.out.println("today: "+projectService.getToday()+"\n form date: "+dateForm);
        System.out.println(chekingDate);
        if (chekingDate) {
            Project project = new Project(name,
                    description,
                    projectService.getUID(),
                    isPublic,
                    projectService.getToday(),
                    dateForm,
                    user);

            projectsRepo.save(project);
        }

        model.addAttribute("messageDateError","Error date");

        return "add";
    }

    @GetMapping(value = "setting/{project}")
    public String settingProject(@AuthenticationPrincipal User user,
                                  @PathVariable Project project,
                                  Model model) {
        model.addAttribute("project",project);
        return "chatmessage";
    }

}
