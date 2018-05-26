package org.alpo.example.jitt3r.controller;

import org.alpo.example.jitt3r.entity.Comment;
import org.alpo.example.jitt3r.entity.Note;
import org.alpo.example.jitt3r.entity.UploadFile;
import org.alpo.example.jitt3r.entity.User;
import org.alpo.example.jitt3r.repos.CommentRepo;
import org.alpo.example.jitt3r.repos.UploadFileRepo;
import org.alpo.example.jitt3r.repos.NoteRepo;
import org.alpo.example.jitt3r.service.FileService;
import org.alpo.example.jitt3r.service.MailSender;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
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
//TODO Задокументировать нужные методы, лишнее удалить
@Controller
public class MainController {

    @Autowired
    private NoteRepo noteRepo;

    @Autowired
    private MailSender mailSender;

    @Autowired
    private UploadFileRepo uploadFileRepo;

    @Autowired
    private CommentRepo commentRepo;

    @Autowired
    private FileService fileService;

    private String TITLE = "";

    @GetMapping(value = "/")
    public String welcome(@AuthenticationPrincipal User user,
                          Model model) {

        model.addAttribute("comments",commentRepo.findAll());
        model.addAttribute("img",uploadFileRepo.findAll());
        model.addAttribute("user",user);

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

    /**
     * Метод загрузки файлов на сервер (ТЕСТОВЫЙ)
     * @param user
     * @param model
     * @param file
     * @return
     */
    @PostMapping(value = "/")
    public String addFile(
            @AuthenticationPrincipal User user,
            Map<String, Object> model,
            @RequestParam("file") MultipartFile file) {

        UploadFile uploadFile;

        if (file!=null && !file.getOriginalFilename().isEmpty()) {

            uploadFileRepo.save(fileService.upload(file));
        }



        return "main";
    }



    @PostMapping(value = "comment")
    public String addMessage(
            @AuthenticationPrincipal User user,
            @RequestParam String textarea, Model model) {

        String text = textarea;
        Comment comment = new Comment();

        if (!text.equals("")) {
            comment.setMessage(textarea);
            comment.setUser(user);
            commentRepo.save(comment);
        }
        return "redirect:/";
    }

    @GetMapping(value = "main")
    public String mainPage(
            @AuthenticationPrincipal User user,
            Model mosel) {

        return "rediz";
    }

}
