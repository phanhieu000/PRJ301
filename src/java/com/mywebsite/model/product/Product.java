package com.mywebsite.model.product;

import com.mywebsite.DAO.interfaces.IProductReviewDAO;
import com.mywebsite.DAO.product.ProductReviewDAO;
import java.sql.Date;
import java.text.DecimalFormat;
import java.text.NumberFormat;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Locale;

public class Product {

    private int productID;
    private String productName;
    private String productMetaTitle;
    private String summary;
    private String SKU;
    private double price;
    private double discount;
    private int quantity;
    private int countBuy;
    private String size;
    private String screen;
    private String camera;
    private String cameraSelfie;
    private String CPU;
    private String memory;
    private String RAM;
    private String hardDrive;
    private String card;
    private String weight;
    private int warranty;
    private Date productCreateAt;
    private Date productUpdateAt;
    private Date productSaleStartAt;
    private Date productSaleEndAt;
    private ProductImage image;
    private ProductColor color;
    private Producer producer;
    private Category category;

    public Product() {
    }

    public Product(int productID, String productName, String productMetaTitle, String summary, String SKU, double price, double discount, int quantity, int countBuy, String size, String screen, String camera, String cameraSelfie, String CPU, String memory, String RAM, String hardDrive, String card, String weight, int warranty, Date productCreateAt, Date productUpdateAt, Date productSaleStartAt, Date productSaleEndAt, ProductImage image, ProductColor color, Producer producer, Category category) {
        this.productID = productID;
        this.productName = productName;
        this.productMetaTitle = productMetaTitle;
        this.summary = summary;
        this.SKU = SKU;
        this.price = price;
        this.discount = discount;
        this.quantity = quantity;
        this.countBuy = countBuy;
        this.size = size;
        this.screen = screen;
        this.camera = camera;
        this.cameraSelfie = cameraSelfie;
        this.CPU = CPU;
        this.memory = memory;
        this.RAM = RAM;
        this.hardDrive = hardDrive;
        this.card = card;
        this.weight = weight;
        this.warranty = warranty;
        this.productCreateAt = productCreateAt;
        this.productUpdateAt = productUpdateAt;
        this.productSaleStartAt = productSaleStartAt;
        this.productSaleEndAt = productSaleEndAt;
        this.image = image;
        this.color = color;
        this.producer = producer;
        this.category = category;
    }

    public int getProductID() {
        return productID;
    }

