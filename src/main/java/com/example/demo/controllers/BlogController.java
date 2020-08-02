package com.example.demo.controllers;

import com.example.demo.model.Post;
import com.example.demo.repo.PostRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.time.temporal.ChronoUnit;
import java.util.*;

@Controller
public class BlogController {
    @Autowired
    private PostRepo repo;

    public static void date(Model model) {
        Locale ruLocale = Locale.forLanguageTag("ru-RU");
        DateTimeFormatter longFormat = DateTimeFormatter.ofPattern("d MMMM uuuu", ruLocale);
        LocalDateTime now = LocalDateTime.now();
        model.addAttribute("date", now.format(longFormat));
    }

    @GetMapping("/")
    public String blog(Model model) {
        Iterable<Post> posts = repo.findAll();
        model.addAttribute("posts", posts);
        model.addAttribute("dateNow", LocalDate.now());
        date(model);
        for (Post p : posts) {
            long days = ChronoUnit.DAYS.between(p.getDateTime(), LocalDate.now());
            model.addAttribute("daysBetween", days);
        }
        return "blog";
    }

    @GetMapping("/{id}")
    public String blogId(Model model, @PathVariable(value = "id") int id) {
        if (!repo.existsById(id)) {
            return "redirect:/";
        }
        List<Post> post = repo.findAllById(id);
        model.addAttribute("posts", post);
        model.addAttribute("dateNow", LocalDate.now());
        date(model);
        Post post1 = repo.findById(id);
        model.addAttribute("postNow", post1.getDateTime());
        for (Post p : post) {
            long days = ChronoUnit.DAYS.between(p.getDateTime(), LocalDate.now());
            model.addAttribute("daysBetween", days);
        }

        return "newBlogPage";
    }

    @GetMapping("/blog/{id}/edit")
    public String blogEdit(Model model, @PathVariable(value = "id") int id) {
        if (!repo.existsById(id)) {
            return "redirect:/";
        }
        List<Post> post = repo.findAllById(id);
        model.addAttribute("posts", post);
        date(model);
        return "blog-edit";
    }

    @GetMapping("/blog/add")
    public String blogAdd(Model model) {
        date(model);
        return "blog-add";
    }

    @PostMapping("/blog/add")
    public String postPost(Model model, @RequestParam String title,
                           @RequestParam("date") @DateTimeFormat(pattern = "yyyy-MM-dd") LocalDate date,
                           @RequestParam String full_text, RedirectAttributes redirect) {
        LocalDate now = LocalDate.now();
        if (date.isAfter(now)) {
            Post post = new Post(title, date, full_text, false);
            repo.save(post);
        } else {
            redirect.addFlashAttribute("ucant", "ndjcndj");
            return "redirect:/blog/add";
        }
        date(model);
        return "redirect:/";
    }

    @PostMapping("/blog/{id}/edit")
    public String postEdit(Model model, @PathVariable(value = "id") int id,
                           @RequestParam String title, @RequestParam("date")
                           @DateTimeFormat(pattern = "yyyy-MM-dd") LocalDate date,
                           @RequestParam String full_text) {
        Post post = repo.findById(id);
        post.setTitle(title);
        post.setDateTime(date);
        post.setFullText(full_text);
        repo.save(post);
        date(model);
        return "redirect:/";
    }

    @PostMapping("/blog/{id}/delete")
    public String postDelete(@PathVariable(value = "id") int id) {
        Post post = repo.findById(id);
        repo.delete(post);
        return "redirect:/";
    }

    @PostMapping("/doneDairy")
    public String doneDairy(@RequestParam("id") int id) {
        Post post = repo.findById(id);
        post.setDoneDairy(true);
        repo.save(post);
        return "redirect:/";

    }


}
