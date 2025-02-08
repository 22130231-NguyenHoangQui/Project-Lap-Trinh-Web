package com.edu.hcmuaf.fit.service;

import com.edu.hcmuaf.fit.dao.DAOCategory;
import com.edu.hcmuaf.fit.dao.DAOInvoice;
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
    public static ArrayList<Category> getListCategory(int offset) {
        ArrayList<Category> result = DAOCategory.listCategory(offset);
        return result;

    }

    public static int updateCategory(Category c) {
        return DAOCategory.updateCategory(c);
    }

    public static void main(String[] args) {
//        getInstance().getListCategory(0);
//        for (Category category : getInstance().getListCategory(0)) {
//            System.out.println(category);
//        }
//        getInstance().getListCategory();
        System.out.println(getCategoryById(2));

    }
//    load all danh mục
    public ArrayList<Category> getListCategory() {
        ArrayList<Category> result = DAOCategory.listCategory();
        return result;
    }
    public ArrayList<Category> listCategory() {
        return DAOCategory.listCategory();
    }
    public static Category getCategoryById(int id) {
        return DAOCategory.getCategoryById(id);
    }
    //Thêm danh mục
    public int insertCategory(Category c){ return  DAOCategory.insertCategory(c);}
    //Xoá danh mục
    public  int delCategory(int id) throws SQLException {
        return  DAOCategory.delCategory(id);
    }
    // Chỉnh sửa cập nhật danh mục
    public Category latestCategory() {
        return null;
    }

    public int insertImageOfCategory(int id, String fileName) {
        return 0;
    }


}
