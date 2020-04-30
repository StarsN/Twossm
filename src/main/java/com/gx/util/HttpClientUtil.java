package com.gx.util;

import cn.com.do1.common.util.AssertUtil;
import org.apache.http.HttpResponse;
import org.apache.http.HttpStatus;
import org.apache.http.NameValuePair;
import org.apache.http.client.config.RequestConfig;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.conn.ssl.SSLConnectionSocketFactory;
import org.apache.http.conn.ssl.SSLContextBuilder;
import org.apache.http.conn.ssl.TrustStrategy;
import org.apache.http.impl.DefaultConnectionReuseStrategy;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.DefaultConnectionKeepAliveStrategy;
import org.apache.http.impl.client.DefaultHttpRequestRetryHandler;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.util.EntityUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import javax.net.ssl.HostnameVerifier;
import javax.net.ssl.SSLContext;
import java.security.KeyManagementException;
import java.security.KeyStoreException;
import java.security.NoSuchAlgorithmException;
import java.security.cert.CertificateException;
import java.security.cert.X509Certificate;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map.Entry;
import java.util.concurrent.TimeUnit;
import com.gx.util.listen.ApplicationListener;
import com.gx.util.HttpClientUtil;
/**
 * 用PoolingHttpClientConnectionManager进行httpClient的池化管理
 * @author wxj
 */
public class HttpClientUtil {
	private final static transient Logger logger = LoggerFactory.getLogger(HttpClientUtil.class);
	static CloseableHttpClient httpClient = null;
	static CloseableHttpClient httpsClient = null;
	
