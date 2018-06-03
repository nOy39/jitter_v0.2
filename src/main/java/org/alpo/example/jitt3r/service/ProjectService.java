package org.alpo.example.jitt3r.service;

import org.alpo.example.jitt3r.entity.*;
import org.alpo.example.jitt3r.repos.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.util.List;
import java.util.Map;
import java.util.UUID;

@Service
public class ProjectService {


    private History history;

    @Autowired
    private ProjectsRepo projectsRepo;

    @Autowired
    private UserRepo userRepo;

    @Autowired
    private NoteRepo noteRepo;

    @Autowired
    private DeskRepo deskRepo;

    @Autowired
    private HistoryRepo historyRepo;

    @Autowired
    private UploadFileRepo uploadFileRepo;

    @Autowired
    private CommentRepo commentRepo;

    @Autowired
    private TagRepo tagRepo;

    @Autowired
    private HistoryService historyService;

    @Autowired
    private ProjectRolesRepo projectRolesRepo;

    /**
     * Берем текущую дату из системы
     * @return возвращаем текущую дату.
     */
    public LocalDate getToday() {
        return LocalDate.now();
    }

    /**
     * Создаем динамический UIN
     * @return
     */
    public String getUID() {
        return UUID.randomUUID().toString();
    }

    /**
     * Метод удаления проекта, перед удалением проекта удаляет все записи из таблиц в которых есть
     * ссылка на этот проект.
     * @param currentProject - проект который подлежит удалению
     * @param author - автор проекта. (не используется возможно будет удален из метода)
     */
    public void deleteProject(Project currentProject, User author) {

        List<History> historyList = historyRepo.findAllByProject(currentProject);
        List<Comment> commentList = commentRepo.findAllByProject(currentProject);
        List<UploadFile> uploadFileList = uploadFileRepo.findAllByProject(currentProject);
        List<Tag> tagList = tagRepo.findAllByProject(currentProject);
        List<Note> noteList = noteRepo.findAllByProject(currentProject);
        List<Desk> deskList = deskRepo.findAllByProject(currentProject);
        List<ProjectRole> projectRoleList = projectRolesRepo.findAllByProject(currentProject);

        historyRepo.deleteAll(historyList);
        commentRepo.deleteAll(commentList);
        uploadFileRepo.deleteAll(uploadFileList);
        tagRepo.deleteAll(tagList);
        noteRepo.deleteAll(noteList);
        deskRepo.deleteAll(deskList);
        projectRolesRepo.deleteAll(projectRoleList);

        historyService.deleteProject(currentProject);

        projectsRepo.delete(currentProject);
    }

    /**
     * Метод заполнения Map model, для возвращения на страницы после действий
     * @PostMapping - контроллеров
     * @param user - Авторизированный пользователь
     * @param model - коллекция типа MAP которая вернется на страницу
     * @return - возвращает коллекцию Map model<code><String, Object></code>
     */
    public Map modelPut(@AuthenticationPrincipal User user, Map<String, Object> model) {
        model.put("projects", projectsRepo.findAllByAuthor(user));
        model.put("publProjects",projectsRepo.findAllByAuthorNotAndPublIsTrue(user));
        model.put("shareProject", projectRolesRepo.findAllByAuthor(user));
        model.put("PublicOther", projectsRepo.findAllByAuthorNotAndPublIsTrue(user));
        return model;
    }

    /**
     * Метод записывает приглашённого пользователя в таблицу ProjectRole
     * и устанавливает проекту статус "isShare" = true
     * @param inviteUsers - приглашённый пользователь
     * @param project - проект который расшариваем
     */
    public void shareProject(User inviteUsers, Project project) {
        ProjectRole projectRole = new ProjectRole(project, inviteUsers);
        project.setShare(true);
        projectsRepo.save(project);
        projectRolesRepo.save(projectRole);
    }
}
