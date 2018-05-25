package org.alpo.example.jitt3r.repos;

import org.alpo.example.jitt3r.entity.UploadFile;
import org.springframework.data.jpa.repository.JpaRepository;

public interface FileRepo extends JpaRepository<UploadFile, Long> {
}
