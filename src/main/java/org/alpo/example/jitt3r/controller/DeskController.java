package org.alpo.example.jitt3r.controller;

import org.alpo.example.jitt3r.entity.Desk;
import org.alpo.example.jitt3r.entity.Note;
import org.alpo.example.jitt3r.entity.Project;
import org.alpo.example.jitt3r.entity.User;
import org.alpo.example.jitt3r.repos.DeskRepo;
import org.alpo.example.jitt3r.repos.NoteRepo;
import org.alpo.example.jitt3r.service.DeskService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;
//TODO Задокументировать нужные методы, лишнее удалить
//TODO Сделать удаление дески
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
        List<Note> notes = noteRepo.findAllByProject(project);

        model.addAttribute("isDeskForm",true);
        model.addAttribute("notes", notes);
        model.addAttribute("desks",desks);
        model.addAttribute("project",project);
        return "desk";
    }

    @PostMapping("add")
    public String addDesk(@AuthenticationPrincipal User user,

                          @RequestParam String deskName,
                            @RequestParam String style,
                            @RequestParam Project project,
                          Model model) {

        Desk desk = new Desk();
        desk.setName(deskName);
        desk.setClassStyle(style);
        desk.setProject(project);
        deskRepo.save(desk);

        return deskService.getUrl(project.getId());

    }


    @GetMapping("details/{desk}")
    public String deskEdit(@PathVariable Desk desk,
                           Model model) {
        return "deskedit";
    }


}
