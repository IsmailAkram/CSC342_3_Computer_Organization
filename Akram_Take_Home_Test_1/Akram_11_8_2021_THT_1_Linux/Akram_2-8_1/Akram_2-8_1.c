int myadd(int a, int b) {
	int c = a + b;
	return c;
}
void main() {
	static int a = 4;
	static int b = 15;
	static int c = 0;
	c = myadd(a, b);
}