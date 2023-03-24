package com.mywebsite.DAO.dao;

import java.sql.Date;
import java.time.LocalDate;

public class Common  {

    public static Date getCurrentDate() {
        LocalDate curDate = java.time.LocalDate.now();
        return Date.valueOf(curDate.toString());
    }
    
    public static int convertFromStringToInt(String number_raw){
        int number;
        try {
            number = Integer.parseInt(number_raw);
        } catch (NumberFormatException e) {
            System.out.println(e + "Parse Int");
            number = -1;
        }
        return number;
    }
    
    public static double convertFromStringToDouble(String number_raw){
        double number;
        try {
            number = Double.parseDouble(number_raw);
        } catch (NumberFormatException e) {
            System.out.println(e + "Parse Double");
            number = -1;
        }
        return number;
    }
    
    public Date getCurrentDateForJSP() {
        LocalDate curDate = java.time.LocalDate.now();
        return Date.valueOf(curDate.toString());
    }
}
