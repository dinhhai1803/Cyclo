/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package System;

import java.io.FileWriter;
import java.io.IOException;
import net.minidev.json.JSONObject;

/**
 *
 * @author win
 */
public class SaveToJSON {

    public SaveToJSON() {
    }

    private FileWriter file;
    
    public void saveFile(JSONObject obj, String nameFile) {
        try {
            // Constructs a FileWriter given a file name, using the platform's default charset
            
            //NÃªn sá»­a láº¡i theo cÃ¡i folder mÃ¬nh lÆ°u json
            // - Khuyáº¿n khÃ­ch lÃ  nÃªn táº¡o 1 folder Admin riÃªng rá»“i dÃ¹ng Redirect
            file = new FileWriter("D:/SWP_PROJECT/src/main/webapp/Driver/JSON/" + nameFile + ".json"); 
            file.write(obj.toJSONString());
            CrunchifyLog("Successfully Copied JSON Object to File...");
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            try {
                file.flush();
                file.close();
            } catch (IOException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }

        }
    }

    public void CrunchifyLog(String str) {
        System.out.println(str);
    }

}
