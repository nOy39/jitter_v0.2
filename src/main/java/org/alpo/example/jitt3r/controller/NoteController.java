package org.alpo.example.jitt3r.controller;

import org.alpo.example.jitt3r.entity.Desk;
import org.alpo.example.jitt3r.entity.Note;
import org.alpo.example.jitt3r.entity.Project;
import org.alpo.example.jitt3r.entity.User;
import org.alpo.example.jitt3r.repos.MessageRepo;
import org.alpo.example.jitt3r.repos.NoteRepo;
import org.alpo.example.jitt3r.service.DeskService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;

import java.text.SimpleDateFormat;
import java.util.Date;

@Controller
@RequestMapping("/notes")
public class NoteController {


    @Autowired
    private MessageRepo messageRepo;

    @Autowired
    private NoteRepo noteRepo;

    @Autowired
    private DeskService deskService;

    @Value("${upload.path}")
    private String uploadPath;


    @PostMapping(value = "add")
    public String add(
            @AuthenticationPrincipal User user,
            @RequestParam Project project,
            @RequestParam Desk desk,
            @RequestParam String noteName,
            Model model) {

        SimpleDateFormat sDateFormat = new SimpleDateFormat("EEE, dd MMM yyyy, HH:mm");

        String date = sDateFormat.format(new Date());
        if (!noteName.equals("") || !StringUtils.isEmpty(noteName)) {
            Note note = new Note(noteName, date, user, desk, project);
            noteRepo.save(note);
        }

        return deskService.getUrl(project.getId());
    }

    @PostMapping(value = "/{note}")
    public String notesComplete(
            @PathVariable Note note,
            Model model) {
        note.setDone(true);
        noteRepo.save(note);
        return "redirect:/";
    }

    @PostMapping(value = "delete/{note}")
    public String notesDelete(
            @PathVariable Note note,
            Model model) {

        noteRepo.deleteById(note.getId());
        return "redirect:/";
    }

    @GetMapping(value = "{project}")
    public String deskNotes(
            Model model) {
        return "desk";
    }


}
