package com.afiq.tclibrary.spring2.model;

public class Book {

    private long id;
    private String title;
    private String description;
    private long genreId;

    private String genreName;

    public Book() {
    }

    public Book(String title, String description) {
        this.title = title;
        this.description = description;
    }

    public Book(long id, String title, String description) {
        this.id = id;
        this.title = title;
        this.description = description;
    }

    public Book(long id, String title, String description, long genre_id) {
        this.id = id;
        this.title = title;
        this.description = description;
        this.genreId = genre_id;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public long getGenreId() {
        return genreId;
    }

    public void setGenreId(long genreId) {
        this.genreId = genreId;
    }

    public String getGenreName() {
        return genreName;
    }

    public void setGenreName(String genreName) {
        this.genreName = genreName;
    }
}
