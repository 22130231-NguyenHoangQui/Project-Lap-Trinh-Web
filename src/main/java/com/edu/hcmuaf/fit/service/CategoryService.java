package com.edu.hcmuaf.fit.service;

import com.edu.hcmuaf.fit.dao.DAOCategory;
import com.edu.hcmuaf.fit.model.Category;

import java.sql.SQLException;
import java.util.ArrayList;

public class CategoryService  {
    static CategoryService instance;
    private CategoryService() {

    }
    public static CategoryService getInstance() {
        if (instance == null) {
            instance = new CategoryService();
        }
        return instance;
    }
//    load danh mục bán chạy nhất
    public ArrayList<Category> getListCategory(int offset) {
        ArrayList<Category> result = DAOCategory.listCategory(offset);
        return result;

    }
//    load all danh mục
    public ArrayList<Category> getListCategory() {
        ArrayList<Category> result = DAOCategory.listCategory();
        return result;
    }
    public ArrayList<Category> listCategory() {
        return DAOCategory.listCategory();
    }
    public Category getCategoryById(int id) {
        return DAOCategory.getCategoryById(id);
    }
    //Thêm danh mục
    public int insertCategory(Category c){ return  DAOCategory.insertCategory(c);}
    //Xoá danh mục
    public  int delCategory(int id) {
        return  DAOCategory.delCategory(id);
    }
    // Chỉnh sửa cập nhật danh mục
    public int updateCategory(Category c) throws SQLException {
        return DAOCategory.updateCategory(c);
    }
}
