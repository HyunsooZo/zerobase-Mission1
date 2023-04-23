package com.example.wifiaroundme;

import com.google.gson.*;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;

public class WifiApi {
    static public int total;
    static public ArrayList<ArrayList<String>> result;
    public ArrayList<ArrayList<String>> callApi() throws IOException {

        String authKey = "7477737346627a683639614742424f";
        String apiURL = "http://openapi.seoul.go.kr:8088/" + authKey + "/json/TbPublicWifiInfo/1/100";
        URL url = new URL(apiURL);
        HttpURLConnection connection = (HttpURLConnection) url.openConnection();
        BufferedReader in = new BufferedReader(new InputStreamReader(connection.getInputStream()));
        String temp;
        StringBuffer res = new StringBuffer();
        while ((temp = in.readLine()) != null) {
            res.append(temp);
        }
        in.close();
        JsonParser parser = new JsonParser();
        JsonObject jsonObj = (JsonObject) parser.parse(res.toString());
        total = jsonObj.getAsJsonObject("TbPublicWifiInfo").get("list_total_count").getAsInt();
        result = new ArrayList<>();
        JsonArray jsonArr = jsonObj.getAsJsonObject("TbPublicWifiInfo").getAsJsonArray("row");
        for (int i = 0; i < jsonArr.size(); i++) {
            ArrayList<String> wifiInfo = new ArrayList<>();
            JsonObject object = (JsonObject) jsonArr.get(i);
            wifiInfo.add("위치정보");
            wifiInfo.add(object.get("X_SWIFI_MGR_NO").toString().replaceAll("-", ""));
            wifiInfo.add(object.get("X_SWIFI_WRDOFC").toString());
            wifiInfo.add(object.get("X_SWIFI_MAIN_NM").toString());
            wifiInfo.add(object.get("X_SWIFI_ADRES1").toString());
            wifiInfo.add(object.get("X_SWIFI_ADRES2").toString());
            wifiInfo.add(object.get("X_SWIFI_INSTL_FLOOR").toString());
            wifiInfo.add(object.get("X_SWIFI_INSTL_TY").toString());
            wifiInfo.add(object.get("X_SWIFI_INSTL_MBY").toString());
            wifiInfo.add(object.get("X_SWIFI_SVC_SE").toString());
            wifiInfo.add(object.get("X_SWIFI_CMCWR").toString());
            wifiInfo.add(object.get("X_SWIFI_CNSTC_YEAR").toString());
            wifiInfo.add(object.get("X_SWIFI_INOUT_DOOR").toString());
            wifiInfo.add(object.get("X_SWIFI_REMARS3").toString());
            wifiInfo.add(object.get("LNT").toString());
            wifiInfo.add(object.get("LAT").toString());
            wifiInfo.add(object.get("WORK_DTTM").toString());
            result.add(wifiInfo);
        }
//        result.sort(Comparator.comparingDouble(o -> Double.parseDouble(o.get(0))));
        return result;
    }
}
