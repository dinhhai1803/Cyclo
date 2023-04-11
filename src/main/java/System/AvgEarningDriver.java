/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package System;

import com.nimbusds.oauth2.sdk.ParseException;
import entity.Bill;
import java.text.DateFormatSymbols;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import net.minidev.json.JSONArray;
import net.minidev.json.JSONObject;

/**
 *
 * @author win
 */
public class AvgEarningDriver {

    public AvgEarningDriver() {
    }

    CheckTime ct = new CheckTime();

    //LÆ°u Sá»‘ tiá»n trung bÃ¬nh Ä‘Ã£ kiáº¿m Ä‘Æ°á»£c theo tá»«ng thÃ¡ng vÃ o JSON
    public JSONObject EarningAvg(ArrayList<Bill> b) throws ParseException, java.text.ParseException {

        JSONObject obj = new JSONObject(); // CÃ³ thá»ƒ hiá»ƒu lÃ  gáº§n giá»‘ng vá»›i map
        JSONArray earn = new JSONArray(); // TÆ°Æ¡ng tá»± vá»›i list or ArrayList

        double total = 0;
        int count = 0;

        //Äá»ƒ táº¡o ra 1 máº£ng string cÃ¡c thÃ¡ng viáº¿t táº¯t tiáº¿ng anh
        // VD: Octobel => Otc 
        String[] shortMonths = new DateFormatSymbols().getShortMonths();

        // Chuyá»ƒn Ä‘á»•i chuyá»ƒn string theo format thÃ nh date
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"); // => chuyá»ƒn Ä‘á»•i date cÃ³ format lÃ  yyyy-MM-dd HH:mm:ss thÃ nh kiá»ƒu date
        SimpleDateFormat sdf1 = new SimpleDateFormat("MM"); //Chuyá»ƒn Ä‘á»•i string cÃ³ format MM thÃ nh kiá»ƒu date. Vd: 06 => ThÃ¡ng 6 (June)
        SimpleDateFormat sdf2 = new SimpleDateFormat("MMM"); // Chuyá»ƒn Ä‘á»•i format cÃ³ kiá»ƒu MMM => thÃ nh kiáº»u date. VD Oct => thÃ¡ng 10 trg kiá»ƒu date

        // VÃ²ng láº·p cÃ³ Ä‘á»™ dÃ i lÃ  12 thÃ¡ng (trá»« 1 bá»Ÿi vÃ¬ shortMonths cÃ³ Ä‘á»™ dÃ i lÃ  13)
        for (int j = 0; j < shortMonths.length - 1; j++) {
            //Map Ä‘á»ƒ lÆ°u cÃ¡c key vÃ  value. Key lÃ  tÃªn vÃ  value 
            // Key     :  value
            // "month" : "jan"
            // "earn" : "avg"
            Map<String, String> avg = new HashMap<>();

            // Táº¡o vÃ²ng láº·p bill Ä‘á»ƒ cháº¡y kiá»ƒm tra bÃªn trong vÃ²ng láº·p thÃ¡ng Ä‘á»ƒ check thÃ¡ng
            // khi j = 0 => thÃ¡ng 1 
            // cháº¡y háº¿t hÃ³a Ä‘Æ¡n rá»“i check xem cÃ³ hÃ³a Ä‘Æ¡n nÃ o cÃ¹ng thÃ¡ng 1 khÃ´ng
            for (int i = 0; i < b.size(); i++) {

                //getDate() trong bill sáº½ cÃ³ kiá»ƒu lÃ  yyyy-MM-dd HH:mm:ss - 2022-10-12 15:22:30
                // nÃªn á»Ÿ Ä‘iá»u kiÃªn Ä‘á»ƒ check year sáº½ dÃ¹ng sdf Ä‘á»ƒ chuyá»ƒn sÃ¡ng date
                if (ct.isCurentYear(sdf.parse(b.get(i).getDate()))) // Kiá»ƒm tra xem hÃ³a Ä‘Æ¡n Ä‘Ã£ quÃ¡ cÅ© hay khÃ´ng (thÆ°a thá»i Ä‘iá»ƒm hiá»‡n táº¡i 1 nÄƒm)
                {
                    //check xem thÃ¡ng cá»§a tá»«ng hÃ³a Ä‘Æ¡n cÃ³ cÃ¹ng thÃ¡ng cá»§a j pháº§n tá»­ bÃªn shortMonths khÃ´ng
                    // - tÃ¡ch getDate() cá»§a bill - 2022-10-12 15:22:30 báº±ng split("-") sáº½ táº¡o ra 1 máº£ng lÃ  { 2022, 10, 12 15:22:30}
                    // rá»“i láº¥y pháº§n tá»­ thá»© 2 - index = 1 Ä‘á»ƒ láº¥y thÃ¡ng cá»§a bill
                    // - dÃ¹ng hÃ m isCurrentMonth(date1, date2) Ä‘á»ƒ check xem cÃ³ trÃ¹ng khÃ´ng
                    if (ct.isCurrentMonth(sdf1.parse(b.get(i).getDate().split("-")[1]), sdf2.parse(shortMonths[j]))) {
                        total += b.get(i).getTotal(); // má»—i láº§n trÃ¹ng thÃ¬ sáº½ cá»™ng cÃ¡c hÃ³a Ä‘Æ¡n láº¡i
                        count += 1; // Ä‘áº¿m sá»‘ láº§n cÃ¡c thÃ¡ng trÃ¹ng

                    }
                }
            }
            
            // LÆ°u cÃ¡c avg theo tá»«ng thÃ¡ng vÃ o map
            avg.put("month", shortMonths[j]); //lÆ°u tá»«ng thÃ¡ng
            // kiá»ƒm tra xem count nÃ³ pháº£i khÃ¡c khÃ´ng náº¿u khÃ´ng khÃ¡c 0 thÃ¬ earn cá»§a thÃ¡ng Ä‘Ã³ sáº½ lÃ  0
            if (count != 0) {
                avg.put("earn", String.valueOf(total / count));
            } else {
                avg.put("earn", "0");
            }
            
            // reset láº¡i giÃ¡ trá»‹ náº¿u khÃ´ng sáº½ bá»‹ cá»™ng dá»“n
            total = 0;
            count = 0;
            //Add map vÃ o JSONArray
            earn.add(avg);
        }
        //Add JSONArray vÃ o JSONObject gáº§n giá»‘ng vá»›i map
        // - JSONObject.put(key, value);
        // - value cÃ³ thá»ƒ lÃ  gÃ¬ cÅ©ng Ä‘Æ°á»£c
        obj.put("EarningReport", earn);
        // tráº£ vá» JSONObject Ä‘á»ƒ dÃ¹ng cho bÃªn save file
        return obj;
    }

    // CÃ¡ch lÃ m tÆ°Æ¡ng tá»±
    public JSONObject NumberTrip(ArrayList<Bill> b) throws ParseException, java.text.ParseException {

        JSONObject obj = new JSONObject();
        JSONArray trips = new JSONArray();

        int count = 0;

        String[] shortMonths = new DateFormatSymbols().getShortMonths();

        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        SimpleDateFormat sdf1 = new SimpleDateFormat("MM");
        SimpleDateFormat sdf2 = new SimpleDateFormat("MMM");

        for (int j = 0; j < shortMonths.length - 1; j++) {
            Map<String, String> trip = new HashMap<>();

            for (int i = 0; i < b.size(); i++) {

                if (ct.isCurentYear(sdf.parse(b.get(i).getDate()))) {
                    if (ct.isCurrentMonth(sdf1.parse(b.get(i).getDate().split("-")[1]), sdf2.parse(shortMonths[j]))) {
                        count += 1;
                    }
                }
            }
            trip.put("month", shortMonths[j]);
            trip.put("trips", String.valueOf(count));

            count = 0;

            trips.add(trip);
        }
        obj.put("NumberTrip", trips);
        return obj;
    }

}
