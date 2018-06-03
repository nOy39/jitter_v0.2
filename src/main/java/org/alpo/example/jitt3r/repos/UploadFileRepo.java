package org.alpo.example.jitt3r.repos;

import org.alpo.example.jitt3r.entity.Note;
import org.alpo.example.jitt3r.entity.Project;
import org.alpo.example.jitt3r.entity.UploadFile;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface UploadFileRepo extends JpaRepository<UploadFile, Long> {
    /**
     * Создаем список файлов <code>List <UploadFile></code> по заданной ноте
     * @param note - нота в которой делаем поиск файлов
     * @return - возвращаем список
     */
    List<UploadFile> findAllByNote(Note note);

    /**
     * Создаем список файлов <code>List <UploadFile></code> по заданному проекту,
     * используем для удаления проекта
     * @param project - проект по которому совершаем поиск
     * @return - возвращаем список UploadFile
     */
    List<UploadFile> findAllByProject(Project project);

    /**
     * Считаем количество загруженных файлов в ноту
     * @param note - Нота в которой делаем подсчет
     * @return - возвращаем число long
     */
    long countAllByNote(Note note);
}
