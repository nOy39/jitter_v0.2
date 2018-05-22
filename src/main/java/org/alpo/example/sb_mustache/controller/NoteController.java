package org.alpo.example.sb_mustache.controller;

import org.alpo.example.sb_mustache.entity.Desk;
import org.alpo.example.sb_mustache.entity.Message;
import org.alpo.example.sb_mustache.entity.Note;
import org.alpo.example.sb_mustache.entity.User;
import org.alpo.example.sb_mustache.repos.MessageRepo;
import org.alpo.example.sb_mustache.repos.NoteRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;
import java.util.UUID;

@Controller
@RequestMapping("/notes")
public class NoteController {


    @Autowired
    private MessageRepo messageRepo;

    @Autowired
    private NoteRepo noteRepo;

    @Value("${upload.path}")
    private String uploadPath;


    @PostMapping(value = "addDesk")
    public String add(
            @AuthenticationPrincipal User user,
            @RequestParam String addNote, Map<String, Object> model) {

        SimpleDateFormat sDateFormat = new SimpleDateFormat("EEE, dd MMM yyyy, HH:mm");

        String date = sDateFormat.format(new Date());

        Note note = new Note();

        noteRepo.save(note);

        Iterable<Note> notes = noteRepo.findAll();

        model.put("messages", notes);

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
