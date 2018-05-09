package memo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import db.DBClose;
import db.DBOpen;

public class MemoDAO {

	public int total(Map map) {
		String col = (String)map.get("col");
		String word = (String)map.get("word");
		int total = 0;
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		StringBuffer sql = new StringBuffer();
		sql.append(" select count(*) from memo ");
		if(word.trim().length()>0)
			sql.append(" where "+col+" like '%'||?||'%' ");

		
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
	
	public void upAnsnum(Map map) {
		int ansnum = (Integer)map.get("ansnum");
		int grpno = (Integer)map.get("grpno");
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		StringBuffer sql = new StringBuffer();
		sql.append(" update MEMO ");
		sql.append(" set ansnum = ansnum+1 ");
		sql.append(" where grpno=? ");
		sql.append(" and ansnum > ? ");
		
		try {
			pstmt = con.prepareStatement(sql.toString());
			
			pstmt.setInt(1, grpno);
			pstmt.setInt(2, ansnum);
			
			pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			
			DBClose.close(con, pstmt);
			
		}
		
	}
	public boolean createReply(MemoDTO dto) {
		boolean flag = false;
		Connection con = DBOpen.open();
		PreparedStatement pstmt= null;
		StringBuffer sql = new StringBuffer();
		sql.append(" insert into memo(memono, title, content, wdate, grpno,indent,ansnum,refnum) ");
		sql.append(" values(memo_seq.nextval,?,?,sysdate,?,?,?,?) ");

		
		
		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, dto.getTitle());
			pstmt.setString(2, dto.getContent());
			pstmt.setInt(3, dto.getGrpno());
			pstmt.setInt(4, dto.getIndent()+1);
			pstmt.setInt(5, dto.getAnsnum()+1);
			pstmt.setInt(6, dto.getMemono());
			
			int cnt = pstmt.executeUpdate();
			if (cnt>0) {
				flag= true;
			}
			
		} catch (SQLException e) {

			e.printStackTrace();
		}finally {
			
		DBClose.close(con, pstmt);
		}
		return flag;
	}
	
	public boolean create(MemoDTO dto) {
		boolean flag = false;
		Connection con = DBOpen.open();
		StringBuffer sql = new StringBuffer();
		PreparedStatement pstmt = null;
		
		sql.append(" insert into memo(memono, title, content, wdate, grpno) ");
		sql.append(" values(memo_seq.nextval, ? , ? ,sysdate,  ");
		sql.append(" (select nvl(max(grpno), 0)+1 from memo))  ");
		
		
		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, dto.getTitle());
			pstmt.setString(2, dto.getContent());

			int cnt = pstmt.executeUpdate();
			
			if(cnt>0) { flag = true;}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			
			DBClose.close(con,pstmt);
		}
		
		return flag;
	}

	public MemoDTO read(int memono) {
		MemoDTO dto = null;
		Connection con = DBOpen.open();
		StringBuffer sql = new StringBuffer();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		sql.append(" select memono, title, content, ");
		sql.append(" to_char(wdate, 'yyyy-mm-dd') wdate, viewcnt  ");
		sql.append(" from memo ");
		sql.append(" where memono =? ");
		
		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1, memono);
			rs = pstmt.executeQuery();
			if(rs.next()){
				dto = new MemoDTO();
				dto.setContent(rs.getString("content"));
				dto.setTitle(rs.getString("title"));
				dto.setWdate(rs.getString("wdate"));
				dto.setViewcnt(rs.getInt("viewcnt"));
				dto.setMemono(rs.getInt("memono"));
		}
			}catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBClose.close(con, pstmt, rs);
		}
			
		return dto;
	}

	public boolean update(MemoDTO dto) {
		boolean flag = false;
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		
		StringBuffer sql = new StringBuffer();
		sql.append(" update memo ");
		sql.append(" set title = ? ,  ");	
		sql.append(" content = ? ");
		sql.append(" where memono=? ");
		
		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1,dto.getTitle());
			pstmt.setString(2, dto.getContent());
			pstmt.setInt(3, dto.getMemono());
			int cnt = pstmt.executeUpdate();
			if(cnt>0)flag=true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBClose.close(con, pstmt);
		}
		return flag;
	}

	public boolean delete(int memono) {
		boolean flag = false;
		
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		StringBuffer sql = new StringBuffer();
		sql.append(" delete from memo  ");
		sql.append("  where memono=? ");
		
		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1, memono);
			
			int cnt = pstmt.executeUpdate();
			if(cnt>0)flag=true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBClose.close(con, pstmt);
		}
		return flag;
	}
	
	public List<MemoDTO> list(Map map){
		int sno = (Integer)map.get("sno");
		int eno = (Integer)map.get("eno");
		String col = (String)map.get("col");
		String word = (String)map.get("word");
		List<MemoDTO> list = new ArrayList<MemoDTO>();
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		StringBuffer sql = new StringBuffer();
		
		
		sql.append("  select memono, title, wdate, viewcnt, grpno,indent,ansnum,r  ");
		sql.append("  	from( ");
		sql.append("  		select memono, title, wdate, viewcnt, grpno,indent,ansnum,rownum r ");
		sql.append("  			from( ");
		sql.append(" 				select memono,title,  ");
		sql.append(" 				to_char(wdate,'yyyy-mm-dd') wdate, viewcnt, grpno, indent, ansnum ");
		sql.append(" 				from memo  ");
		if(word.trim().length()>0) {
			sql.append(" where "+col+"  like '%'||?||'%' ");
		}
		
		sql.append(" 				order by grpno DESC, ansnum ");
		sql.append(" 				) ");
		sql.append(" 		)where r>=? and r<=? ");
		
		
		try {
			pstmt = con.prepareStatement(sql.toString());
			int i = 0;
			
			if(word.trim().length()>0) {
				pstmt.setString(++i, word);
				
			}
			pstmt.setInt(++i, sno);
			pstmt.setInt(++i, eno);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				MemoDTO dto = new MemoDTO();
				dto.setMemono(rs.getInt("memono"));
				dto.setTitle(rs.getString("title"));
				dto.setViewcnt(rs.getInt("viewcnt"));
				dto.setWdate(rs.getString("wdate"));
				dto.setGrpno(rs.getInt("grpno"));
				dto.setAnsnum(rs.getInt("ansnum"));
				dto.setIndent(rs.getInt("indent"));
				
				list.add(dto);
				
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBClose.close(con, pstmt, rs);
			
		}
		
		return list;
	}
	
	public void upViewcnt(int memono) {
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		
		StringBuffer sql = new StringBuffer();
		sql.append(" update memo ");
		sql.append(" set viewcnt = viewcnt+1 ");
		sql.append(" where memono = ? ");
		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1, memono);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBClose.close(con,pstmt);
		}
	}

	public MemoDTO readReply(int memono) {
		MemoDTO dto = null;
		Connection con = DBOpen.open();
		PreparedStatement pstmt =null;
		ResultSet rs = null;
		StringBuffer sql = new StringBuffer();
		sql.append(" select memono, title, wdate, viewcnt,grpno,content,ansnum,indent  ");
		sql.append(" from memo where memono = ?  ");
		
		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1, memono);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				dto = new MemoDTO();
				dto.setMemono(rs.getInt("memono"));
				dto.setAnsnum(rs.getInt("ansnum"));
				dto.setContent(rs.getString("content"));
				dto.setGrpno(rs.getInt("grpno"));
				dto.setIndent(rs.getInt("indent"));
				dto.setTitle(rs.getString("title"));
				dto.setViewcnt(rs.getInt("viewcnt"));
				dto.setWdate(rs.getString("wdate"));
				
				
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			DBClose.close(con, pstmt, rs);
		}
		
		
		
		
		return dto;
	}

	public boolean checkRef(int memono) {
		boolean flag = false;
		Connection con =DBOpen.open();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		StringBuffer sql = new StringBuffer();
		sql.append(" select count(refnum) from memo  ");
		sql.append("  where refnum=? ");

		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1, memono);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				int cnt = rs.getInt(1);
				if(cnt>0) {
					flag = true;
				}
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			
			DBClose.close(con, pstmt, rs);
		}
		
		
		
		return flag;
	}

}
