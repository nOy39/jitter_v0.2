package org.alpo.example.sb_mustache.repos;

import org.alpo.example.sb_mustache.entity.Message;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

/**
 * Created by
 *
 * @Author OGI aka nOy39
 * @Date 07.05.2018
 * @Time 15:59
 */
@Deprecated
public interface MessageRepo extends JpaRepository<Message, Long> {
    List<Message> findByTagOrTextContainingIgnoreCase(String tag, String text);
}
