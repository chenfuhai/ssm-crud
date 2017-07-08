package com.liufeng.crud.bean;

import java.util.HashMap;
import java.util.Map;

/**
 * 设计一个通用的返回类 用来返回状态以及各种信息
 * @author fuhai
 *
 */
public class Msg {
	private static final int SUCCESS=100;
	private static final int ERROR=200;
	
	//信息
	public String msg;
	//状态码
	public int code;
	//额外附加的信息
	public Map<String,Object> extend;
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	public int getCode() {
		return code;
	}
	public void setCode(int code) {
		this.code = code;
	}
	public Map<String, Object> getExtend() {
		return extend;
	}
	public void setExtend(Map<String, Object> extend) {
		this.extend = extend;
	}
	public static Msg success() {
		Msg msg = new Msg();
		msg.setCode(SUCCESS);
		msg.setMsg("操作成功");
		return msg;
	}
	public static Msg error() {
		Msg msg = new Msg();
		msg.setCode(ERROR);
		msg.setMsg("操作失败");
		return msg;
	}
	public Msg add(String key,Object object) {
		this.getExtend().put(key, object);
		return this;
	}
	
	public Msg() {
		super();
		this.extend = new HashMap<String, Object>();
	}
	
}
