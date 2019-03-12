package test.jsp.study.test;
class Dog {
	String name;
}
class Cat {
	String name;
}
public class Exam02 {
	Dog d;
	public Dog getDog() {
		if(d==null) {
			d = new Dog();
		}
		return d;
	}
	public static void main(String[] args) {
		Exam02 e = new Exam02();
		Dog d = e.getDog();
		d.name = "퍼피";
		d = e.getDog();
		System.out.println(d.name);
	}
}
