package com.whitehax.phishSim;

import android.annotation.TargetApi;
import android.os.Build;
import android.util.Base64;
import java.io.ByteArrayOutputStream;
import java.io.DataOutputStream;
import java.io.IOException;
import java.nio.ByteBuffer;
import java.nio.ByteOrder;

import javax.crypto.Mac;
import javax.crypto.spec.SecretKeySpec;
import org.apache.commons.codec.binary.Base32;

public class JavaUtil {
    @TargetApi(Build.VERSION_CODES.FROYO)
    public static String getOtp() {


        String secretKey = "EHFHEOFJOIEJFOIJIOSFJIOSJIOFIOFR";
        long timestamp = System.currentTimeMillis() / 60000;
        // Log.d("time stamp is - ", timestamp + "");


        ByteArrayOutputStream baos = new ByteArrayOutputStream();
        DataOutputStream dos = new DataOutputStream(baos);
        try {
            dos.writeDouble(timestamp);
            dos.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
        byte[] timStampBytes = baos.toByteArray();
        ByteBuffer bb = ByteBuffer.wrap(timStampBytes);
        bb.order(ByteOrder.BIG_ENDIAN);
        byte[] bigEndianBytes = bb.array();


        ByteArrayOutputStream secretBaos = new ByteArrayOutputStream();
        DataOutputStream secretDos = new DataOutputStream(secretBaos);
        try {
            secretDos.writeBytes(secretKey);
            secretDos.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
        byte[] secretBytes = secretBaos.toByteArray();
        Base32 base32 = new Base32();
        base32.encode(secretBytes);
        byte[] base64Bytes = Base64.encode(secretBytes, Base64.NO_WRAP);



        try {
            Mac mac = Mac.getInstance("HmacSHA1");
            SecretKeySpec secret = new SecretKeySpec(base64Bytes, mac.getAlgorithm());
            mac.init(secret);
            byte[] hmacValue = mac.doFinal(bigEndianBytes);
            for (int values : hmacValue) {
                // Log.e("values", values + "");
            }
            int offset = hmacValue[hmacValue.length - 1] & 0xf;


            int code = ((hmacValue[offset] & 0x7f) << 24) |
                    ((hmacValue[offset + 1] & 0xff) << 16) |
                    ((hmacValue[offset + 2] & 0xff) << 8) |
                    (hmacValue[offset + 3] & 0xff);
            double num = (double) code % Math.pow(10, 6);
            String otp = Math.round(num) + "";
            return otp;
        } catch (Exception e) {
            e.printStackTrace();
            return "";
        }
    }
}
