package cc.rck.tools;

import javax.servlet.http.HttpServletRequest;

public class IPTool {
	public IPTool(){
			
	}
	
	public static String getRealIP(HttpServletRequest req){
		String ip = req.getHeader("x-real_ip");
		
		if( null==ip || ip.isEmpty() || "unknown".equalsIgnoreCase(ip) ){
			ip = req.getHeader("x-forwareded-for");
		}
		if( null==ip || ip.isEmpty() || "unknown".equalsIgnoreCase(ip) ){
			ip = req.getRemoteAddr();
		}
		return ip;
	}
}