    public void setProductID(int productID) {
        this.productID = productID;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getProductMetaTitle() {
        return productMetaTitle;
    }

    public void setProductMetaTitle(String productMetaTitle) {
        this.productMetaTitle = productMetaTitle;
    }

    public String getSummary() {
        return summary;
    }

    public void setSummary(String summary) {
        this.summary = summary;
    }

    public String getSKU() {
        return SKU;
    }

    public void setSKU(String SKU) {
        this.SKU = SKU;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public double getDiscount() {
        return discount;
    }

    public void setDiscount(double discount) {
        this.discount = discount;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public int getCountBuy() {
        return countBuy;
    }

    public void setCountBuy(int countBuy) {
        this.countBuy = countBuy;
    }

    public String getSize() {
        return size;
    }

    public void setSize(String size) {
        this.size = size;
    }

    public String getScreen() {
        return screen;
    }

    public void setScreen(String screen) {
        this.screen = screen;
    }

    public String getCamera() {
        return camera;
    }

    public void setCamera(String camera) {
        this.camera = camera;
    }

    public String getCameraSelfie() {
        return cameraSelfie;
    }

    public void setCameraSelfie(String cameraSelfie) {
        this.cameraSelfie = cameraSelfie;
    }

    public String getCPU() {
        return CPU;
    }

    public void setCPU(String CPU) {
        this.CPU = CPU;
    }

    public String getMemory() {
        return memory;
    }

    public void setMemory(String memory) {
        this.memory = memory;
    }

    public String getRAM() {
        return RAM;
    }

    public void setRAM(String RAM) {
        this.RAM = RAM;
    }

    public String getHardDrive() {
        return hardDrive;
    }

    public void setHardDrive(String hardDrive) {
        this.hardDrive = hardDrive;
    }

    public String getCard() {
        return card;
    }

    public void setCard(String card) {
        this.card = card;
    }

    public String getWeight() {
        return weight;
    }

    public void setWeight(String weight) {
        this.weight = weight;
    }

    public int getWarranty() {
        return warranty;
    }

    public void setWarranty(int warranty) {
        this.warranty = warranty;
    }

    public Date getProductCreateAt() {
        return productCreateAt;
    }

    public void setProductCreateAt(Date productCreateAt) {
        this.productCreateAt = productCreateAt;
    }

    public Date getProductUpdateAt() {
        return productUpdateAt;
    }

    public void setProductUpdateAt(Date productUpdateAt) {
        this.productUpdateAt = productUpdateAt;
    }

    public Date getProductSaleStartAt() {
        return productSaleStartAt;
    }

    public void setProductSaleStartAt(Date productSaleStartAt) {
        this.productSaleStartAt = productSaleStartAt;
    }

    public Date getProductSaleEndAt() {
        return productSaleEndAt;
    }

    public void setProductSaleEndAt(Date productSaleEndAt) {
        this.productSaleEndAt = productSaleEndAt;
    }

    public ProductImage getImage() {
        return image;
    }

    public void setImage(ProductImage image) {
        this.image = image;
    }

    public ProductColor getColor() {
        return color;
    }

    public void setColor(ProductColor color) {
        this.color = color;
    }

    public Producer getProducer() {
        return producer;
    }

    public void setProducer(Producer producer) {
        this.producer = producer;
    }

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }
    
    
    public Product(String productName, String productMetaTitle, String summary, String SKU, double price, double discount, int quantity, int countBuy, String size, String screen, String camera, String cameraSelfie, String CPU, String memory, String RAM, String hardDrive, String card, String weight, int warranty, Date productCreateAt, Date productUpdateAt, Date productSaleStartAt, Date productSaleEndAt, ProductImage image, ProductColor color, Producer producer, Category category) {
        this.productName = productName;
        this.productMetaTitle = productMetaTitle;
        this.summary = summary;
        this.SKU = SKU;
        this.price = price;
        this.discount = discount;
        this.quantity = quantity;
        this.countBuy = countBuy;
        this.size = size;
        this.screen = screen;
        this.camera = camera;
        this.cameraSelfie = cameraSelfie;
        this.CPU = CPU;
        this.memory = memory;
        this.RAM = RAM;
        this.hardDrive = hardDrive;
        this.card = card;
        this.weight = weight;
        this.warranty = warranty;
        this.productCreateAt = productCreateAt;
        this.productUpdateAt = productUpdateAt;
        this.productSaleStartAt = productSaleStartAt;
        this.productSaleEndAt = productSaleEndAt;
        this.image = image;
        this.color = color;
        this.producer = producer;
        this.category = category;
    }


    public String getPriceFormat() {
        Locale localeVN = new Locale("vi", "VN");
        NumberFormat vn = NumberFormat.getInstance(localeVN);
        return vn.format(price);
    }

    public String getDiscountFormat() {
        Locale localeVN = new Locale("vi", "VN");
        NumberFormat vn = NumberFormat.getInstance(localeVN);
        return vn.format(discount);
    }
    
    public double getLastPrice(){
        return price - discount;
    }

    public String getLastPriceFormat() {
        Locale localeVN = new Locale("vi", "VN");
        NumberFormat vn = NumberFormat.getInstance(localeVN);
        return vn.format(getLastPrice());
    }

    public String getDiscountPercent() {
        double percent = (discount / price);
        DecimalFormat f = new DecimalFormat("###.#%");
        return f.format(percent);
        
    }
    
    public String getDateSaleEnd(){
        return new SimpleDateFormat("yyyy/MM/dd").format(productSaleEndAt);
    }
    
    public int getRate(){
        int totalStar = 0;
        IProductReviewDAO d = new ProductReviewDAO();
        List<ProductReview> list = d.getReviewByProductID(productID);
        
        for (ProductReview item : list) {
            totalStar += item.getRate();
        }
        
        if(!list.isEmpty()){
            return totalStar/list.size();
        }
        return 0;
    }
    
    public String getCreateTime(){
        SimpleDateFormat f = new SimpleDateFormat("dd/MM/yyyy");
        return f.format(productCreateAt);
    }
    
    public int getAvarageReview(){
        ProductReviewDAO prd = new ProductReviewDAO();
        List<ProductReview> list = prd.getReviewByProductID(this.productID);
        
        int total = 0;
        for (ProductReview item : list) {
            total += item.getRate();
        }
        int result = 0;
        if(!list.isEmpty()){
            result =  total / list.size();
        }
        return result;
    }
    
}
