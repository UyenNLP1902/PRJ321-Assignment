/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uyennlp.util;

import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.StringTokenizer;

/**
 *
 * @author SE140355
 */
public class FileHelper {

    public static Map<String, String> getListMapping(String filename)
            throws FileNotFoundException, IOException {
        Map<String, String> result = new HashMap<String, String>();

        StringTokenizer stk = null;
        String line;
        BufferedReader br = new BufferedReader(new FileReader(filename));
        try {
            while ((line = br.readLine()) != null) {
                stk = new StringTokenizer(line, "=");
                String key = stk.nextToken();
                if (key == null) {
                    key = "";
                }
                String value = stk.nextToken();
                if (value == null) {
                    value = "";
                }
                result.put(key, value);
            }
        } finally {
            if (br != null) {
                br.close();
            }
        }

        return result;
    }
}
