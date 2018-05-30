package org.alpo.example.jitt3r.controller;

import org.alpo.example.jitt3r.entity.*;
import org.alpo.example.jitt3r.repos.*;
import org.alpo.example.jitt3r.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.util.Date;
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
    private CommentService commentService;

    @Autowired
    private HistoryService historyService;

    @Autowired
    private UploadFileRepo uploadFileRepo;

    @Autowired
    private NoteRepo noteRepo;

    @Autowired
    private TagRepo tagRepo;

    @Autowired
    private CommentRepo commentRepo;

    @Autowired
    private HistoryRepo historyRepo;

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
            Map<String, Object> model) {

        model.put("count",commentRepo.countAllByNote(note));
        model.put("histories",historyRepo.findAllByNoteOrderById(note));
        model.put("image",uploadFileRepo.findAllByNote(note));
        model.put("note", note);
        model.put("tags",tagRepo.findAllByProject(note.getProject()));
        model.put("comment",commentRepo.findAllByNoteOrderByDate(note));
        model.put("replies",commentRepo.findAllByNoteAndReplyIsNotNull(note));

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

        History history;
        if (!noteName.equals("") || !StringUtils.isEmpty(noteName)) {
            Note note = new Note(noteName, new Date(), user, desk, desk.getProject());
            noteRepo.save(note);
            historyService.saveCreatedNote(desk, note, user);
        }
        return deskService.getUrl(desk.getProject().getId());
    }

    /**
     * Добавляем описание к ноте
     * @param user
     * @param note
     * @param description
     * @param model
     * @return
     */
    @PostMapping(value = "description")
    public String notesDescription(
            @AuthenticationPrincipal User user,
            @RequestParam Note note,
            @RequestParam String description,
            Map<String, Object> model) {
        if (!description.equals("")) {
            note.setDescription(description);
            noteRepo.save(note);
            historyService.addDescriptionNote(note,user);
            }
        return "redirect:/notes/"+note.getId();
    }

    /**
     * Добавляем описание к ноте
     * @param user
     * @param note
     * @param model
     * @param file
     * @return
     */
    @PostMapping(value = "upload")
    public String notesAddBody(
            @AuthenticationPrincipal User user,
            @RequestParam Note note,
            Map<String, Object> model,
            @RequestParam("file") MultipartFile file) {

        UploadFile uploadFile;

        if (fileService.fileExists(file)) {
            uploadFile = fileService.upload(file,"notes");
            uploadFile.setOriginalName(file.getOriginalFilename());
            uploadFile.setNote(note);
            uploadFileRepo.save(uploadFile);

            historyService.uploadFile(uploadFile.getOriginalName(),note,user);
        }

        return "redirect:/notes/"+note.getId();

    }


    @PostMapping(value = "reply")
    public String replyMessage(
            @AuthenticationPrincipal User user,
            @RequestParam String message,
            @RequestParam Note note,
            @RequestParam Comment commentId,
            Model model) {

        if (commentService.checkMessage(message,user,note,commentId)) {

            historyService.replyToComment(note,user,commentId);
            return "redirect:/notes/"+note.getId();
        }

        return "redirect:/notes/"+note.getId();
    }

    @PostMapping(value = "comment")
    public String addMessage(
            @AuthenticationPrincipal User user,
            @RequestParam String comment,
            @RequestParam Note note,
            @RequestParam Comment commentId,
            Model model) {

        if (commentId == null && !comment.equals("")){
            if(commentService.addNewComment(comment, user, note)) {
                historyService.newCommentSave(user,note);
            }
        } else if (!comment.equals("")){
            commentService.addReply(comment, user, note, commentId);
            historyService.replyToComment(note,user,commentId);
        }

        return "redirect:/notes/"+note.getId();
    }




}
