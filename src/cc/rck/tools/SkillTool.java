package cc.rck.tools;

public class SkillTool {
	public int id;
	public String name;
	public int type;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}
	public SkillTool(int id, String name, int type) {
		super();
		this.id = id;
		this.name = name;
		this.type = type;
	}
	
	public SkillTool() {
		super();
		// TODO Auto-generated constructor stub
	}
	public void set(int id, String name) {
		this.id = id;
		this.name = name;
	}
//	public List<SkillTool> getList(String number){
//		List<SkillTool> list = 
//		return 
//	}
}
