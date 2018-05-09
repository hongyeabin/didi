package bang;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import db.DBClose;
import db.DBOpen;

public class BangDAO {

	public int total(Map map) {
		int total = 0;
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		StringBuffer sql = new StringBuffer();
		sql.append(" select count(*) from bang  ");
		try {
			pstmt = con.prepareStatement(sql.toString());

			rs = pstmt.executeQuery();
			if (rs.next()) {
				total = rs.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.close(con, pstmt, rs);
		}

		return total;
	}

	public List<BangDTO> list(Map map) {
		int sno = (int) map.get("sno");
		int eno = (int) map.get("eno");
		List<BangDTO> list = new ArrayList();
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		StringBuffer sql = new StringBuffer();
		sql.append(" select gbno , mname , bdate , content , fname ");
		sql.append(" 		,r  ");
		sql.append(" 	from( ");
		sql.append(" 		select gbno , mname , bdate , content , fname ");
		sql.append(" 		,rownum r ");
		sql.append(" 		from( ");
		sql.append(" 			select gbno , mname , bdate , content , fname ");
		sql.append(" 			from bang ");
		sql.append(" 			order by gbno desc ");
		sql.append(" 			) ");
		sql.append(" 	)where r>=? and r<=? ");

		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1, sno);
			pstmt.setInt(2, eno);

			rs = pstmt.executeQuery();
			while (rs.next()) {

				BangDTO dto = new BangDTO();
				dto.setBdate(rs.getString("bdate"));
				dto.setContent(rs.getString("content"));
				dto.setFname(rs.getString("fname"));
				dto.setMname(rs.getString("mname"));
				dto.setGbno(rs.getInt("gbno"));

				list.add(dto);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBClose.close(con, pstmt, rs);
		}

		return list;
	}

	public boolean delete(String gbno) {
		boolean flag = false;
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		StringBuffer sql = new StringBuffer();
		sql.append("  delete from bang ");
		sql.append("  where gbno=? ");

		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, gbno);

			int cnt = pstmt.executeUpdate();

			if (cnt > 0)
				flag = true;

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBClose.close(con, pstmt);
		}

		return flag;
	}

	public boolean create(Map map) {
		boolean flag = false;
		String content = (String) map.get("content");
		String mname = (String) map.get("mname");
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		StringBuffer sql = new StringBuffer();
		sql.append("  insert into bang(gbno , mname , bdate , content , fname) ");
		sql.append("  		values((select nvl(max(gbno), 0) +1 as gbno from bang), ");
		sql.append("  			? , sysdate , ? , 'member.jpg') ");

		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, mname);
			pstmt.setString(2, content);

			int cnt = pstmt.executeUpdate();

			if (cnt > 0)
				flag = true;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBClose.close(con, pstmt, rs);
		}

		return flag;
	}

	public String getName(String str) {
		String name = "";
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		StringBuffer sql = new StringBuffer();
		ResultSet rs = null;
		sql.append(" select mname from member  ");
		sql.append("  where id=? ");

		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, str);

			rs = pstmt.executeQuery();
			if (rs.next()) {
				name = rs.getString(1);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.close(con, pstmt);
		}
		return name;
	}

	public String getOldcon(String gbno) {
		String oldcon = "";
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		StringBuffer sql = new StringBuffer();
		sql.append(" select content,mname from bang ");
		sql.append(" where gbno=? ");

		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, gbno);

			rs = pstmt.executeQuery();
			if (rs.next()) {
				oldcon = rs.getString("gbno");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.close(con, pstmt, rs);
		}

		return oldcon;
	}

	public boolean update(Map map) {
		boolean flag = false;
		String content = (String) map.get("content");
		String gbno = (String) map.get("gbno");
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		StringBuffer sql = new StringBuffer();
		sql.append(" update bang ");
		sql.append(" 	set content = ?  ");
		sql.append(" 	where gbno=? ");

		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, content);
			pstmt.setString(2, gbno);

			int cnt = pstmt.executeUpdate();
			if (cnt > 0)
				flag = true;

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.close(con, pstmt);
		}

		return flag;
	}
}
