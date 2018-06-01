package org.alpo.example.jitt3r.controller;

import org.alpo.example.jitt3r.entity.Project;
import org.alpo.example.jitt3r.entity.ProjectRole;
import org.alpo.example.jitt3r.entity.User;
import org.alpo.example.jitt3r.repos.ProjectRolesRepo;
import org.alpo.example.jitt3r.repos.ProjectsRepo;
import org.alpo.example.jitt3r.repos.UserRepo;
import org.alpo.example.jitt3r.service.HistoryService;
import org.alpo.example.jitt3r.service.ProjectService;
import org.alpo.example.jitt3r.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.Map;

@Controller
@RequestMapping(value = "projects")
public class ProjectController {

    @Autowired
    ProjectsRepo projectsRepo;

    @Autowired
    ProjectService projectService;

    @Autowired
    ProjectRolesRepo projectRolesRepo;

    @Autowired
    HistoryService historyService;

    @Autowired
    UserService userService;

    @Autowired
    UserRepo userRepo;

    /**
     * Отображает страницу "Project" c проектами доступными пользователю
     * @param user - авторизованый пользователь
     * @param model - модель
     * @return - возвращает страницу "projects"
     */
    @GetMapping
    public String projectList(@AuthenticationPrincipal User user,
                              Map<String, Object> model) {

        model = projectService.modelPut(user, model);
        return "projects";
    }

    /**
     * Создает пустой проект. И записывает в history о создании.
     * @param user - авторизированный пользователь, который станет автором проета
     * @param name - имя проета
     * @param description - описание
     * @param radioIsPublic - тип видимости проета, если проект публичный,
     *                      то его могут видеть другие пользователи системы,
     *                      не внося изменения
     * @param model - возвращаемая модель
     * @return - возвращает страницу "projects" с сообщением о выполнении.
     */
    @PostMapping
    public String createProject(@AuthenticationPrincipal User user,
                                @RequestParam String name,
                                @RequestParam String description,
                                @RequestParam String radioIsPublic,
                                Map<String, Object> model) {
        String message = "";
        if (!name.equals("")) {
            boolean isPublic = (radioIsPublic.equals("public"));
            Project project = new Project(name,
                    description,
                    projectService.getUID(),
                    isPublic,
                    projectService.getToday(),
                    user);

            projectsRepo.save(project);
            historyService.createNewProject(project, user, isPublic);
            message = "Project "+name+" was created.";
        } else {
            message = "Project can't be without name.";
        }
        model = projectService.modelPut(user, model);
        model.put("message",message);

        return "projects";
    }

    /**
     * Расшаривание проекта для доступа другим пользователям для совместной работы,
     * доступ предоставляет автор проекта.
     * Если, находим пользователя методом findByUsername(username) расшариваем
     * проект для доступа этому пользователю. записываем действия в историю
     * и выводим сообщение о результате выполнения.
     * @param user - авторизованный пользователь
     * @param project - проет к которому даем доступ
     * @param username - пользователь которому предоставляем доступ
     * @param model - модель
     * @return - возвращаем страницу "projects" с сообщением о выполнении метода.
     */
    @PostMapping(value = "share")
    public String shareProject(@AuthenticationPrincipal User user,
                               @RequestParam Project project,
                               @RequestParam String username,
                               Map<String, Object> model) {

        String message = "";
        User inviteUsers = userRepo.findByUsername(username);
        ProjectRole projectRole = projectRolesRepo.findByAuthorAndProject(inviteUsers,project);


        if (projectRole==null) {

            if (user.getUsername().equals(project.getAuthor().getUsername())) {

                if (inviteUsers != null) {
                    projectService.shareProject(inviteUsers, project);
                    historyService.projectShared(user, project, username);
                    message = username + " was invoke to <b>" + project.getProjectName() + "</b> project.";
                } else {
                    message = username + " not found.";
                }
            } else {
                message = "Only author project can invoke other users";
            }
        } else {
            message = "This user was added to this project some time ago.";
        }
        model = projectService.modelPut(user, model);
        model.put("message",message);
        return "projects";
    }


    /**
     * Удаление проекта метод проверяет подтверждение от пользователя
     * и то что пользователь автор этого проекта, обращается к методу
     * deleteProject(),
     * @param user - юзер который обратился к контроллеру
     * @param project - проект который мы хотим удалить
     * @param projectName - подтверждение удаления путем ввода имени проекта
     * @param model - модель
     * @return - возвращает сообщение о результате выполнения и странице projects
     */
    @PostMapping(value = "delete")
    public String deleteProject(@AuthenticationPrincipal User user,
                                @RequestParam Project project,
                                @RequestParam String projectName,
                                Map<String, Object> model) {

        boolean confirmDelete = (projectName.equals(project.getProjectName())
                && user.getUsername().equals(project.getAuthor().getUsername()));
        String message = "";

        if (confirmDelete) {
            projectService.deleteProject(project, user);
            message = "Project "+projectName+" was deleted.";

        } else {
            message = "Project "+projectName+" was not delete.";
        }

        model = projectService.modelPut(user, model);
        model.put("message", message);
        return "projects";

    }

    /**
     * Переименование проекта и изменение описания.
     * @param user авторизированный пользователь
     * @param project - проект который переименовываем
     * @param projectName - новое название проекта приходящее с формы
     * @param description - новое описание проекта приходящего с формы
     * @param model - возвращаемая модель страницы
     * @return - возвращает сообщение о результате выполнения и странице projects
     */
    @PostMapping(value = "rename")
    public String renameProject(@AuthenticationPrincipal User user,
                                @RequestParam Project project,
                                @RequestParam String projectName,
                                @RequestParam String description,
                                Map<String, Object> model) {
        String message = "";

        String oldName = project.getProjectName();
        String oldDescription = project.getDescription();

        if (projectName.equals("")) {
            project.setProjectName(oldName);
            message = "Project name no changed! ";
        } else {
            project.setProjectName(projectName);
            historyService.projectRenamed(user, project, projectName);
            message = "Project name was changed! ";
        }

        if (description.equals("")) {
            project.setDescription(oldDescription);
            message = message+"Description no changed!";
        } else {
            project.setDescription(description);
            historyService.prjectChangeDescription(user, project);
            message = message + "Description was changed!";
        }

        projectsRepo.save(project);
        model = projectService.modelPut(user, model);
        model.put("message", message);
        return "projects";

    }

    @GetMapping(value = "userlist/{project}")
    public String userList(@AuthenticationPrincipal User user,
                           @PathVariable Project project,
                           Map<String, Object> model) {
        model.put("users",projectRolesRepo.findAllByProject(project));
        model.put("projec",project);

        return "listusers";
    }

}
