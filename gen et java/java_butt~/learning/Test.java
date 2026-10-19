import com.cycling74.max.*;

public class Test extends MaxObject {

	public void bang() {
		post("hello bang!");
		outletBang(0);
	}

	public void loadbang() {
		post("welcome to the patch!");
	}
	
	public void inlet(int i) {
		post("hello integer " + i + "!");
		outlet(0, i);
	}
	
	public void inlet(float f) {
		post("hello float " + f + "!");
		outlet(0, f);
	}
	
	public void list(Atom[] a) {
		post("hello list " + Atom.toOneString(a) + "!");
		outlet(0, a);
	}
	
	public void anything(String s, Atom[] args) {
		post("hello anything " + s + " " + Atom.toOneString(args) + "!");
		outlet(0, s, args);
	}
}
