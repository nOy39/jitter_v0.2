package org.alpo.example.jitt3r.repos;

import org.alpo.example.jitt3r.entity.Note;
import org.alpo.example.jitt3r.entity.UploadFile;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface UploadFileRepo extends JpaRepository<UploadFile, Long> {

    List<UploadFile> findAllByNote(Note note);
}
