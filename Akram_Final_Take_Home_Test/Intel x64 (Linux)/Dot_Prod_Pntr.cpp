float Dot_Prod_Pntr(float* arr_1, float* arr_2, int size) {
	float sum = 0.0;
	float* a, * b;

	for (a = &arr_1[0], b = &arr_2[0]; a < &arr_1[size]; a++, b++)
		sum += ((*a) * (*b));
	return sum;
}
