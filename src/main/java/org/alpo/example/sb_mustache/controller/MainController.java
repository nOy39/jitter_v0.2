package org.alpo.example.sb_mustache.controller;

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
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.Map;
import java.util.UUID;

/**
 * Created by @author OGI aka nOy39
 *
 * @Date 07.05.2018
 * @Time 14:53
 */
@Controller
public class MainController {

    @Autowired
    private NoteRepo noteRepo;

    @Value("${upload.path}")
    private String uploadPath;

    private String TITLE = "";


    @GetMapping("/")
    public String welcome(Model model) {
        Iterable<Note> notes;

        notes = noteRepo.findAll();
        model.addAttribute("notes", notes);

        return "main";
    }

}
