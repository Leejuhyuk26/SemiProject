package com.lec.beans;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Time;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import common.D;

//
public class ProductDAO {
	Connection conn;
	PreparedStatement pstmt;
	Statement stmt;
	ResultSet rs;

	// DAO 객체생성 Connection 도 생성
	public ProductDAO() {
		try {
			Class.forName(D.DRIVER);
			conn = DriverManager.getConnection(D.URL, D.USERID, D.USERPW);
			System.out.println("ProductDAO 생성, 데이터베이스 연결. . ");
			// 연결확인
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void close() throws SQLException {
		if (rs != null)
			rs.close();
		if (pstmt != null)
			pstmt.close();
		if (stmt != null)
			stmt.close();
		if (conn != null)
			conn.close();
	} // end close()

	public int insert(ProductDTO dto) throws SQLException {
		int cnt = 0;

		String pKind = dto.getPro_kind();
		int pPrice = dto.getPro_price();
		int pCnt = dto.getPro_cnt();
		String pName = dto.getPro_name();
		String pCtt = dto.getPro_content();

		cnt = this.insert(pKind, pPrice, pCnt, pName, pCtt);
		return cnt; 
	}

	// 상품 등록
	public int insert(String pKind, int pPrice, int pCnt, String pName, String pCtt) throws SQLException {
		int cnt = 0;

		try {
			pstmt = conn.prepareStatement(D.SQL_PRODUCT_INSERT);
			pstmt.setString(1, pKind);
			pstmt.setInt(2, pPrice);
			pstmt.setInt(3, pCnt);
			pstmt.setString(4, pName);
			pstmt.setString(5, pCtt);
			cnt = pstmt.executeUpdate();
		} finally {
			close();
		}

		return cnt;
	} // end insert()

	// ResultSet => DTO배열로 리턴 shop.jsp로
	public ProductDTO[] createArray(ResultSet rs) throws SQLException {
		ProductDTO[] arr = null;
		ArrayList<ProductDTO> list = new ArrayList<ProductDTO>();

		while (rs.next()) {
			int pNum = rs.getInt("pro_num");
			String pKind = rs.getString("pro_kind");
			int price = rs.getInt("pro_price");
			int pCnt = rs.getInt("pro_cnt");
			String pName = rs.getString("pro_name");
			String pCtt = rs.getString("pro_content");
			ProductDTO dto = new ProductDTO(pNum, pKind, price, pCnt, pName, pCtt);
			list.add(dto);
		} // end while
		int size = list.size();
		if (size == 0)
			return null;
		arr = new ProductDTO[size];
		list.toArray(arr); // 리스트 -> 배열 변환
		return arr;
	} // end createArray()

	// 전체 글 SELECT
	public ProductDTO[] select() throws SQLException {
		ProductDTO[] arr = null;

		try {
			pstmt = conn.prepareStatement(D.SQL_PRODUCT_SELECT);
			rs = pstmt.executeQuery();
			arr = createArray(rs);
			System.out.println(arr);
		} finally {
			close();
		}

		return arr;

	} // end select()

	// 특정 num 의 글 만 SELECT
	public ProductDTO[] selectBypName(String pName) throws SQLException {
		ProductDTO[] arr = null;

		try {
			pstmt = conn.prepareStatement(D.SQL_PRODUCT_SELECT_BY_NAME);
			pstmt.setString(1, pName);
			rs = pstmt.executeQuery();
			arr = createArray(rs);
		} finally {
			close();
		} // end try

		return arr;
	} // end selectByNum()

	// 특정 num 의 글 내용 읽기
	public ProductDTO[] readBypNum(int pNum) throws SQLException {

		int cnt = 0;
		ProductDTO[] arr = null;

		try {
			pstmt = conn.prepareStatement(D.SQL_PRODUCT_SELECT_BY_NUM);
			pstmt.setInt(1, pNum);
			rs = pstmt.executeQuery();

			arr = createArray(rs);

			conn.commit(); // 트랜잭션 성공!
		} catch (SQLException e) {
			conn.rollback(); // 트랜잭션 실패하면 rollback()
			throw e;
		} finally {
			close();
		} // end try

		return arr;
	} // end readByNum()

	// 특정 글 수정
	public int update(int pNum, int price, int pCnt) throws SQLException {
		int cnt = 0;

		try {
			pstmt = conn.prepareStatement(D.SQL_PRODUCT_UPDATE);

			pstmt.setInt(1, price);
			pstmt.setInt(2, pCnt);
			pstmt.setInt(3, pNum);

			cnt = pstmt.executeUpdate();
		} finally {
			close();
		} // end try

		return cnt;
	} // end update()

	// 특정 pNum 글 삭제 얘도 마찬가지
	public int deleteByNum(int pNum) throws SQLException {
		int cnt = 0;

		try {
			pstmt = conn.prepareStatement(D.SQL_PRODUCT_DELETE_BY_NUM);
			pstmt.setInt(1, pNum);
			cnt = pstmt.executeUpdate();
		} finally {
			close();
		} // end try

		return cnt;
	}
	// 수량 삭제
	public int deleteCnt(int sCnt, String pName) throws SQLException {
		int cnt = 0;

		try {
			pstmt = conn.prepareStatement(D.SQL_PRODUCT_DEC_CNT);
			pstmt.setInt(1, sCnt);
			pstmt.setString(2, pName);
			cnt = pstmt.executeUpdate();
		} finally {
			close();
		} // end try

		return cnt;
	} // end update()

	public ProductDTO[] selectByKind(String pKind) throws SQLException {
		ProductDTO[] arr = null;

		try {
			pstmt = conn.prepareStatement(D.SQL_PRODUCT_SELECT_BY_KIND);
			pstmt.setString(1, pKind);
			rs = pstmt.executeQuery();
			arr = createArray(rs);
		} finally {
			close();
		} // end try

		return arr;
	} // end selectByNum()
	
	
	

}
