package org.alpo.example.jitt3r.controller;

import org.alpo.example.jitt3r.entity.Desk;
import org.alpo.example.jitt3r.entity.Note;
import org.alpo.example.jitt3r.entity.User;
import org.alpo.example.jitt3r.repos.MessageRepo;
import org.alpo.example.jitt3r.repos.NoteRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;

@Controller
@RequestMapping("/notes")
public class NoteController {


    @Autowired
    private MessageRepo messageRepo;

    @Autowired
    private NoteRepo noteRepo;

    @Value("${upload.path}")
    private String uploadPath;


    @PostMapping(value = "add")
    public String add(
            @AuthenticationPrincipal User user,
            @RequestParam Desk desk,
            @RequestParam String name,
            Model model) {

        SimpleDateFormat sDateFormat = new SimpleDateFormat("EEE, dd MMM yyyy, HH:mm");

        String date = sDateFormat.format(new Date());

        Note note = new Note();

        noteRepo.save(note);


        return "redirect:/";
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
