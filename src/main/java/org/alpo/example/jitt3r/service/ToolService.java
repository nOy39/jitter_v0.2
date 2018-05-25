package org.alpo.example.jitt3r.service;

import org.springframework.stereotype.Service;

import java.text.SimpleDateFormat;
import java.util.Date;

@Service
public class ToolService {

    /** getToday()
     * @return - Возвращает текущую дату объектом String,
     *          в формате ("День недели","Число.Месяц.Год","Час:Минуты")
     *          пример ("Чет, 24.05.2018, 09:00")
     */
    public String getToday() {

        SimpleDateFormat sDateFormat = new SimpleDateFormat("EEE, dd.MM.yyyy, HH:mm");

        return sDateFormat.format(new Date());
    }
}
