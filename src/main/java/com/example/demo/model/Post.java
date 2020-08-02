package com.example.demo.model;

import lombok.AccessLevel;
import lombok.AllArgsConstructor;
import lombok.Data;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import java.time.LocalDate;

@Data
@Entity
@AllArgsConstructor(access = AccessLevel.PACKAGE)
public class Post {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    private String title,  fullText;
    private LocalDate  dateTime;
    private boolean doneDairy;

    public Post() {
    }

    public Post(String title,LocalDate  dateTime, String fullText,boolean done) {
        this.fullText=fullText;
        this.dateTime=dateTime;
        this.title=title;
        this.doneDairy= done;
    }

   }
