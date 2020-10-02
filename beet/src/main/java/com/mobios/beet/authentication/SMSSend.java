package com.mobios.beet.authentication;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.Reader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.LinkedHashMap;
import java.util.Map;

public class SMSSend {
    public int sendSMS(String mobileNo, String msg) throws Exception {
    	
    	
    	//http://122.255.29.68:5000/sms/send_sms.php?username=mobios_alert&password=Mo321Ar&src=MobiOsOTP&dst=" + msisdn + "&msg=" + encode + "&dr=1&lan=u";
    
    	System.out.println("class SendSMS");
    	//for local host
		 //URL url = new URL("http://sms.textware.lk:5000/sms/send_sms.php");
		 URL url = new URL("http://122.255.29.68:5000/sms/send_sms.php");
    	//for server
		/* URL url = new URL("http://124.43.160.49:5000/sms/send_sms.php"); */
        Map<String,Object> params = new LinkedHashMap<>();
		/*
		 * params.put("username", "mobios_test"); params.put("password", "Mobi123");
		 * params.put("src", "DEMOSMS"); params.put("dst", mobileNo); params.put("msg",
		 * msg); params.put("dr", "1");
		 */
       /* params.put("username", "mobios_test");
        params.put("password", "Mobi123");
        params.put("src", "Mobi0sOTP");
        params.put("dst", mobileNo);
        params.put("msg", msg);
        params.put("dr", "1");*/
        
        params.put("username", "mobios_alert");
        params.put("password", "Mo321Ar");
        params.put("src", "MobiOsOTP");
        params.put("dst", mobileNo);
        params.put("msg", msg);
        params.put("dr", "1");
        
        StringBuilder postData = new StringBuilder();
        for (Map.Entry<String,Object> param : params.entrySet()) {
            if (postData.length() != 0) postData.append('&');
            postData.append(URLEncoder.encode(param.getKey(), "UTF-8"));
            postData.append('=');
            postData.append(URLEncoder.encode(String.valueOf(param.getValue()), "UTF-8"));
        }
        byte[] postDataBytes = postData.toString().getBytes("UTF-8");

        HttpURLConnection conn = (HttpURLConnection)url.openConnection();
        conn.setRequestMethod("POST");
        conn.setRequestProperty("Content-Type", "application/x-www-form-urlencoded");
        conn.setRequestProperty("Content-Length", String.valueOf(postDataBytes.length));
        conn.setDoOutput(true);
        conn.getOutputStream().write(postDataBytes);

        Reader in = new BufferedReader(new InputStreamReader(conn.getInputStream(), "UTF-8"));

        System.out.println("ABCD : sms SENT");
        for (int c; (c = in.read()) >= 0;)
            System.out.print((char)c);
        
        int resCode = conn.getResponseCode();
        String  resMsg = conn.getResponseMessage();
        System.out.println(resCode +"," + resMsg);
        System.out.println("Sms send");
        
        return resCode;
        
    }
}
