package org.alpo.example.jitt3r.service;

import org.alpo.example.jitt3r.entity.UploadFile;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

@Service
public class FileService {

    @Value("${upload.path}")
    private String uploadPath;

    public boolean fileExists(MultipartFile file) {
        return (file!=null && !file.getOriginalFilename().isEmpty());
    }

    public UploadFile upload(MultipartFile file, String path) {
        UploadFile uploadFile = new UploadFile();

            String uploadDirPath = uploadPath+path;
            File uploadDir = new File(uploadDirPath);

            if (!uploadDir.exists()) {
                uploadDir.mkdir();
            }
            String uuid = UUID.randomUUID().toString();
            String resultFilename = uuid+"."+file.getOriginalFilename();

            try {
                file.transferTo(new File(uploadDirPath+"/"+resultFilename));
            } catch (IOException e) {
                e.printStackTrace();
            }

            uploadFile.setFilename(resultFilename);

        return uploadFile;
    }
}
