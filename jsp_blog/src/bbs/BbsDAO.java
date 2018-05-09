package bbs;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.el.MapELResolver;

import db.DBClose;
import db.DBOpen;
import jdk.nashorn.internal.ir.RuntimeNode.Request;

public class BbsDAO {

	public int total(Map map) {
		String col = (String)map.get("col");
		String word = (String)map.get("word");
		int total=0;
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		StringBuffer sql = new StringBuffer();
		sql.append(" select count(*) from bbs ");
		if(word.trim().length()>0)
			sql.append(" where "+col+" like '%'||?||'%'  ");


		try {
			pstmt = con.prepareStatement(sql.toString());
			
			if(word.trim().length()>0)
				pstmt.setString(1, word);
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				total = rs.getInt(1);

			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBClose.close(con, pstmt, rs);
			
		}
		
		
		
		return total;
	}
	
	public BbsDTO readReply(int bbsno) {
		BbsDTO dto = null;
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		StringBuffer sql = new StringBuffer();
		sql.append("  select bbsno, grpno , indent, ansnum,title  ");
		sql.append("  from bbs  ");
		sql.append("  where bbsno = ? ");

		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1, bbsno);
			dto = new BbsDTO();
			rs = pstmt.executeQuery();
			if (rs.next()) {
				dto.setBbsno(rs.getInt("bbsno"));
				dto.setGrpno(rs.getInt("grpno"));
				dto.setIndent(rs.getInt("indent"));
				dto.setTitle(rs.getString("title"));
				dto.setAnsnum(rs.getInt("ansnum"));

			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBClose.close(con, pstmt, rs);
		}

