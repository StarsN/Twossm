package com.gx.util;

import java.util.concurrent.RejectedExecutionException;
import java.util.concurrent.RejectedExecutionHandler;
import java.util.concurrent.ThreadPoolExecutor;

public class CustomRejectedExecutionHandler implements RejectedExecutionHandler {
	 private String logMessage;
	 public CustomRejectedExecutionHandler(String logMessage){
		 this.logMessage = logMessage;
	 };
	@Override
	public void rejectedExecution(Runnable r, ThreadPoolExecutor executor) {
		 throw new RejectedExecutionException("The rejected location："+logMessage+"Task " + r.getClass() +
                 " rejected from " +
                 executor.toString());
	}

}
