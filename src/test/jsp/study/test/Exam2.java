package test.jsp.study.test;

public class Exam2 {

	public static void main(String[] args) {
		String a="";
		char b=' ';
		
		for(int i=1;i<=100;i++) {
			boolean c=false;
			a=String.valueOf(i);
			for(int j=0;j<a.length();j++) {
				b = a.charAt(j);
				if(b =='3' || b=='6' || b=='9') {
					System.out.print("짝");
					c=true;
				}
			}
			if(!c) {
				System.out.print(a);
			}
			System.out.print(",");
			if(i%10==0) {
				System.out.println();
			}
		}
	}
}
