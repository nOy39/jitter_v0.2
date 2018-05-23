package org.alpo.example.sb_mustache.controller;

import org.alpo.example.sb_mustache.entity.Desk;
import org.alpo.example.sb_mustache.entity.Note;
import org.alpo.example.sb_mustache.entity.Project;
import org.alpo.example.sb_mustache.entity.User;
import org.alpo.example.sb_mustache.repos.DeskRepo;
import org.alpo.example.sb_mustache.repos.NoteRepo;
import org.alpo.example.sb_mustache.service.DeskService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping(value = "desk")
public class DeskController {

    @Autowired
    DeskRepo deskRepo;

    @Autowired
    NoteRepo noteRepo;

    @Autowired
    DeskService deskService;

    @GetMapping("{project}/list/")
    public String deskTemplateView(@PathVariable Project project,
                                   Model model) {
        List<Desk> desks = deskRepo.findAllByProject(project);
        model.addAttribute("desks",desks);
        model.addAttribute("project",project);
        return "desk";
    }

    @PostMapping("add")
    public String addDesk(@AuthenticationPrincipal User user,
                          @RequestParam Project project,
                          @RequestParam String deskName,
                          Model model) {

        Desk desk = new Desk(deskName,project);
        deskRepo.save(desk);

        return deskService.getUrl(project.getId());

    }


    @GetMapping("details/{desk}")
    public String deskEdit(@PathVariable Desk desk,
                           Model model) {
        return "deskedit";
    }

    @PostMapping(value = "delete")
    public String deskDelete(@RequestParam Desk desk,
                             @RequestParam Project project,
                             Model model) {
        deskRepo.delete(desk);

        return deskService.getUrl(project.getId());
    }

    @PostMapping(value = "uppriority")
    public String deskUpper(@RequestParam Desk desk,
                             @RequestParam Project project,
                             Model model) {
        desk.setImportant(true);

        deskRepo.save(desk);

        return deskService.getUrl(project.getId());
    }

    @PostMapping(value = "complete")
    public String deskComplete(@RequestParam Desk desk,
                            @RequestParam Project project,
                            Model model) {
        desk.setComplete(true);

        deskRepo.save(desk);
        System.out.println(desk);
        return deskService.getUrl(project.getId());
    }
}
