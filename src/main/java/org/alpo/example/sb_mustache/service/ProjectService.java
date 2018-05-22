package org.alpo.example.sb_mustache.service;

import org.alpo.example.sb_mustache.entity.Project;
import org.alpo.example.sb_mustache.entity.User;
import org.alpo.example.sb_mustache.repos.ProjectsRepo;
import org.alpo.example.sb_mustache.repos.UserRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

@Service
public class ProjectService {

    @Autowired
    private static ProjectsRepo projectsRepo;

    @Autowired
    private static UserRepo userRepo;

    public String getToday() {
        SimpleDateFormat dateFormat = new SimpleDateFormat("dd.MM.yyyy");
        return dateFormat.format(new Date());
    }

    public void updateProject(Project project, User user, String name, String description, String deadline, String radioIsPublic) {
        String projectName = project.getPrj_name();
        String descript = project.getDescription();
        if (name.equals("")) {
            project.setPrj_name(projectName);
        }


//        if (isNameChanged) {
//            project.setPrj_name(name);
//        }

        if (StringUtils.isEmpty(description)) {
            project.setDescription(descript);
        } else {
            project.setDescription(description);
        }
        project.setDeadlineDate(deadline);
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
}
