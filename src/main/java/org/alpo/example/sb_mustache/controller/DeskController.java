package org.alpo.example.sb_mustache.controller;

import org.alpo.example.sb_mustache.entity.Desk;
import org.alpo.example.sb_mustache.entity.Note;
import org.alpo.example.sb_mustache.entity.Project;
import org.alpo.example.sb_mustache.entity.User;
import org.alpo.example.sb_mustache.repos.DeskRepo;
import org.alpo.example.sb_mustache.repos.NoteRepo;
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

    @GetMapping("{project}")
    public String deskTemplateView(@PathVariable Project project,
                                   Model model) {
        List<Desk> desks = deskRepo.findAllByProject(project);
        model.addAttribute("desks",desks);
        model.addAttribute("project",project);
        return "desk";
    }

    @PostMapping("{project}")
    public String addDesk(@AuthenticationPrincipal User user,
                          @PathVariable Project project,
                          @RequestParam String deskName,
                          Model model) {

        Desk desk = new Desk(deskName,project);
        deskRepo.save(desk);
        return "redirect:/desk/{project}";

    }

    @PostMapping(value = "{desk}/note/add")
    public String addNote(@AuthenticationPrincipal User user,
                          @PathVariable Desk desk,
                          @RequestParam String addnote) {
        SimpleDateFormat sDateFormat = new SimpleDateFormat("EEE, dd MMM yyyy, HH:mm");

        String date = sDateFormat.format(new Date());

        Note note = new Note(addnote,false,date,5,user,desk);

        noteRepo.save(note);

        return "redirect:/";
    }

    @GetMapping("details/{desk}")
    public String deskEdit(@PathVariable Desk desk,
                           Model model) {
        return "deskedit";
    }

}
