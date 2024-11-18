package model;

import java.lang.invoke.CallSite;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import org.eclipse.jdt.internal.compiler.ast.ReturnStatement;

public class BoardDAO {
	Connection con;
	PreparedStatement pstmt;
	ResultSet rs;
	
	public void getCon() {
		try {
			Context initContext = new InitialContext();
			Context envContext =(Context) initContext.lookup("java:/comp/env");
			DataSource ds = (DataSource) envContext.lookup("jdbc/pool");
			con = ds.getConnection();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void insertBoard(BoardBean bean) {
		// 빈 클래스에 넘어오지 않았던 데이터를 초기화해야 한다.
		getCon();
		int ref = 0; // 글의 그룹을 의미한다. 쿼리를 실행시켜서 가장 큰 ref 값을 가져온 후 +1
		int re_step = 1;
		int re_level = 1;
		
		try {
			String refSql = "select max(ref) from board";
			pstmt = con.prepareStatement(refSql);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				ref = rs.getInt(1) + 1;
			}
			// 실제로 게시글 전체값을 테이블에 저장함.
			String sql = "insert into board (writer, email, subject, password, reg_date, ref, re_step, re_level, readcount, content) values(?, ?, ?, ?, now(), ?, ?, ?, 0, ?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, bean.getWriter());
			pstmt.setString(2, bean.getEmail());
			pstmt.setString(3, bean.getSubject());
			pstmt.setString(4, bean.getPassword());
			pstmt.setInt(5,  ref);
			pstmt.setInt(6,  re_step);
			pstmt.setInt(7, re_level);
			pstmt.setString(8, bean.getContent());
			pstmt.executeUpdate();
			
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	public ArrayList<BoardBean> getAllBoard() {
		ArrayList<BoardBean> list = new ArrayList<>();
		getCon();
		try {
			String sql = "select * from board order by ref desc, re_step asc";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				BoardBean bean = new BoardBean();
				bean.setNum(rs.getInt(1));
				bean.setWriter(rs.getString(2));
				bean.setEmail(rs.getString(3));
				bean.setSubject(rs.getString(4));
				bean.setPassword(rs.getString(5));
				bean.setReg_date(rs.getDate(6).toString());
				bean.setRef(rs.getInt(7));
				bean.setRe_step(rs.getInt(8));
				bean.setRe_level(rs.getInt(9));
				bean.setReadcount(rs.getInt(10));
				bean.setContent(rs.getString(11));
				
				list.add(bean);
			}
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public BoardBean getOneBoard(int num) {
		BoardBean bean = new BoardBean();
		getCon();
		try {
			//조회수 증가 쿼리
			String readSql = "update board set readcount=readcount+1 where num=?";
			pstmt = con.prepareStatement(readSql);
			pstmt.setInt(1, num);
			pstmt.executeUpdate();
			String sql = "select * from board where num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				bean.setNum(rs.getInt(1));
				bean.setWriter(rs.getString(2));
				bean.setEmail(rs.getString(3));
				bean.setSubject(rs.getString(4));
				bean.setPassword(rs.getString(5));
				bean.setReg_date(rs.getDate(6).toString());
				bean.setRef(rs.getInt(7));
				bean.setRe_step(rs.getInt(8));
				bean.setRe_level(rs.getInt(9));
				bean.setReadcount(rs.getInt(10));
				bean.setContent(rs.getString(11));
			}
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return bean;
	}
	
	public void reWriteBoard(BoardBean bean) {
		int ref = bean.getRef();
		int re_step = bean.getRe_step();
		int re_level = bean.getRe_level();
		
		getCon();
		try {
			String levelSql = "update board set re_level=re_level+1 where ref=? and re_level > ?";
			pstmt = con.prepareStatement(levelSql);
			pstmt.setInt(1, ref);
			pstmt.setInt(2,  re_level);
			pstmt.executeUpdate();
			String sql = "insert into board (writer, email, subject, password, reg_date, ref, re_step, re_level, readcount, content) values(?, ?, ?, ?, now(), ?, ?, ?, 0, ?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, bean.getWriter());
			pstmt.setString(2, bean.getEmail());
			pstmt.setString(3, bean.getSubject());
			pstmt.setString(4, bean.getPassword());
			pstmt.setInt(5,  ref);
			pstmt.setInt(6, re_step+1);
			pstmt.setInt(7, re_level+1);
			pstmt.setString(8, bean.getContent());
			pstmt.executeUpdate();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public BoardBean getOneUpdateBoard(int num) {
		BoardBean bean = new BoardBean();
		getCon();
		try {
			String sql = "select * from board where num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				bean.setNum(rs.getInt(1));
				bean.setWriter(rs.getString(2));
				bean.setEmail(rs.getString(3));
				bean.setSubject(rs.getString(4));
				bean.setPassword(rs.getString(5));
				bean.setReg_date(rs.getDate(6).toString());
				bean.setRef(rs.getInt(7));
				bean.setRe_step(rs.getInt(8));
				bean.setRe_level(rs.getInt(9));
				bean.setReadcount(rs.getInt(10));
				bean.setContent(rs.getString(11));
			}
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return bean;
	}
	
	public String getPass(int num) {
		String pass = "";
		getCon();
		
		try {
			String sql = "select password from board where num = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				pass = rs.getString(1);
			}
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return pass;
	}
	
	
	public void updateBoard(BoardBean bean) {
	    getCon();
	    try {
	        String sql = "update board set subject=?, content=? where num=?";
	        pstmt = con.prepareStatement(sql);
	        pstmt.setString(1, bean.getSubject());
	        pstmt.setString(2, bean.getContent());
	        pstmt.setInt(3, bean.getNum());
	        pstmt.executeUpdate();
	        con.close();
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	}
	
	public void deleteBoard(int num) {
		getCon();
		try {
			String sql = "delete from board where num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.executeUpdate();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
