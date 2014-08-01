package com.liaoyu.utils;

import java.io.IOException;
import java.io.PrintWriter;
import java.security.Key;
import java.security.MessageDigest;
import java.security.Security;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.crypto.Cipher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//import com.alibaba.fastjson.JSON;

public class MethodUtil {
	
	/**
	 * 获取登录用户的IP地址
	 * 
	 * @param request
	 * @return
	 */
	public static String getIpAddr(HttpServletRequest request) {
		String ip = request.getHeader("x-forwarded-for");
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getHeader("Proxy-Client-IP");
		}
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getHeader("WL-Proxy-Client-IP");
		}
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getRemoteAddr();
		}
		if (ip.equals("0:0:0:0:0:0:0:1")) {
			ip = "本地";
		}
		return ip;
	}
	
    /**
     * 
     * <br>
     * <b>功能：</b>MD5加密方法<br>
     * <b>作者：</b>肖财高<br>
     * <b>日期：</b> 2013-4-9 <br>
     * @param str
     * @param encoding  default UTF-8
     * @param no_Lower_Upper  0,1,2
     * @return
     */
	public static String getMD5(String str,String encoding,int no_Lower_Upper) {
		if(null==encoding)encoding="utf-8";
		StringBuffer sb = new StringBuffer();
		try {
			MessageDigest md = MessageDigest.getInstance("MD5");
			byte[] array = md.digest(str.getBytes(encoding));
			for (int i = 0; i < array.length; i++) {
				sb.append(Integer.toHexString((array[i] & 0xFF) | 0x100).toUpperCase().substring(1, 3));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		if(no_Lower_Upper==0){
			return sb.toString();
		}
		if(no_Lower_Upper==1){
			return sb.toString().toLowerCase();
		}
		if(no_Lower_Upper==2){
			return sb.toString().toUpperCase();
		}
		return null;
	}
	
	
    /**
     * 
     * <br>
     * <b>功能：</b>DES<br>
     * <b>作者：</b>肖财高<br>
     * <b>日期：</b> 2013-4-9 <br>
     * @param arrBTmp
     * @return
     * @throws Exception
     */
	private Key getKey(byte[] arrBTmp) throws Exception {
		byte[] arrB = new byte[8];// 创建一个空的8位字节数组（默认值为0）
		for (int i = 0; i < arrBTmp.length && i < arrB.length; i++) { // 将原始字节数组转换为8位
			arrB[i] = arrBTmp[i];
		}
		Key key = new javax.crypto.spec.SecretKeySpec(arrB, "DES");// 生成密钥
		return key;
	}
    /**
     * 
     * <br>
     * <b>功能：</b>DES<br>
     * <b>作者：</b>肖财高<br>
     * <b>日期：</b> 2013-4-9 <br>
     * @param strIn
     * @return
     * @throws Exception
     */
	private static byte[] hexStr2ByteArr(String strIn) throws Exception {
		byte[] arrB = strIn.getBytes();
		int iLen = arrB.length;

		// 两个字符表示一个字节，所以字节数组长度是字符串长度除以2
		byte[] arrOut = new byte[iLen / 2];
		for (int i = 0; i < iLen; i = i + 2) {
			String strTmp = new String(arrB, i, 2);
			arrOut[i / 2] = (byte) Integer.parseInt(strTmp, 16);
		}
		return arrOut;
	}
    /**
     * 
     * <br>
     * <b>功能：</b>DES<br>
     * <b>作者：</b>肖财高<br>
     * <b>日期：</b> 2013-4-9 <br>
     * @param arrB
     * @return
     * @throws Exception
     */
	private static String byteArr2HexStr(byte[] arrB) throws Exception {
		int iLen = arrB.length;
		// 每个byte用两个字符才能表示，所以字符串的长度是数组长度的两倍
		StringBuffer sb = new StringBuffer(iLen * 2);
		for (int i = 0; i < iLen; i++) {
			int intTmp = arrB[i];
			// 把负数转换为正数
			while (intTmp < 0) {
				intTmp = intTmp + 256;
			}
			// 小于0F的数需要在前面补0
			if (intTmp < 16) {
				sb.append("0");
			}
			sb.append(Integer.toString(intTmp, 16));
		}
		return sb.toString();
	}
	/**
	 * 
	 * <br>
	 * <b>功能：</b>DES方法  0为加密,1为解密<br>
	 * <b>作者：</b>肖财高<br>
	 * <b>日期：</b> 2013-4-9 <br>
	 * @param deskey  密钥
	 * @param str    内容
	 * @param type  0为加密,1为解密
	 * @return
	 */
	public String getDES(String deskey, String str, int type) {
		Cipher encryptCipher = null;
		Cipher decryptCipher = null;
		Security.addProvider(new com.sun.crypto.provider.SunJCE());
		try {
			Key key = getKey(deskey.getBytes());
			encryptCipher = Cipher.getInstance("DES");
			encryptCipher.init(Cipher.ENCRYPT_MODE, key);
			decryptCipher = Cipher.getInstance("DES");
			decryptCipher.init(Cipher.DECRYPT_MODE, key);
			if (type == 0) { // 0为加密
				return byteArr2HexStr(encryptCipher.doFinal(str.getBytes()));
			} else {
				return new String(decryptCipher.doFinal(hexStr2ByteArr(str)));
			}
		} catch (Exception e) {
			return null;
		}
	}
	/*********************************************************************************/
	/**
	 * 
	 * <br>
	 * <b>功能：</b>静态方法<br>
	 * <b>作者：</b>肖财高<br>
	 * <b>日期：</b> 2013-4-9 <br>
	 * @return
	 */
	public static MethodUtil getInstance(){
		return new MethodUtil();
	}
    /**
     * 
     * <br>
     * <b>功能：</b>方法功能描述<br>
     * <b>作者：</b>肖财高<br>
     * <b>日期：</b> 2013-4-9 <br>
     * @param min
     * @param max
     * @return
     */
	public int getRandom(int min, int max) {
		// int a = (int) (Math.random() * (44) + 23); //产生的[23,67)的随机数
		return (int) (Math.random() * (max - min) + min);
	}
	/**
	 * 
	 * <br>
	 * <b>功能：</b>获取随机数从1开始,格式10000000-99999999<br>
	 * <b>作者：</b>肖财高<br>
	 * <b>日期：</b> 2013-4-9 <br>
	 * @param number 1
	 * @return
	 */
	public int getRandom(int number) {
		int max = 9;
		int min = 1;
		for (int i = 1; i < number; i++) {
			min = min * 10;
			max = max * 10 + 9;
		}
		return this.getRandom(min, max);
	}
    /**
     * 
     * <br>
     * <b>功能：</b>获取日期方法<br>
     * <b>作者：</b>肖财高<br>
     * <b>日期：</b> 2013-4-9 <br>
     * @param type 0=yyyy-MM-dd HH:mm:ss,1=yyyyMMddHHmmss,2=yyyyMMdd
     * @param formatStr null 自定义
     * @return
     */
	public String getDate(int type,String formatStr){
		Date date = new Date();
		SimpleDateFormat sdf = null;
		if(null!=formatStr){
		   sdf=new SimpleDateFormat(formatStr);
		}else if(type==0){
			sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		}else if(type==1){
			sdf=new SimpleDateFormat("yyyyMMddHHmmss");
		}else if(type==2){
			sdf=new SimpleDateFormat("yyyyMMdd");
		}
		String str=sdf.format(date);
		return str;
	}

	/**
	 * 
	 * <br>
	 * <b>功能：</b>时间差<br>
	 * <b>作者：</b>肖财高<br>
	 * <b>日期：</b> 2013-4-9 <br>
	 * @param current_time  当前时间
	 * @param compare_time  比较时间
	 * @return 60秒为一分钟
	 */
	public long getDateCompare(String current_time, String compare_time) {
		SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		long time = 0;
		try {
			Date c_tiem = sf.parse(current_time);
			Date com_time = sf.parse(compare_time);
			long l = c_tiem.getTime() - com_time.getTime() > 0 ? c_tiem.getTime() - com_time.getTime() : com_time.getTime() - c_tiem.getTime();
			time = l / 1000; // 算出超时秒数
		} catch (Exception e) {
			e.printStackTrace();
		}
		return time;
	}
	
	/**
	 * 
	 * <br>
	 * <b>功能：</b>处理时间的加减运算 60*60 为一个小时  60*60*24 为一天<br>
	 * <b>作者：</b>肖财高<br>
	 * <b>日期：</b> 2013-4-9 <br>
	 * @param startTime
	 * @param endTime
	 * @param type 0为加 1为减
	 * @return
	 */
	public long getDateAdd(String startTime, String endTime, int type) {
		long time = 0l;
		try {
			Date date = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(startTime);
			Date addLong = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(endTime);
			switch (type) {
			case 0:
				time = (date.getTime() / 1000) + (addLong.getTime() / 1000);
				break;
			case 1:
				time = (date.getTime() / 1000) - (addLong.getTime() / 1000);
				break;
			default:
				time = (date.getTime() / 1000) + (addLong.getTime() / 1000);
				break;
			}
			date.setTime(time * 1000);
			time = date.getTime();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return time;
	}

	/**
	 * 
	 * <br>
	 * <b>功能：</b>一个月最大day<br>
	 * <b>作者：</b>肖财高<br>
	 * <b>日期：</b> 2013-4-9 <br>
	 * @param time 时间
	 * @return obj[0]=maxMonth; obj[1]=time;
	 */
	public Object[] getMaxMonth(String time) {
		Object[] obj = new Object[2];
		Date date = null;
		try {
			date = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(time);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		Calendar a = Calendar.getInstance();
		a.setTime(date);
		a.set(Calendar.DATE, 1); // 把日期设置为当月第一天
		a.roll(Calendar.DATE, -1);// 日期回滚一天，也就是最后一天
		int maxMonth = a.get(Calendar.DATE);
		a.roll(Calendar.DATE, 1);
		// System.out.println("该月最大天数:"+maxMonth+",某月="+a.get(Calendar.MONTH));
		time = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(a.getTime());
		// System.out.println("time="+time);
		obj[0] = maxMonth;
		obj[1] = time;
		return obj;
	}

	
	/**
	 * 
	 * <br>
	 * <b>功能：</b>20位可用于UUID,订单号<br>
	 * <b>作者：</b>肖财高<br>
	 * <b>日期：</b> 2013-4-9 <br>
	 * @return
	 */
	public String getUid(){
		return new SimpleDateFormat("yyMMddHHmmss").format(new Date()) + getRandom(8);
	}
	
    /**
     * 
     * <br>
     * <b>功能：</b>12位时间加上number位数<br>
     * <b>作者：</b>肖财高<br>
     * <b>日期：</b> 2013-4-9 <br>
     * @param number 
     * @return
     */
	public Long getUid(int number) {
		return Long.parseLong(new SimpleDateFormat("yyMMddHHmmss").format(new Date()) + getRandom(number));
	}
	
	public static void main(String[] args) {
		MethodUtil util=new MethodUtil();
		for(int i=0;i<1000;i++){
		  System.out.println(util.getUid());
		}
	}

	 /**
     * 
     * <br>
     * <b>功能：</b>输出JSON<br>
     * <b>作者：</b>肖财高<br>
     * <b>日期：</b> 2013-4-24 <br>
     * @param response
     * @param type 0=成功 其他=失败
     * @param msg
     */
/*	public void toJsonMsg(HttpServletResponse response, int type, String msg) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("state", type);
		if (type == 0) {
			map.put("success", true);
			if (msg == null) {
				map.put("msg", "成功");
			} else {
				map.put("msg", msg);
			}
		} else {
			map.put("success", false);
			if (msg == null) {
				map.put("msg", "失败");
			} else {
				map.put("msg", msg);
			}
		}
		this.toJsonPrint(response, JSON.toJSONString(map));
	}*/
	
	/**
	 * 
	 * <br>
	 * <b>功能：</b>打印JSON<br>
	 * <b>作者：</b>肖财高<br>
	 * <b>日期：</b> 2013-4-25 <br>
	 * @param response
	 * @param str
	 */
	public void toJsonPrint(HttpServletResponse response, String str){
		//不需要设置  避免IE9 出现下载
		//response.setContentType("application/json");text/html;charset=UTF-8
		//response.setContentType("application/json");
		this.writer(response, str);
	}
    /**
     * 
     * <br>
     * <b>功能：</b>打印<br>
     * <b>作者：</b>肖财高<br>
     * <b>日期：</b> 2013-4-24 <br>
     * @param response
     * @param str
     */
	public void writer(HttpServletResponse response, String str) {
		try {
			// 设置页面不缓存
			response.setHeader("Pragma", "No-cache");
			response.setHeader("Cache-Control", "no-cache");
			response.setCharacterEncoding("UTF-8");
			PrintWriter out = null;
			out = response.getWriter();
			System.out.println("print:"+str);
			out.print(str);
			out.flush();
			out.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	/**
	 * 
	 * <br>
	 * <b>功能：</b>输出脚本<br>
	 * <b>作者：</b>肖财高<br>
	 * <b>日期：</b> 2013-4-25 <br>
	 * @param response
	 * @param str
	 */
	public void toSript(HttpServletResponse response,String str){
		 StringBuffer sb=new StringBuffer();
		 sb.append("<script type=\"text/javascript\">");
		 sb.append(str);
		 sb.append("</script>");
		 response.setContentType("text/html");
		 this.writer(response, sb.toString());
	}
}
