package com.gx.util.listen;



import com.google.common.util.concurrent.ThreadFactoryBuilder;
import com.gx.util.CustomRejectedExecutionHandler;
import com.liferay.portal.kernel.util.ServerDetector;
import org.apache.http.config.Registry;
import org.apache.http.config.RegistryBuilder;
import org.apache.http.config.SocketConfig;
import org.apache.http.conn.DnsResolver;
import org.apache.http.conn.HttpConnectionFactory;
import org.apache.http.conn.ManagedHttpClientConnection;
import org.apache.http.conn.routing.HttpRoute;
import org.apache.http.conn.socket.ConnectionSocketFactory;
import org.apache.http.conn.socket.PlainConnectionSocketFactory;
import org.apache.http.conn.ssl.SSLConnectionSocketFactory;
import org.apache.http.impl.conn.DefaultHttpResponseParserFactory;
import org.apache.http.impl.conn.ManagedHttpClientConnectionFactory;
import org.apache.http.impl.conn.PoolingHttpClientConnectionManager;
import org.apache.http.impl.conn.SystemDefaultDnsResolver;
import org.apache.http.impl.io.DefaultHttpRequestWriterFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.management.MBeanServer;
import javax.management.MBeanServerFactory;
import javax.management.ObjectName;
import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import java.net.InetAddress;
import java.net.NetworkInterface;
import java.net.SocketException;
import java.util.*;
import java.util.concurrent.LinkedBlockingDeque;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;

public class ApplicationListener implements ServletContextListener{
	private final static transient Logger logger = LoggerFactory.getLogger(ApplicationListener.class);
	public static PoolingHttpClientConnectionManager manager = null;
	public static volatile ThreadPoolExecutor customExecutor;
	public static String SERVER_IP;
	public static String SERVER_TYPE;
    public static Map<String, Integer> PORTS = new HashMap<String, Integer>();
    public static ServletContext context;
    public static String cont_path = "/";
    public static volatile boolean SMS_CONNECTION_STATUS = true;
	@Override
	public void contextInitialized(ServletContextEvent event) {
	    context = event.getServletContext();
        cont_path = event.getServletContext().getRealPath("/");
		initHttpPoolManager();
		initNetworkPortAndIp();
//		augmenterLoadStock2Redis();
//		initLoadWhiteList2Redis();
	}
	 
	/**
	 * 增量将库存信息load进redis
	 */
//	private static void augmenterLoadStock2Redis(){
//	    logger.info(">>>>>>>>>>augmenterLoadStock2Redis<<<<<<<<<<");
//        IMerchandiseManageService merchandiseManageService = DqdpAppContext.getSpringContext().getBean(IMerchandiseManageService.class);
//	    try{
//	        merchandiseManageService.augmenterLoadStock2Redis();
//        }catch(Throwable e){
//            logger.error("库存加入缓存失败："+e.getLocalizedMessage(),e);
//        }
//	}
	
	/**
	 * 获取网络端口跟ip
	 * @throws SocketException
	 */
	private static void initNetworkPortAndIp(){
	    try {
	        Enumeration<NetworkInterface> netInterfaces = NetworkInterface.getNetworkInterfaces();
            while (netInterfaces.hasMoreElements()) {
                NetworkInterface ni = (NetworkInterface) netInterfaces.nextElement();
                Enumeration<InetAddress> inetAddressList = ni.getInetAddresses();
                while (inetAddressList.hasMoreElements()) {
                    InetAddress ip = (InetAddress) inetAddressList.nextElement();
                    if ((ip.isSiteLocalAddress()) && (!ip.isLoopbackAddress())
                            && (ip.getHostAddress().indexOf(":") == -1)) {
                        SERVER_IP = (ip.getHostAddress());
                        break;
                    }
                }
            }
            MBeanServer mBeanServer = null;
            ArrayList<MBeanServer> mBeanServers = MBeanServerFactory
                    .findMBeanServer(null);
            int serverType = 1;
            if (mBeanServers.size() > 0) {
                for (MBeanServer _mBeanServer : mBeanServers) {
                    mBeanServer = _mBeanServer;
                    if (ServerDetector.isTomcat()) {
                        SERVER_TYPE = "tomcat";
                        serverType = 1;
                    }
                    if (ServerDetector.isJBoss()) {
                        SERVER_TYPE = "jboss";
                        serverType = 2;
                    }
                    if (ServerDetector.isWebLogic()) {
                        SERVER_TYPE = "weblogic";
                        serverType = 3;
                    }
                }
            }
            if (mBeanServer == null) {
                throw new IllegalStateException("没有发现JVM中关联的MBeanServer.");
            }
            Set<ObjectName> objectNames = null;
            switch (serverType) {
            case 1:
                objectNames = mBeanServer.queryNames(new ObjectName("Catalina:type=Connector,*"), null);
                break;
            case 2:
                objectNames = mBeanServer.queryNames(new ObjectName("jboss.web:type=Connector,*"), null);
                break;
            default:
                throw new IllegalStateException("未能识别的服务器类型");
            }

            if ((objectNames == null) || (objectNames.size() <= 0)) {
                throw new IllegalStateException("没有发现JVM中关联的MBeanServer : "
                        + mBeanServer.getDefaultDomain() + " 中的对象名称.");
            }
            String scheme = "http";
            for (ObjectName objectName : objectNames) {
                Object _protocol = mBeanServer.getAttribute(objectName, "protocol");
                Object _scheme = mBeanServer.getAttribute(objectName, "scheme");

                if ((scheme.equals(_scheme))) {
                    PORTS.put(_protocol.toString(), (Integer) mBeanServer.getAttribute(objectName, "port"));
                }
            }
            
        } catch (Throwable e) {
            e.printStackTrace();
            logger.info("获取服务器ip&port："+e);
        }
	    
	}
	
