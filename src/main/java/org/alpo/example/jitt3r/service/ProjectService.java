package org.alpo.example.jitt3r.service;

import org.alpo.example.jitt3r.entity.*;
import org.alpo.example.jitt3r.repos.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

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

    public LocalDate getToday() {
        return LocalDate.now();
    }

    public void updateProject(Project project, User user, String name, String description, String deadline, String radioIsPublic) {
        String projectName = project.getProjectName();
        String descript = project.getDescription();
        if (name.equals("")) {
            project.setProjectName(projectName);
        }


//        if (isNameChanged) {
//            project.setProjectName(name);
//        }

        if (StringUtils.isEmpty(description)) {
            project.setDescription(descript);
        } else {
            project.setDescription(description);
        }
        project.setAuthor(user);
        System.out.println(project);
        projectsRepo.save(project);

    }

    public String getUID() {
        return UUID.randomUUID().toString();
    }

    public String getDeadlineDate(String deadline) {
        System.out.println(deadline);
        String year = deadline.substring(0,4);
        String month = deadline.substring(5,7);
        String day = deadline.substring(8,10);
        System.out.println(day+"."+month+"."+year);
        return day+"."+month+"."+year;
    }

    public void deleteProject(Project currentProject, User author) {
        System.out.println(currentProject.getProjectName()+" will be delete "+author.getUsername());
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

    public Map modelPut(@AuthenticationPrincipal User user, Map<String, Object> model) {
        model.put("projects", projectsRepo.findAllByAuthor(user));
        model.put("publProjects",projectsRepo.findAllByAuthorNotAndPublIsTrue(user));
        model.put("shareProject", projectRolesRepo.findAllByAuthor(user));
        model.put("PublicOther", projectsRepo.findAllByAuthorNotAndPublIsTrue(user));
        return model;
    }

}
