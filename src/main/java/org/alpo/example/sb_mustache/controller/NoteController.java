package org.alpo.example.sb_mustache.controller;

import org.alpo.example.sb_mustache.entity.Note;
import org.alpo.example.sb_mustache.entity.User;
import org.alpo.example.sb_mustache.repos.NoteRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;

@Controller
@RequestMapping("/notes")
public class NoteController {

    @Autowired
    private NoteRepo noteRepo;

    @PostMapping(value = "/add")
    public String add(
            @AuthenticationPrincipal User user,
            @RequestParam String text, Map<String, Object> model) {

        SimpleDateFormat sDateFormat = new SimpleDateFormat("EEE, dd MMM yyyy, HH:mm");

        String date = sDateFormat.format(new Date());

        Note note = new Note(text, 5,false, date,user);

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

}
