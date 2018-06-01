package org.alpo.example.jitt3r.repos;

import org.alpo.example.jitt3r.entity.Desk;
import org.alpo.example.jitt3r.entity.History;
import org.alpo.example.jitt3r.entity.Note;
import org.alpo.example.jitt3r.entity.Project;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface HistoryRepo extends JpaRepository<History, Long> {

    /**
     * Найти все записи в таблице истории по заданной ноте и отсортировать по колонке
     * создания в обратном порядке
     * @param note - принимаемый параметр текущая нота
     * @return - возвращает коллекцию Histories
     */
    List<History> findAllByNoteOrderByCreatedDesc(Note note);

    /**
     * Найти все записи в таблице истории в которых есть project_id
     * и выгрузить их в коллекцию.
     * @param project - принимаемый параметр проект
     * @return - выгружает в коллекцию Histories
     */
    List<History> findAllByProject(Project project);


    List<History> findAllByProjectOrderById(Project project);
    List<History> findAllByDeskOrderById(Desk desk);
    List<History> findAllByNoteOrderById(Note note);
    List<History> removeAllByProject(Project project);
}