	/**
	 * post请求 
	 * @param requestMap 请求参数
	 * @param headerMap header首部列表
	 * @param url 
	 * @param charset 编码
	 * @return
	 */
	public static String doPost(String url, String charset, HashMap<String, String> headerMap,
                                HashMap<String, String> requestMap){
		CloseableHttpClient httpclient = getHttpClient();
		HttpResponse response = null;
		String result = null;
		List<NameValuePair> list = new ArrayList<NameValuePair>();
		try{
			HttpPost httppost = new HttpPost(url);
			logger.info("httppost=" + httppost);
			if(!AssertUtil.isEmpty(headerMap)){
			    Iterator<Entry<String, String>> headerIterator = headerMap.entrySet().iterator();
	            while (headerIterator.hasNext()) {
	                Entry<String, String> elem = (Entry<String, String>) headerIterator.next();
	                httppost.addHeader(elem.getKey(), elem.getValue());
	            }
			}
			if(!AssertUtil.isEmpty(requestMap)){
	            Iterator<Entry<String, String>> iterator = requestMap.entrySet().iterator();
	            while (iterator.hasNext()) {
	                Entry<String, String> elem = (Entry<String, String>) iterator.next();
	                list.add(new BasicNameValuePair(elem.getKey(), elem.getValue()));
	            }
			}
	        if (list.size() > 0) {
	            UrlEncodedFormEntity entity = new UrlEncodedFormEntity(list, charset);
	            httppost.setEntity(entity);
	        }
	        response = httpclient.execute(httppost);
	        logger.info("响应response=" + response);
	        if(response.getStatusLine().getStatusCode() != HttpStatus.SC_OK){
				//消费响应体 防止连接不释放
				EntityUtils.consume(response.getEntity());
			}else{
				result = EntityUtils.toString(response.getEntity());
			}	
		}catch(Throwable e){
			if(response != null){
				try {
					EntityUtils.consume(response.getEntity());
				} catch (Throwable e1) {
					logger.error("释放对应的httpClient连接出错，"+e1);
				}
			}
			logger.error("对"+ url +"发起post请求发生异常："+e);
		}
		return result;
	}
	/**
	 * get请求
	 * @param url 完整的url
	 * @param headerMap 首部  可依据实际情况传入header
	 * @return
	 */
	public static String doGet(String url, HashMap<String, String> headerMap){
		String result = null;
		HttpResponse response = null;
		try{
			HttpGet httpget = new HttpGet(url);
			if(!AssertUtil.isEmpty(headerMap)){
			    Iterator<Entry<String, String>> headerIterator = headerMap.entrySet().iterator();
	            while (headerIterator.hasNext()) {
	                Entry<String, String> elem = (Entry<String, String>) headerIterator.next();
	                httpget.addHeader(elem.getKey(), elem.getValue());
	            }
			}
			response = getHttpClient().execute(httpget);
			if(response.getStatusLine().getStatusCode() != HttpStatus.SC_OK){
				//消费响应体 防止连接不释放
				EntityUtils.consume(response.getEntity());
			}else{
				result = EntityUtils.toString(response.getEntity());
			}
		}catch(Throwable e){
			if(response != null){
				try {
					EntityUtils.consume(response.getEntity());
				} catch (Throwable e1) {
					logger.error("释放对应的httpClient连接出错，"+e1);
				}
			}
			logger.error("对"+ url +"发起get请求发生异常："+e);
		} 
		return result;
	}
	public static synchronized CloseableHttpClient getHttpClient(){
		if(null == httpClient){
			System.out.println("httpClient实例生成");
			RequestConfig defaultRequestConfig = RequestConfig.custom()
					.setConnectTimeout(30 * 1000)//设置连接超时时间 2s
					.setSocketTimeout(120 * 1000)//设置等待数据超时时间 5s
					.setConnectionRequestTimeout(30 * 1000)//设置从连接池获取连接的等待超时时间
					.build();
			//创建HttpClient
			httpClient = HttpClients.custom()
					.setConnectionManager(ApplicationListener.manager)
//					.setConnectionManagerShared(false)//连接池不是共享模式
//					.evictIdleConnections(60, TimeUnit.SECONDS)//定期回收空闲连接
//					.evictExpiredConnections()//定期回收过期连接
//					.setConnectionTimeToLive(60, TimeUnit.SECONDS)//连接存活时间，如果不设置则根据长连接信息决定
					.setDefaultRequestConfig(defaultRequestConfig)//设置默认请求设置
					.setConnectionReuseStrategy(DefaultConnectionReuseStrategy.INSTANCE)//设置重用策略，即是否能keepAlive
					.setKeepAliveStrategy(DefaultConnectionKeepAliveStrategy.INSTANCE)//长连接配置，即获取长连接生产多长时间
					.setRetryHandler(new DefaultHttpRequestRetryHandler(0, false))//设置重试次数，默认是3次，当前禁用，根据需要开启
					.build();
			//JVM停止或重启时，关闭连接池释放掉连接
			Runtime.getRuntime().addShutdownHook(new Thread(){
				@Override
				public void run() {
					try{
						httpClient.close();
					}catch(Throwable e){
						logger.error("释放对应的httpClient连接出错，"+e);
					}
				}
			});
		}
		return httpClient;
	 }
	public static synchronized CloseableHttpClient getHttpsClient(){
		if(null == httpsClient){
			System.out.println("httpsClient实例生成");
			try{
				SSLContext sslcontext = new SSLContextBuilder().loadTrustMaterial(null, new TrustStrategy() {
					
					@Override
					public boolean isTrusted(X509Certificate[] arg0, String arg1) throws CertificateException {
						return true;
					}
				}).build();
				SSLConnectionSocketFactory sslsf = new SSLConnectionSocketFactory(sslcontext);
				RequestConfig defaultRequestConfig = RequestConfig.custom()
						.setConnectTimeout(30 * 1000)//设置连接超时时间 2s
						.setSocketTimeout(120 * 1000)//设置等待数据超时时间 5s
						.setConnectionRequestTimeout(30 * 1000)//设置从连接池获取连接的等待超时时间
						.build();
				httpsClient = HttpClients.custom()
						.setConnectionManager(ApplicationListener.manager)
//						.setConnectionManagerShared(false)//连接池不是共享模式
//						.evictIdleConnections(60, TimeUnit.SECONDS)//定期回收空闲连接
//						.evictExpiredConnections()//定期回收过期连接
//						.setConnectionTimeToLive(60, TimeUnit.SECONDS)//连接存活时间，如果不设置则根据长连接信息决定
						.setDefaultRequestConfig(defaultRequestConfig)//设置默认请求设置
						.setConnectionReuseStrategy(DefaultConnectionReuseStrategy.INSTANCE)//设置重用策略，即是否能keepAlive
						.setKeepAliveStrategy(DefaultConnectionKeepAliveStrategy.INSTANCE)//长连接配置，即获取长连接生产多长时间
						.setRetryHandler(new DefaultHttpRequestRetryHandler(0, false))//设置重试次数，默认是3次，当前禁用，根据需要开启
						.setSSLSocketFactory(sslsf)
						.build();
			}catch(Exception e){
				e.printStackTrace();
			}
			
			
			//创建HttpClient
			
			//JVM停止或重启时，关闭连接池释放掉连接
			Runtime.getRuntime().addShutdownHook(new Thread(){
				@Override
				public void run() {
					try{
						httpsClient.close();
					}catch(Throwable e){
						logger.error("释放对应的httpClient连接出错，"+e);
					}
				}
			});
		}
		return httpsClient;
	}
	
//	public static CloseableHttpClient createSSLClientDefault() {
//        try {
//            //使用 loadTrustMaterial() 方法实现一个信任策略，信任所有证书
//            SSLContext sslContext = new SSLContextBuilder().loadTrustMaterial(null, new TrustStrategy() {
//                // 信任所有
//                public boolean isTrusted(X509Certificate[] chain, String authType) throws CertificateException {
//                    return true;
//                }
//            }).build();
//            //NoopHostnameVerifier类:  作为主机名验证工具，实质上关闭了主机名验证，它接受任何
//            //有效的SSL会话并匹配到目标主机。
//            HostnameVerifier hostnameVerifier = NoopHostnameVerifier.INSTANCE;
//            SSLConnectionSocketFactory sslsf = new SSLConnectionSocketFactory(sslContext, hostnameVerifier);
//            return HttpClients.custom().setSSLSocketFactory(sslsf).build();
//        } catch (KeyManagementException e) {
//            e.printStackTrace();
//        } catch (NoSuchAlgorithmException e) {
//            e.printStackTrace();
//        } catch (KeyStoreException e) {
//            e.printStackTrace();
//        }
//        return HttpClients.createDefault();
//	}
 

}
