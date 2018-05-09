package member;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class Test {

	public static void main(String[] args) {
		MemberDAO dao = new MemberDAO();
		//duplicateID(dao);
		//duplicateEmail(dao);
		
		//create(dao);
		//list(dao);
		//total(dao);
		//read(dao);
		//update(dao);
		//getFname(dao);
		//delete(dao);
		loginCheck(dao);
	}
	

	private static void loginCheck(MemberDAO dao) {
		Map map = new HashMap();
		map.put("id", "user1");
		map.put("passwd", "12234");
		if(dao.loginCheck(map)) {
			p("성공");
		}else {
			p("실패");
		}
		
	}


	private static void delete(MemberDAO dao) {
		String id = "user3";
		if(dao.delete(id)) {
			p("성공");
		}else {
			p("실패");
		}
	}


	private static void getFname(MemberDAO dao) {
		String id = "user3";
		p(dao.getFname(id));
		
	}


	private static void update(MemberDAO dao) {
		MemberDTO dto = dao.read("ldllll");
		dto.setAddress1("종로종로종각각");
		dto.setAddress2("종로종로로로로");
		dto.setEmail("djkfjk@naver.com");
		dto.setTel("0100000000");
		dto.setZipcode("343222");
		dto.setJob("A02");
		if(dao.update(dto)) {
		p("성공");
		}else {
			p("실패");
		}
		
	}


	private static void read(MemberDAO dao) {
		MemberDTO dto = dao.read("user5");
		p(dto);
		
	}


	private static void total(MemberDAO dao) {
		Map map = new HashMap();
		
		map.put("col", "mname");
		map.put("word", "");
		p("개수"+dao.total(map));
		
	}


	private static void list(MemberDAO dao) {
		Map map = new HashMap();
		map.put("col", "");
		map.put("word","");
		map.put("sno",	1);
		map.put("eno",	5);
		List<MemberDTO> list = dao.list(map);
		for(int i=0; i<list.size();i++) {
			MemberDTO dto = list.get(i);
			p(dto);
		}
		
	}

	private static void p(MemberDTO dto) {
		p("mname - "+dto.getMname());
		p("id - "+dto.getId());
		p("email - "+dto.getEmail());
		p("tel - "+dto.getTel());
		p("--------------------");
		
	}

	private static void create(MemberDAO dao) {
		MemberDTO dto = new MemberDTO();
		dto.setId("sd");
		dto.setId("sd");
		dto.setId("sd");
		dto.setId("sd");
		dto.setId("sd");
		dto.setId("sd");
		dto.setId("sd");
		dto.setId("sd");
		
	}

	private static void duplicateID(MemberDAO dao) {
		String id = "user111";
		
		if(dao.duplicateID(id)) {
			p("중복");
		}else
			p("안중복");
		
	}
	private static void duplicateEmail(MemberDAO dao) {
		String id = "user111";
		
		if(dao.duplicateID(id)) {
			p("중복");
		}else
			p("안중복");
		
	}

	private static void p(String string) {
		System.out.println(string);
		
	}

}
