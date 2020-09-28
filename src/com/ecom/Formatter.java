package com.ecom;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Date;

public class Formatter {
    /**
     * 
     * @return Current DateTime in database savable format
     */
    public static String CurrentDateTime() {
        DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss");
        LocalDateTime now = LocalDateTime.now();
        return dtf.format(now);
    }

    /**
     * 
     * @param DateTime_Value
     * @return Formated date and time output
     * @throws ParseException
     */
    public static String FormatToDateTime(String Input) throws ParseException {

        Date date1 = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").parse(Input);
        DateFormat dateFormat = new SimpleDateFormat("dd MMMM, YYYY");
        String strDate = dateFormat.format(date1);

        DateFormat timeFormat = new SimpleDateFormat("hh:mm a");
        String strTime = timeFormat.format(date1);

        return strDate + "<br>" + strTime;
    }

    /**
     * 
     * @param DateTime_Value
     * @return Formated date output
     * @throws ParseException
     */
    public static String FormatToDate(String Input) throws ParseException {

        Date date1 = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").parse(Input);
        DateFormat dateFormat = new SimpleDateFormat("dd MMMM, YYYY");
        String strDate = dateFormat.format(date1);

        return strDate;
    }
}
