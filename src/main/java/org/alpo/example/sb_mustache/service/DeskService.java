package org.alpo.example.sb_mustache.service;

import org.springframework.stereotype.Service;

@Service
public class DeskService {

    public String getUrl(Long id) {
        return "redirect:/desk/"+id+"/list/";
    }
}
