/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uyennlp.util;

import java.io.FileReader;
import java.io.IOException;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author SE140355
 */
public class NewClass {

    private static final String MAPPING_FILE = "data.txt";    

    public static void main(String[] args) {
        try {
            Map<String, String> list = FileHelper.getListMapping(MAPPING_FILE);
            for (String key : list.keySet()) {
                System.out.println(key + ": " + list.get(key));
            }
            FileReader fr = new FileReader("src/java/uyennlp/properties/mappingProperties.properties");
            int i;
        while ((i = fr.read()) != -1) {
            System.out.print((char) i);
        }
        fr.close();
        } catch (IOException ex) {
            Logger.getLogger(NewClass.class.getName()).log(Level.SEVERE, null, ex);
        }

    }
}
