package com.example.demo.repo;

import com.example.demo.model.Post;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface PostRepo extends CrudRepository<Post, Integer> {
    Post findById(int id);
    List<Post> findAllById(int id);
}
