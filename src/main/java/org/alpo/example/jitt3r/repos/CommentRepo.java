package org.alpo.example.jitt3r.repos;

import org.alpo.example.jitt3r.entity.Comment;
import org.alpo.example.jitt3r.entity.Note;
import org.alpo.example.jitt3r.entity.Project;
import org.alpo.example.jitt3r.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;
import java.util.Set;

/**
 *
 */
public interface CommentRepo extends JpaRepository <Comment, Long> {
    /**
     * TODO: исключить метод findAllByMessageIsNotNullOrderById()
     * Метод временный будет удален
     * @return
     */
    List<Comment> findAllByMessageIsNotNullOrderById();
    /**
     * TODO: исключить метод findAllByReplyIsNotNull()
     * Метод временный будет удален
     * @return
     */
    List<Comment> findAllByReplyIsNotNull();

    /**
     * Метод находит все кооментарии в конкретно заданной ноте и сортирует их по дате написания
     * @param note - принимаемый параметр, нота в которой мы ищем коментарии
     * @return - возвращает список Comment
     */
    List<Comment> findAllByNoteOrderByDate(Note note);

    /**
     * Находит все сообщения в конкретно заданной ноте, в которых колонка Reply не NULL
     * для формирования рекурсивного списка ответов на сообщения
     * @param note - принимаемый параметр, нота в которой мы ищем коментарии
     * @return - возвращает список Comment
     */
    List<Comment> findAllByNoteAndReplyIsNotNull(Note note);

    /**
     * Находит все сообщения относящиеся к конкретному проекту, используется для удаления проекта
     * @param project - принимаемый параметр
     * @return - возвращает список сообщений в которых project_id равен project
     */
    List<Comment> findAllByProject(Project project);

    /**
     * Метод выводит количество записей в таблице по конкретной ноте
     * @param note - принимаемый параметр, нота в которой мы ищем коментарии
     * @return возвращает число типа long
     */
    long countAllByNote(Note note);
}
