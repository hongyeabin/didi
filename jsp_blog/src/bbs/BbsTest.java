package bbs;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class BbsTest {

	public static void main(String[] args) {
		BbsDAO dao = new BbsDAO();
		
		total(dao);
		//list(dao);
		//create(dao);
		//update(dao);
		//delete(3);
		//passCheck(dao);
	}

	private static void total(BbsDAO dao) {
		Map map = new HashMap();
		map.put("col","wname");
		map.put("word", "오곡");
		int total = dao.total(map);
		p("dk : "+total);
	}

	private static void passCheck(BbsDAO dao) {
		Map map = new HashMap();
		map.put("bbsno", 2);
		map.put("passwd", "1233");
		if(dao.passCheck(map)) {
			p("같음");
		}else {
			p("다름");
		}
		
		
	}

	private static void delete(int i) {
		BbsDAO dao = new BbsDAO();
		dao.delete(i);
		
	}

	private static void update(BbsDAO dao) {
		BbsDTO dto = new BbsDTO();
		dto.setWname("오로모");
		dto.setTitle("싱싱싱싱");
		dto.setContent("안니옹이요");
		dto.setPasswd("123");
		dto.setBbsno(3);
		
		if(dao.update(dto)) {
			p("성공");
		}else {
			p("실패");
		}
		
	}

	private static void create(BbsDAO dao) {
		BbsDTO dto = new BbsDTO();
		dto.setWname("오로모");
		dto.setTitle("싱싱싱싱");
		dto.setContent("안니옹이요");
		dto.setPasswd("123");
		if(dao.create(dto)) {
			p("성공");
		}else {
			p("실패");
		}
		
	}

	private static void list(BbsDAO dao) {
		
		Map map = new HashMap();
		map.put("col", "wname");
		map.put("word", "");
		map.put("sno", 1);
		map.put("eno", 5);
		
		
		List<BbsDTO> list = dao.list(map);
		
		for(int i=0;i<list.size();i++) {
			BbsDTO dto = list.get(i);
			p(dto);
			p("--------------------");
		}
	}

	private static void p(String string) {
		System.out.println(string);

	}

	private static void p(BbsDTO dto) {
		
		p("con : "+dto.getContent());
		p("pw : "+dto.getPasswd());
		p("ti : "+dto.getTitle());
		p("wd : "+dto.getWdate());
		p("wn : "+dto.getWname());
		p("an : "+dto.getAnsnum());
		p("bb : "+dto.getBbsno());
		p("gr : "+dto.getGrpno());
		p("id : "+dto.getIndent());
		p("vc : "+dto.getViewcnt());

		
		
	}
	

}
