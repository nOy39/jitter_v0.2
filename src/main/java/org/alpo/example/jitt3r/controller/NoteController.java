package org.alpo.example.jitt3r.controller;

import org.alpo.example.jitt3r.entity.Desk;
import org.alpo.example.jitt3r.entity.Note;
import org.alpo.example.jitt3r.entity.UploadFile;
import org.alpo.example.jitt3r.entity.User;
import org.alpo.example.jitt3r.repos.NoteRepo;
import org.alpo.example.jitt3r.repos.TagRepo;
import org.alpo.example.jitt3r.repos.UploadFileRepo;
import org.alpo.example.jitt3r.service.DeskService;
import org.alpo.example.jitt3r.service.FileService;
import org.alpo.example.jitt3r.service.NoteService;
import org.alpo.example.jitt3r.service.ToolService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.util.Map;

@Controller
@RequestMapping("notes")
public class NoteController {

    @Autowired
    private DeskService deskService;

    @Autowired
    private ToolService toolService;

    @Autowired
    private FileService fileService;

    @Autowired
    private NoteService noteService;

    @Autowired
    private UploadFileRepo uploadFileRepo;

    @Autowired
    private NoteRepo noteRepo;

    @Autowired
    private TagRepo tagRepo;

    @Value("${upload.path}")
    private String uploadPath;

    /**
     * noteView() - открывает Note(Нота)
     * @param note - нота со страницы Desk
     * @return - возвращает note.ftl
     */
    @GetMapping(value = "{note}")
    public String notesView(
            @PathVariable Note note,
            Model model) {

        model.addAttribute("image",uploadFileRepo.findAllByNote(note));
        model.addAttribute("note", note);
        model.addAttribute("tags",tagRepo.findAllByProject(note.getProject()));

        return "note";
    }

    /** @PostMapping
     * notesAdd() - Метод создает в таблице новый Note(Нота)
     * @param user - принимает на вход аутефинцированного юзера
     * @param  - Request-запрос принимает на вход Project(Проект),
     *               чтобы к ноте припилить в таблицу project_id
     *               для того, чтобы можно было потом перемещать ноту
     *                внутри проекта между Desk`ами
     * @param desk - Request-запрос принимает на вход Desk(Доска),
     *               чтобы к ноте припилить начальный desk_id,
     *               сортировка в проекте нот по доскам происходит
     *               по колонке из таблицы desk_id.
     * @param noteName - Request-запрос принимает на вход название ноты из
     *                 формы шаблона.
     * @param model - Модель.
     * @return - Возвращает страницу проекта. URL проекта формируется методом getUrl();
     */

    @PostMapping(value = "add")
    public String notesAdd(
            @AuthenticationPrincipal User user,
            @RequestParam Desk desk,
            @RequestParam String noteName,
            Model model) {


        if (!noteName.equals("") || !StringUtils.isEmpty(noteName)) {
            Note note = new Note(noteName, toolService.getToday(), user, desk, desk.getProject());
            noteRepo.save(note);
        }
        return deskService.getUrl(desk.getProject().getId());
    }

    @PostMapping(value = "{note}")
    public String notesAddBody(
            @AuthenticationPrincipal User user,
            @PathVariable Note note,
            @RequestParam String description,
            Map<String, Object> model,
            @RequestParam("file") MultipartFile file) {

        UploadFile uploadFile;

        if (fileService.fileExists(file)) {
            uploadFile = fileService.upload(file);
            uploadFile.setOriginalName(file.getOriginalFilename());
            uploadFile.setNote(note);
            uploadFileRepo.save(uploadFile);
        }
        String tempDescription = note.getDescription();
        if (!description.equals("") && !description.equals(tempDescription)) {
            note.setDescription(description);
            noteRepo.save(note);
        }
        return "redirect:/notes/"+note.getId();

    }




}