	/**
	 * 初始化HttpClient的连接池
	 */
	private static void initHttpPoolManager(){
		//注册访问协议相关的Socket工厂
		Registry<ConnectionSocketFactory> socketFactoryRegistry = RegistryBuilder
				.<ConnectionSocketFactory>create()
				.register("http", PlainConnectionSocketFactory.INSTANCE)
				.register("https", SSLConnectionSocketFactory.getSystemSocketFactory())
				.build();
		//HttpConnection工厂：配置写请求/解析相应处理器
		HttpConnectionFactory<HttpRoute, ManagedHttpClientConnection> connFactory =
				new ManagedHttpClientConnectionFactory(DefaultHttpRequestWriterFactory.INSTANCE,
						DefaultHttpResponseParserFactory.INSTANCE);
		//DNS解析器
		DnsResolver dnsResolver = SystemDefaultDnsResolver.INSTANCE;
		//创建池化连接管理器
		manager = new PoolingHttpClientConnectionManager(socketFactoryRegistry,
				connFactory, 
				dnsResolver);
		//默认为Socket配置
		SocketConfig defaultSocketConfig = SocketConfig.custom().setTcpNoDelay(true).build();
		manager.setDefaultSocketConfig(defaultSocketConfig);
		
		manager.setMaxTotal(300);//设置【整个连接池】的最大连接数
		//可以为某个路由单独设置其连接数大小
		//manager.setMaxPerRoute(new HttpRoute(new HttpHost("ecss.com",80)), 100);
		manager.setDefaultMaxPerRoute(200);//每个路由最大连接数（路由是对maxTotal的细分）
//		manager.setValidateAfterInactivity(5 * 10000);//在从连接池获取连接时，连接不活跃多长时间后需要进行一次校验，默认为2s
		
	}
	/**
	 * 自定义线程池
	 * @return
	 */
	private static ThreadPoolExecutor getThreadInstance(){
		if(null == customExecutor){
			String logMessage ="execute By CustomThreadPool-%d";
			customExecutor = new ThreadPoolExecutor(20, //核心线程池大小
					200, //最大线程池大小
					60L, //回收空闲线程的时间
					TimeUnit.SECONDS,
					new LinkedBlockingDeque<Runnable>(1500), //任务队列
					new ThreadFactoryBuilder().setNameFormat(logMessage).build(),
					new CustomRejectedExecutionHandler(logMessage));//饱和策略
			Runtime.getRuntime().addShutdownHook(new Thread(){
				@Override
				public void run() {
					try{
						customExecutor.shutdown();
					}catch(Throwable e){
						logger.error("关闭customExecutor失败"+e);
					}
				}
			});
		}
		return customExecutor;
	}
	/**
	 * 初始化短信的数据库连接
	 */
	/*private static void initSMConnection(){
        try{
            SMSUtils.fixedInit();
        }catch(Throwable e){
            logger.info(e.getMessage());
        }
        Runtime.getRuntime().addShutdownHook(new Thread(){
            @Override
            public void run() {
                try{
                    SMSUtils.release();
                }catch(Throwable e){
                    logger.error("关闭customExecutor失败"+e);
                }
            }
        });
    }*/
	
	@Override
	public void contextDestroyed(ServletContextEvent event) {
		 
	}

	
//	private static void initLoadWhiteList2Redis(){
//	    logger.info(">>>>>>>>>>initLoadStock2Redis<<<<<<<<<<");
//	    IWhitelistMgrService whitelistMgrService = DqdpAppContext.getSpringContext().getBean(IWhitelistMgrService.class);
//	    try{
//	    	whitelistMgrService.LoadWhiteList2Redis();
//	    }catch(Throwable e){
//	    	logger.error("白名单插入缓存失败："+e.getLocalizedMessage(),e);
//	    }
//	}
}
