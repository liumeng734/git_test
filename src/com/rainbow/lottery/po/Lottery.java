package com.rainbow.lottery.po;

import java.io.Serializable;
import java.math.BigDecimal;

/**
 * <description>彩票业务中心页面展示</description> 
 * @author li-jx
 * @since 1.4
 * @version 1.0
 * @data 2015.04.25
 * 
 */
public class Lottery implements Serializable{
	
	private static final long serialVersionUID = 1294233722161646735L;
	
	private BigDecimal id;//ID字段，主键
	private String name;
	public BigDecimal getId() {
		return id;
	}
	public void setId(BigDecimal id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
}
