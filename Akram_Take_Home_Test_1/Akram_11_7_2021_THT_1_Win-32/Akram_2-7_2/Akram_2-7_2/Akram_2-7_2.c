void main() {
	static int i = 5;
	static int k = 10;
	static int save[100];
	save[5] = 10;
	while (save[i] == k) {
		i++;
	}
}