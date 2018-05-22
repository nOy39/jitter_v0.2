package org.alpo.example.sb_mustache.controller;

import org.alpo.example.sb_mustache.entity.Project;
import org.alpo.example.sb_mustache.entity.User;
import org.alpo.example.sb_mustache.repos.ProjectsRepo;
import org.alpo.example.sb_mustache.service.ProjectService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

@Controller
@RequestMapping(value = "projects")
public class ProjectController {

    @Autowired
    ProjectsRepo projectsRepo;

    @Autowired
    ProjectService projectService;

    @GetMapping
    public String projectList(@AuthenticationPrincipal User user, Model model) {

        model.addAttribute("projects", projectsRepo.findAllByAuthor(user));

        model.addAttribute("publ_projects",projectsRepo.findAllByisPublic(true));
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



        @GetMapping(value = "setting/${project}")
        public String saveEditProject(@RequestParam String name,
                @RequestParam String description,
                @RequestParam String deadline,
                @RequestParam String radioIsPublic,
                @RequestParam ("projectId") Project project,
                @AuthenticationPrincipal User user,
                Model model) {

            projectService.updateProject(project, user, name, description, deadline, radioIsPublic);

            return "redirect:/projects";
        }

    }
