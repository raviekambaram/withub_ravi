package withub;

public class StringFormatting {
	
	public static void main(String args[]){
		String query=StringFormatting.stringFormat("update member set fname='{0}',lname='{1}',email='{2}',phone='{3}',address='{4}',project_description='{5}',industry='{6}',qualification='{7}',expertise_areas='{8}',experience='{9}',salary_expected='{10}',prefered_location='{11}',password='{12}',gender='{13}' where MID='{14}'", new Object[]{"abcd",0,"jkhdvssd"});
		System.out.println(query);
	}
	public static String stringFormat(String str,Object args[]){
		for(int i=0;i<args.length;i++){
			str=str.replace("{"+i+"}", args[i].toString());
		}
		return str;
	}
}
