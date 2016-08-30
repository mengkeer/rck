package cc.rck.tools;

import java.security.MessageDigest;

/**
 *	SecurityTool:用于辅助进行密码加密、验证
 */
public class SecurityTool {
	//十六进制下数字到字符的映射数组 
	private final static String[] hexDigits =
		{"0","1","2","3","4","5","6","7","8","9","A","B","C","D","E","F"};
	
	
	/**
	 * 把inputString进行MD5加密(尽量直接使用compare比较,本函数返回的字符串为大写)
	 * @param inputString 输入的字符串
	 * @return MD5(inputStr):十六进制数用大写字母表示
	 */ 
	public static String MD5(String inputString){ 
		return encodeByMD5(inputString); 
	}
	
	/** 
	 * 验证输入的密码是否正确 
	 * @param inputStr 输入的字符串 
	 * @param MD5Str MD5加密后的密文 
	 * @return 验证结果(已考虑到MD5Str的大小写问题)，MD5(inputStr)==MD5Str 
	 */
	public static boolean compare(String inputStr, String MD5Str){ 
		return MD5Str.equalsIgnoreCase(encodeByMD5(inputStr));
	}
	
	/**对字符串进行MD5编码*/ 
	private static String encodeByMD5(String originString){ 
		if(originString == null)return null;
		
		try{ 
			//创建具有指定算法名称的信息摘要 
			MessageDigest md = MessageDigest.getInstance("MD5"); 
			//使用指定的字节数组对摘要进行最后更新，然后完成摘要计算 
			byte[] results = md.digest(originString.getBytes()); 
			//将得到的字节数组变成字符串返回 
			String resultString = byteArrayToHexString(results); 
			return resultString.toUpperCase(); 
		}catch(Exception ex){ 
			ex.printStackTrace(); 
		}
		return null;
		 
	}
	
	/** 
	 * 轮换字节数组为十六进制字符串 
	 * @param b 字节数组 
	 * @return 十六进制字符串 
	 */ 
	private static String byteArrayToHexString(byte[] b){ 
		StringBuffer resultSb = new StringBuffer(); 
		for(int i=0;i<b.length;i++){
			resultSb.append(byteToHexString(b[i])); 
		} 
		return resultSb.toString(); 
	}
	
	/** 
	 * 将一个字节转化成十六进制形式的字符串 
	 */ 
	private static String byteToHexString(byte b){ 
		int n = b; 
		if(n<0) 
			n=256+n; 
		int d1 = n/16; 
		int d2 = n%16; 
		return hexDigits[d1] + hexDigits[d2]; 
	}

}
