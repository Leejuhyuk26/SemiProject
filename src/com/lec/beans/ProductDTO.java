package com.lec.beans;

public class ProductDTO {
	private int pro_num;
	private String pro_kind;
	private int pro_price;
	private int pro_cnt;
	private String pro_name;
	
	public ProductDTO() {
		super();
		System.out.println("ProductDTO() 객체 생성");
	}
	
	
	public ProductDTO(int pro_num, String pro_kind, int pro_price, int pro_cnt, String pro_name) {
		super();
		this.pro_num = pro_num;
		this.pro_kind = pro_kind;
		this.pro_price = pro_price;
		this.pro_cnt = pro_cnt;
		this.pro_name = pro_name;
	}




	public int getPro_num() {
		System.out.println("getPro_num 호출");
		return pro_num;
	}
	public void setPro_num(int pro_num) {
		System.out.println("setPro_num 호출");
		this.pro_num = pro_num;
	}
	public String getPro_kind() {
		System.out.println("getPro_kind 호출");
		return pro_kind;
	}
	public void setPro_kind(String pro_kind) {
		System.out.println("setPro_kind 호출");
		this.pro_kind = pro_kind;
	}
	public int getPro_price() {
		System.out.println("getPro_price 호출");
		return pro_price;
	}
	public void setPro_price(int pro_price) {
		System.out.println("setPro_price 호출");
		this.pro_price = pro_price;
	}
	public int getPro_cnt() {
		System.out.println("getPro_cnt 호출");
		return pro_cnt;
	}
	public void setPro_cnt(int pro_cnt) {
		System.out.println("setPro_cnt 호출");
		this.pro_cnt = pro_cnt;
	}
	public String getPro_name() {
		System.out.println("getPro_name 호출");
		return pro_name;
	}
	public void setPro_name(String pro_name) {
		System.out.println("setPro_name 호출");
		this.pro_name = pro_name;
	}
	@Override
	public String toString() {
		return "ProductDTO [pro_num=" + pro_num + ", pro_kind=" + pro_kind + ", pro_price=" + pro_price + ", pro_cnt="
				+ pro_cnt + ", pro_name=" + pro_name + "]";
	}

	
}
