package memo;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

public class Meeeee {

	public static void main(String[] args) {
		MemoDAO dao = new MemoDAO();
		
		//list(dao);
		total(dao);
	}

	private static void total(MemoDAO dao) {
		Map map = new HashMap();
		map.put("col", "title");
		map.put("word", "약속");
		map.put("sno", 1);
		map.put("eno", 5);		
		
		int total = dao.total(map);
		p("su - "+total);
	}

	private static void list(MemoDAO dao) {
		Map map = new HashMap();
		map.put("col", "title");
		map.put("word", "");
		map.put("sno", 1);
		map.put("eno", 5);

		List<MemoDTO> list = dao.list(map);
		Iterator<MemoDTO> iter = list.iterator();
		while(iter.hasNext()) {
			MemoDTO dto = iter.next();
			p(dto);
		}
	}

	private static void p(MemoDTO dto) {
		p("번호 "+ dto.getTitle());
		p("dd"+dto.getWdate());
		p("------------------");
	}

	private static void p(String string) {
		// TODO Auto-generated method stub
		System.out.println(string);
	}

}
