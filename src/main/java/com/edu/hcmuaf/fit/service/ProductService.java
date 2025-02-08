package com.edu.hcmuaf.fit.service;

import com.edu.hcmuaf.fit.dao.DAOProduct;
import com.edu.hcmuaf.fit.model.Product;
import com.edu.hcmuaf.fit.model.ProductImages;
import com.edu.hcmuaf.fit.model.SizePrice;

import java.sql.SQLException;
import java.util.ArrayList;

public class ProductService {
    static ProductService instance;

    public ProductService() {

    }

    public static ProductService getInstance() {
        if (instance == null) {
            instance = new ProductService();
        }
        return instance;
    }

    public static ArrayList<Product> listAllProduct(int offset) {
        ArrayList<Product> listProduct = DAOProduct.listProduct(offset);
        ArrayList<ProductImages> listImageOfProduct = null;
        ArrayList<SizePrice> listSizeOfProduct = null;
        for (Product p : listProduct) {
            listImageOfProduct = DAOProduct.listImageOfProduct(p);
            p.setProductImages(listImageOfProduct);
            listSizeOfProduct = DAOProduct.listPriceOfProduct(p.getId());
            p.setSizePrices(listSizeOfProduct);
        }
        return listProduct;
    }

    //    lấy ra sản phẩm đang là xu hướng
    public static ArrayList<Product> listProductBestSelling(int offset) {
        ArrayList<Product> listProduct = DAOProduct.listProductBestSelling(offset);
        ArrayList<ProductImages> listImageOfProduct = null;
        ArrayList<SizePrice> listSizeOfProduct = null;

        for (Product p : listProduct) {
            listImageOfProduct = DAOProduct.listImageOfProduct(p);
            p.setProductImages(listImageOfProduct);
            listSizeOfProduct = DAOProduct.listPriceOfProduct(p.getId());
            p.setSizePrices(listSizeOfProduct);
        }
        return listProduct;
    }

    //    lấy sản phẩm đang bán chạy trong tháng
    public static ArrayList<Product> listProductBestSellingInMonth(int offset) {
        ArrayList<Product> result = DAOProduct.listProductBessInMonth(offset);
        ArrayList<ProductImages> listImageOfProduct = null;
        ArrayList<SizePrice> listSizeOfProduct = null;

        for (Product p : result) {
            listImageOfProduct = DAOProduct.listImageOfProduct(p);
            p.setProductImages(listImageOfProduct);
            listSizeOfProduct = DAOProduct.listPriceOfProduct(p.getId());
            p.setSizePrices(listSizeOfProduct);
        }
        return result;
    }

    //    lấy sản phẩm ngẫu nhiên cho trang danh mục
    public static ArrayList<Product> listProductRandom(int offset) {
        ArrayList<Product> result = DAOProduct.listRandomProduct(offset);
        ArrayList<ProductImages> listImageOfProduct = null;
        ArrayList<SizePrice> listPriceOfProduct = null;
        for (Product p : result) {
            listImageOfProduct = DAOProduct.listImageOfProduct(p);
            p.setProductImages(listImageOfProduct);
            listPriceOfProduct = DAOProduct.listPriceOfProduct(p.getId());
            p.setSizePrices(listPriceOfProduct);
        }

        return result;
    }

    public static ArrayList<Product> listProductByIdCate(int id, int offset) {
        ArrayList<Product> listProduct = DAOProduct.listProductByIdCate(id, offset);
        ArrayList<ProductImages> listImageOfProduct = null;
        ArrayList<SizePrice> listSizeOfProduct = null;
        for (Product p : listProduct) {
            listImageOfProduct = DAOProduct.listImageOfProduct(p);
            p.setProductImages(listImageOfProduct);
            listSizeOfProduct = DAOProduct.listPriceOfProduct(p.getId());
            p.setSizePrices(listSizeOfProduct);
        }
        return listProduct;
    }

    //    lấy ra sản phẩm tìm kiếm theo tên
    public static ArrayList<Product> listProductByName(String name) {
        ArrayList<Product> listProduct = DAOProduct.listProductByName(name);
        ArrayList<ProductImages> listImageOfProduct = null;
        ArrayList<SizePrice> listSizeOfProduct = null;
        for (Product p : listProduct) {
            listImageOfProduct = DAOProduct.listImageOfProduct(p);
            p.setProductImages(listImageOfProduct);
            listSizeOfProduct = DAOProduct.listPriceOfProduct(p.getId());
            p.setSizePrices(listSizeOfProduct);
        }
        return listProduct;
    }

    //    cat nhat san pham theo gia
    public static ArrayList<Product> getProductsByRange(int minPrice, int maxPrice, int offset) {
        ArrayList<Product> listProduct = DAOProduct.getProductsByPriceRange(minPrice, maxPrice, offset);
        ArrayList<ProductImages> listImageOfProduct = null;
        for (Product p : listProduct) {
            listImageOfProduct = DAOProduct.listImageOfProduct(p);
            p.setProductImages(listImageOfProduct);
        }
        return listProduct;
    }