		return dto;
	}

	public List<BbsDTO> list(Map map) {
		String col = (String)map.get("col");
		String word = (String)map.get("word");
		int sno = (Integer)map.get("sno");
		int eno = (Integer)map.get("eno");
		
		List<BbsDTO> list = new ArrayList<BbsDTO>();
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		StringBuffer sql = new StringBuffer();
		sql.append(" select	bbsno, wname, title, content, passwd, viewcnt, wdate, grpno, ");
		sql.append(" 		indent, ansnum,filename,filesize , r ");
		sql.append(" 		from( ");
		sql.append(" 			select	bbsno, wname, title, content, passwd, viewcnt,  ");
		sql.append(" 				wdate, grpno, indent, ansnum,filename,filesize , rownum r ");
		sql.append(" 				from( ");
		sql.append(" 					select	bbsno, wname, title, content,  ");
		sql.append(" 							passwd, viewcnt, grpno, ");
		sql.append(" 							to_char(wdate, 'yyyy-mm-dd') wdate,  ");
		sql.append(" 							indent,filename,filesize, ansnum from bbs ");
		if(word.trim().length()>0) {
		sql.append(" 							where "+col+" like '%'||?||'%' ");
		}
		sql.append(" 							order by grpno desc, ansnum  ");
		sql.append(" 					) ");
		sql.append(" 			) ");
		sql.append(" 		where r>= ? and r<=? ");

		try {
			pstmt = con.prepareStatement(sql.toString());
			int i = 0;
			if(word.trim().length()>0) {
				pstmt.setString(++i, word);
				
			}
			pstmt.setInt(++i, sno);
			pstmt.setInt(++i, eno);
			
			rs = pstmt.executeQuery();
			while (rs.next()) {
				BbsDTO dto = new BbsDTO();
				dto.setBbsno(rs.getInt("bbsno"));
				dto.setWname(rs.getString("wname"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setPasswd(rs.getString("passwd"));
				dto.setViewcnt(rs.getInt("viewcnt"));
				dto.setWdate(rs.getString("wdate"));
				dto.setGrpno(rs.getInt("grpno"));
				dto.setIndent(rs.getInt("indent"));
				dto.setAnsnum(rs.getInt("ansnum"));
				dto.setFilename(rs.getString("filename"));
				dto.setFilesize(rs.getInt("filesize"));

				list.add(dto);

			}

		} catch (SQLException e) {

			e.printStackTrace();
		} finally {
			DBClose.close(con, pstmt, rs);
		}

		return list;
	}

	public boolean create(BbsDTO dto) {
		boolean flag = false;
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		StringBuffer sql = new StringBuffer();
		sql.append(" insert into bbs(bbsno, wname, title, ");
		sql.append(" content,passwd, ");
		sql.append(" wdate,grpno,filename,filesize) ");
		sql.append(" values((select nvl(max(bbsno), 0) +1  ");
		sql.append(" as bbsno from bbs), ");
		sql.append(" ?,?,?,?,sysdate, ");
		sql.append(" (select nvl(max(grpno),0)+1 from bbs),?,?) ");

		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, dto.getWname());
			pstmt.setString(2, dto.getTitle());
			pstmt.setString(3, dto.getContent());
			pstmt.setString(4, dto.getPasswd());
			pstmt.setString(5, dto.getFilename());
			pstmt.setInt(6, dto.getFilesize());

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

	public BbsDTO read(int bbsno) {
		BbsDTO dto = null;
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		StringBuffer sql = new StringBuffer();
		sql.append(" select	bbsno, wname, title, content,  ");
		sql.append(" passwd, viewcnt, wdate, grpno,  ");
		sql.append(" indent, ansnum, filename, filesize from bbs where bbsno=? ");

		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1, bbsno);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				dto = new BbsDTO();
				dto.setBbsno(rs.getInt("bbsno"));
				dto.setWname(rs.getString("wname"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setGrpno(rs.getInt("grpno"));
				dto.setViewcnt(rs.getInt("viewcnt"));
				dto.setPasswd(rs.getString("passwd"));
				dto.setIndent(rs.getInt("indent"));
				dto.setWdate(rs.getString("wdate"));
				dto.setAnsnum(rs.getInt("ansnum"));
				dto.setFilename(rs.getString("filename"));
				dto.setFilesize(rs.getInt("filesize"));
			}

		} catch (SQLException e) {

			e.printStackTrace();
		} finally {
			DBClose.close(con, pstmt, rs);
		}

		return dto;
	}

	public boolean delete(int bbsno) {
		boolean flag = false;
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		StringBuffer sql = new StringBuffer();
		sql.append(" delete from bbs where bbsno=? ");

		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1, bbsno);
			int cnt = pstmt.executeUpdate();

			if (cnt > 0) {
				flag = true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBClose.close(con, pstmt);
		}

		return flag;
	}

	public boolean update(BbsDTO dto) {
		boolean flag = false;
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		StringBuffer sql = new StringBuffer();
		sql.append(" update	bbs	set	wname=?, ");
		sql.append(" title=?, ");
		sql.append(" content=? ");
		if(dto.getFilesize()>0) {
		sql.append(" ,filename=?, ");
		sql.append(" filesize=? ");
		}
		sql.append(" where bbsno=? ");

		try {
			pstmt = con.prepareStatement(sql.toString());
			int i = 0;
			pstmt.setString(++i, dto.getWname());
			pstmt.setString(++i, dto.getTitle());
			pstmt.setString(++i, dto.getContent());
			if(dto.getFilesize()>0) {
			pstmt.setString(++i, dto.getFilename());
			pstmt.setInt(++i, dto.getFilesize());
			}
			pstmt.setInt(++i, dto.getBbsno());

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

	public void upViewcnt(int bbsno) {
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		StringBuffer sql = new StringBuffer();
		sql.append(" UPDATE bbs  ");
		sql.append(" SET viewcnt = viewcnt + 1  ");
		sql.append(" WHERE bbsno=? ");

		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1, bbsno);

			pstmt.executeQuery();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.close(con, pstmt);
		}

	}

	public boolean passCheck(Map map) {
		boolean flag = false;
		int bbsno = (Integer) map.get("bbsno");
		String passwd = (String) map.get("passwd");

		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		StringBuffer sql = new StringBuffer();
		sql.append(" SELECT COUNT(bbsno) as cnt  ");
		sql.append(" FROM bbs  ");
		sql.append(" WHERE bbsno= ? AND passwd= ? ");

		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1, bbsno);
			pstmt.setString(2, passwd);

			rs = pstmt.executeQuery();
			if (rs.next()) {
				int cnt = rs.getInt("cnt");
				if (cnt > 0)
					flag = true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBClose.close(con, pstmt, rs);
		}
		return flag;
	}

	public boolean createReply(BbsDTO dto) {
		boolean flag = false;
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		StringBuffer sql = new StringBuffer();
		sql.append(" insert into bbs   ");
		sql.append(" (bbsno, wname, title, content, passwd  ");
		sql.append("  ,wdate,grpno,indent,ansnum,refnum,filename,filesize) ");
		sql.append("  values((select nvl(max(bbsno), 0) +1 as bbsno from bbs), ");
		sql.append("  ?,?,?,?,sysdate,?,?,?,?,?,? ) ");

		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, dto.getWname());
			pstmt.setString(2, dto.getTitle());
			pstmt.setString(3, dto.getContent());
			pstmt.setString(4, dto.getPasswd());
			pstmt.setInt(5, dto.getGrpno());
			pstmt.setInt(6, dto.getIndent()+1);
			pstmt.setInt(7, dto.getAnsnum()+1);
			pstmt.setInt(8, dto.getBbsno());
			pstmt.setString(9, dto.getFilename());
			pstmt.setInt(10, dto.getFilesize());

			int cnt = pstmt.executeUpdate();
			if (cnt > 0)
				flag = true;

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {

			DBClose.close(con, pstmt, rs);
		}

		return flag;
	}

	public void upAnsnum(Map map) {
		int grpno = (Integer) map.get("grpno");
		int ansnum = (Integer) map.get("ansnum");
		
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		
		StringBuffer sql = new StringBuffer();
		sql.append(" update bbs set ansnum = ansnum + 1 ");
		sql.append(" where grpno = ? ");
		sql.append(" and ansnum > ?  ");
		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1, grpno);
			pstmt.setInt(2, ansnum);

			pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBClose.close(con, pstmt);
		}

	}

	public boolean checkRefnum(int bbsno) {
		boolean flag = false;
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		StringBuffer sql = new StringBuffer();
		sql.append(" select count(refnum) from bbs ");
		sql.append(" where refnum=? ");

		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1, bbsno);
			
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				int cnt = rs.getInt(1);
				if(cnt>0)flag = true;
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBClose.close(con, pstmt, rs);
		}
		
		return flag;
	}
}
