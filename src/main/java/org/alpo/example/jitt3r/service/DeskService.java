package org.alpo.example.jitt3r.service;

import org.springframework.stereotype.Service;

@Service
public class DeskService {

    /**
     * public String getUrl()
     *
     * @param id - принимает ID проекта
     * @return - возвращает URL подставив id в строку.
     */

    public String getUrl(Long id) {
        return "redirect:/desk/"+id+"/list/";
    }
}
