package a00_exp.a01_0122;

public class Book {
	private String bname;
	private int price;
	private String author;
	public Book(String bname, int price, String author) {
		super();
		this.bname = bname;
		this.price = price;
		this.author = author;
	}
	public String getBname() {
		return bname;
	}
	public void setBname(String bname) {
		this.bname = bname;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
}
