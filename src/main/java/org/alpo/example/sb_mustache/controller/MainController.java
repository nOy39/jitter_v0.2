package org.alpo.example.sb_mustache.controller;

import org.alpo.example.sb_mustache.entity.Note;
import org.alpo.example.sb_mustache.repos.NoteRepo;
import org.alpo.example.sb_mustache.service.MailSender;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

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

    @Autowired
    private MailSender mailSender;

    @Value("${upload.path}")
    private String uploadPath;

    private String TITLE = "";

    @GetMapping(value = "/")
    public String welcome(Model model) {


        return "main";
    }

    @GetMapping(value = "demo")
    public String demo(Model model) {

        return "demo";
    }

    @GetMapping(value = "note")
    public String note(Model model) {
        Iterable<Note> notes;

        notes = noteRepo.findAll();
        model.addAttribute("notes", notes);

        return "note";
    }

    @GetMapping(value = "contacts")
    public String test(Model model) {

        return "sendmail";
    }

    @PostMapping(value = "send")
    public String sendEmail(Model model,
                            @RequestParam String name,
                            @RequestParam String email,
                            @RequestParam String msg) {
        mailSender.send("a2lpo@yandex.ru","Email from Jitter, from "+name+", email: "+email,msg);
        model.addAttribute("message","Thank you. Your message was sending!");

        return "redirect:/";
    }

}
