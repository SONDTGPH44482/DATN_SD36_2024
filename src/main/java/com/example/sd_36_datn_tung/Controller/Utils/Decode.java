package com.example.sd_36_datn_tung.Controller.Utils;

import org.apache.commons.codec.digest.HmacAlgorithms;
import org.apache.commons.codec.digest.HmacUtils;

public class Decode {
    public static String encode(String key, String data) {
        try {
            byte[] keySect = "nqQiVSgDMy809JoPF6OzP5OdBUB550Y4".getBytes();
            HmacUtils hm256 = new HmacUtils(HmacAlgorithms.HMAC_SHA_256, keySect);
            //hm256 object can be used again and again
            String hmac = hm256.hmacHex(data);
            return hmac;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

}
