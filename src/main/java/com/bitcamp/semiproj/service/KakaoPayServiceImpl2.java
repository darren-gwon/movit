/*
 * package com.bitcamp.semiproj.service;
 * 
 * import java.io.BufferedReader; import java.io.DataOutputStream; import
 * java.io.IOException; import java.io.InputStream; import
 * java.io.InputStreamReader; import java.io.OutputStream; import
 * java.net.HttpURLConnection; import java.net.MalformedURLException; import
 * java.net.URL;
 * 
 * import javax.servlet.http.HttpSession;
 * 
 * import org.json.simple.JSONObject; import org.json.simple.parser.JSONParser;
 * import org.json.simple.parser.ParseException; import
 * org.springframework.stereotype.Service;
 * 
 * //이전버전 public class KakaoPayServiceImpl2 implements KakaoPayService{ public
 * int approve(HttpSession session) {
 * 
 * String cid = (String)session.getAttribute("cid"); String tid =
 * (String)session.getAttribute("tid"); String pg_token =
 * (String)session.getAttribute("pg_token"); String partner_user_id =
 * (String)session.getAttribute("user_id"); String partner_order_id =
 * (String)session.getAttribute("partner_order_id");
 * 
 * try { URL url = new URL("https://kapi.kakao.com/v1/payment/approve");
 * HttpURLConnection conn = (HttpURLConnection) url.openConnection();
 * conn.setRequestMethod("POST"); conn.setRequestProperty("Authorization",
 * "KakaoAK e1ff9dd9f0346c637eaab414f5d209d6");
 * conn.setRequestProperty("Content-type",
 * "application/x-www-form-urlencoded;charset=utf-8"); conn.setDoOutput(true);
 * String parameters =
 * "cid="+cid+"&tid="+tid+"&partner_order_id="+partner_order_id +
 * "&partner_user_id="+partner_user_id+"&pg_token="+pg_token; OutputStream
 * output = conn.getOutputStream(); DataOutputStream dos = new
 * DataOutputStream(output); // dos.writeBytes(parameters);
 * dos.write(parameters.getBytes("utf-8")); dos.close();
 * 
 * int resultCode = conn.getResponseCode();
 * 
 * InputStream input; if(resultCode == 200) { input = conn.getInputStream(); }
 * else { input = conn.getErrorStream(); }
 * 
 * InputStreamReader reader = new InputStreamReader(input); BufferedReader br =
 * new BufferedReader(reader);
 * 
 * try { JSONParser jsonParser = new JSONParser(); JSONObject jsonObj =
 * (JSONObject)jsonParser.parse(br);
 * 
 * System.out.println(jsonObj.toJSONString());
 * 
 * session.removeAttribute("cid"); session.removeAttribute("tid");
 * session.removeAttribute("partner_order_id");
 * session.removeAttribute("pg_token");
 * 
 * } catch (ParseException e) { // TODO Auto-generated catch block
 * e.printStackTrace(); }
 * 
 * } catch (MalformedURLException e) { // TODO Auto-generated catch block
 * e.printStackTrace(); } catch (IOException e) { // TODO Auto-generated catch
 * block e.printStackTrace(); } return 0; } }
 */