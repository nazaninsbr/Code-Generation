class A{  
	void m(){
		System.out.println("hello m");
	}  
	void n(){ 
		this.m();  
	}  
}  
public class z10{  
	public static void main(String args[]){  
		A a=new A();  
		a.n();  
	}
} 