package org.alpo.example.sb_mustache.repos;

import org.alpo.example.sb_mustache.entity.Note;
import org.springframework.data.jpa.repository.JpaRepository;

public interface NoteRepo extends JpaRepository<Note, Long> {
}
