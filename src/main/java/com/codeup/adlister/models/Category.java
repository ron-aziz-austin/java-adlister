package com.codeup.adlister.models;

public class Category {
    private long parentId;
    private long categoryId;
    private String title;

    public Category(long parentId, long categoryId, String title) {
        this.parentId = parentId;
        this.categoryId = categoryId;
        this.title = title;
    }

    public Category(long parentId, String title) {
        this.parentId = parentId;
        this.title = title;
    }

    public long getParentId() {
        return parentId;
    }

    public void setParentId(long parentId) {
        this.parentId = parentId;
    }

    public long getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(long categoryId) {
        this.categoryId = categoryId;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

}// class
