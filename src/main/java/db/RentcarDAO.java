package db;

import java.beans.beancontext.BeanContext;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.print.attribute.PrintJobAttribute;
import javax.sql.DataSource;

public class RentcarDAO {
	Connection con;
	PreparedStatement pstmt;
	ResultSet rs;
	
	//커넥션 풀을 이용한 데이터베이스 연결
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
	
	public ArrayList<CarListBean> getSelectCar() {
		ArrayList<CarListBean> list = new ArrayList<>();
		getCon();
		try {
		
			String sql = "select * from rentcar order by no desc";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			int count = 0;
			while(rs.next()) {
				
				CarListBean bean = new CarListBean();
				bean.setNo(rs.getInt(1));
				bean.setName(rs.getString(2));
				bean.setCategory(rs.getInt(3));
				bean.setPrice(rs.getInt(4));
				bean.setUsepeople(rs.getInt(5));
				bean.setCompany(rs.getString(6));
				bean.setImg(rs.getString(7));
				bean.setInfo(rs.getString(8));
				
				list.add(bean);
				count++;
				if (count > 2) {
					break;
				}
			}
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		
		
		return list;
	}
	
	public ArrayList<CarListBean> getCategoryCar(int category) {
		ArrayList<CarListBean> list = new ArrayList<CarListBean>();
		
		CarListBean bean = null;
		
		getCon();
		
		try {
			String sql = "select * from rentcar where category=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, category);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				
				bean = new CarListBean();
				bean.setNo(rs.getInt(1));
				bean.setName(rs.getString(2));
				bean.setCategory(rs.getInt(3));
				bean.setPrice(rs.getInt(4));
				bean.setUsepeople(rs.getInt(5));
				bean.setCompany(rs.getString(6));
				bean.setImg(rs.getString(7));
				bean.setInfo(rs.getString(8));
				
				list.add(bean);
			}
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	public ArrayList<CarListBean> getAllCar() {
		ArrayList<CarListBean> list = new ArrayList<CarListBean>();
		
		CarListBean bean = null;
		
		getCon();
		
		try {
			String sql = "select * from rentcar";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				
				bean = new CarListBean();
				bean.setNo(rs.getInt(1));
				bean.setName(rs.getString(2));
				bean.setCategory(rs.getInt(3));
				bean.setPrice(rs.getInt(4));
				bean.setUsepeople(rs.getInt(5));
				bean.setCompany(rs.getString(6));
				bean.setImg(rs.getString(7));
				bean.setInfo(rs.getString(8));
				
				list.add(bean);
			}
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	public CarListBean getOneCar(int no) {
		CarListBean bean = new CarListBean();
		getCon();
		try {
			String sql = "select * from rentcar where no=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, no);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				
				bean = new CarListBean();
				bean.setNo(rs.getInt(1));
				bean.setName(rs.getString(2));
				bean.setCategory(rs.getInt(3));
				bean.setPrice(rs.getInt(4));
				bean.setUsepeople(rs.getInt(5));
				bean.setCompany(rs.getString(6));
				bean.setImg(rs.getString(7));
				bean.setInfo(rs.getString(8));
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return bean;
	}
	
	public int getMember(String id, String pass) {
		int result = 0;
		getCon();
		try {
			String sql = "select count(*) from member where id=? and pass=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pass);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				result = rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public void insertMember(MemberBean bean) {
		getCon();
		try {
			String sql = "insert into member (id, pass, tel) values (?, ?, ?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, bean.getId());
			pstmt.setString(2, bean.getPass());
			pstmt.setString(3, bean.getTel());
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void setReserveCar(CarReserveBean bean) {
		getCon();
		try {
			String sqlString = "insert into carreserve (no, id, qty, dday, rday, usein, usewifi, useseat, usenavi) values (?,?,?,?,?,?,?,?,?)";
			pstmt = con.prepareStatement(sqlString);
			pstmt.setInt(1, bean.getNo());
			pstmt.setString(2, bean.getId());
			pstmt.setInt(3, bean.getQty());
			pstmt.setInt(4, bean.getDday());
			pstmt.setString(5, bean.getRday());
			pstmt.setInt(6, bean.getUsein());
			pstmt.setInt(7, bean.getUsewifi());
			pstmt.setInt(8, bean.getUseseat());
			pstmt.setInt(9, bean.getUsenavi());
			pstmt.executeUpdate();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public ArrayList<CarViewBean> getAllReserve(String id) {
		ArrayList<CarViewBean> beans = new ArrayList<CarViewBean>();
		CarViewBean bean = null;
		getCon();
		try {
			String sql = "SELECT * \n"
					+ "FROM rentcar \n"
					+ "NATURAL JOIN carreserve\n"
					+ "WHERE SYSDATE() < STR_TO_DATE(rday, '%Y-%m-%d') \n"
					+ "AND id = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				bean = new CarViewBean();
				bean.setName(rs.getString(2));
				bean.setPrice(rs.getInt(4));
				bean.setImg(rs.getString(7));
				bean.setQty(rs.getInt(11));
				bean.setDday(rs.getInt(12));
				bean.setRday(rs.getString(13));
				bean.setUsein(rs.getInt(14));
				bean.setUsewifi(rs.getInt(15));
				bean.setUseseat(rs.getInt(16));
				bean.setUsenavi(rs.getInt(17));
				beans.add(bean);
			}
			con.close();
					
		} catch (Exception e) {
			e.printStackTrace();
		}
		return beans;
	}
	
	public void carRemoveReserve(String id, String rday) {
		getCon();
		try {
			String sql = "delete from carreserve where id = ? and rday = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, rday);
			pstmt.executeUpdate();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