    public ArrayList<ProductImages> getImgsByIdP(int idP) {
        return DAOProduct.getImagesByProductId(idP);
    }

    public int insertProduct(Product product) {
        return DAOProduct.insertProduct(product);
    }

    public int insertImageOfProduct(int id, String url) {
        return DAOProduct.insertImageProduct(id, url);
    }

    public int insertPriceProduct(int productId, String diameter, String height, int price) {
        return DAOProduct.insertPriceProduct(productId, diameter, height, price);
    }

    public static Product latestProduct() {
        return DAOProduct.latestProduct();
    }

    public int updateProduct(Product p) throws SQLException {
        return DAOProduct.updateProduct(p);
    }

    public static int deleteImgProduct(int id, String url) throws SQLException {
        return DAOProduct.delImgOfProduct(id, url);
    }

    public static void main(String[] args) {
//        ArrayList<Product> listProduct = ProductService.getInstance().listProductRandom(0);
//        Product highestPricedProduct = null;
//        Product lowestPricedProduct = null;
//        ArrayList<Product> listProductBestSelling = ProductService.getInstance().listProductBestSelling(0);
//        ArrayList<SizePrice> list = ProductService.getInstance().getProductSizeByProductIdAndDiameter(1);
//        System.out.println(list);
//        for (Product p : listProductBestSelling) {
//
//            System.out.println(p);
//        }
        getPriceByDiameter(1,16);
//        for (Product p : listProduct) {
//            if (highestPricedProduct == null || p.getPrice() > highestPricedProduct.getPrice()) {
//                highestPricedProduct = p;
//            }
//            if (lowestPricedProduct == null || p.getPrice() < lowestPricedProduct.getPrice()) {
//                lowestPricedProduct = p;
//                System.out.println(lowestPricedProduct.getPrice());
//
//            }
//        }
    }

    public ArrayList<SizePrice> getPriceByIdP(int id) {
        return DAOProduct.getPriceByIdP(id);
    }

    public int deleteSizePrice(SizePrice sizeToRemove) {
        return DAOProduct.deleteSizePrice(sizeToRemove);
    }

    public int updateSizePrice(SizePrice oldPrice) {
        return DAOProduct.updateSizePrice(oldPrice);
    }

    public int insertSizePrice(SizePrice updatedPrice) {
        return DAOProduct.insertSizePrice(updatedPrice);
    }

    public static Product getProductById(int id) {
        Product product = DAOProduct.getProductById(id);
        ArrayList<ProductImages> listImageOfProduct = DAOProduct.listImageOfProduct(product);
        ArrayList<SizePrice> listPriceOfProduct = DAOProduct.listPriceOfProduct(product.getId());
        product.setSizePrices(listPriceOfProduct);
        product.setProductImages(listImageOfProduct);
        return product;
    }


    public int delProduct(int id) {
        return DAOProduct.delProduct(id);
    }

    // Phương thức lấy sản phẩm theo ID
    public static Product getDetailProductById(int productId) {
        Product product = DAOProduct.getProductById(productId); // Giả sử DAOProduct có phương thức này
        if (product != null) {
            // Lấy thông tin hình ảnh của sản phẩm
            ArrayList<ProductImages> getImagesByProductId = DAOProduct.getImagesByProductId(productId);
            product.setProductImages(getImagesByProductId);

            // Lấy thông tin kích cỡ của sản phẩm
            ArrayList<SizePrice> listSizeOfProduct = DAOProduct.listPriceOfProduct(productId);
            product.setSizePrices(listSizeOfProduct);
        }
        return product;
    }

    public String getCategoriesByProductId(int productId) {
        return DAOProduct.getCategoriesByProductId(productId);
    }

    public int decreaseQuantity(Product p, int quantity) {
        return DAOProduct.decreaseQuantity(p,quantity);

    }

    public static double getPriceByDiameter(int id, int desiredDiameter) {
        return DAOProduct.getPriceByDiameter(id, desiredDiameter);
    }
    public ArrayList<SizePrice> getProductSizeByProductIdAndDiameter(int id) {
        return DAOProduct.getProductSizeByProductIdAndDiameter(id);
    }
    public String getMinPriceByProductId(int productId) {
        return DAOProduct.getMinPriceByProductId(productId);
    }

    public String getMaxPriceByProductId(int productId) {
        return DAOProduct.getMaxPriceByProductId(productId);
    }



    public ArrayList<Integer> getDiametersByProductId(int productId) {
        return DAOProduct.getDiametersByProductId(productId);
    }
    public ArrayList<Product> searchProductsByName(String name) {
        return (ArrayList<Product>) DAOProduct.searchProductsByName(name);
    }
    public String getFirstImageUrl(Product product) {
        if (product != null && product.getProductImages() != null && !product.getProductImages().isEmpty()) {
            return product.getProductImages().get(0).getUrl(); // Lấy URL của ảnh đầu tiên
        }
        return null;
    }


    public ArrayList<ProductImages> getProductImages(int productId) {
        return DAOProduct.getProductImages(productId);}
}
