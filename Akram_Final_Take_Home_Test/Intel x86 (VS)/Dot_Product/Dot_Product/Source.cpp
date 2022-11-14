#include <iostream>
#include <vector>
#include <windows.h>
#include <algorithm>

using namespace std;

const int arr_size = 32768; // array size is constant; we'll be performing for N = 16, 32, 64, 128, 256, 512, & 1024 ... 2^16 = 65536

static float A[arr_size]; // two arrays
static float B[arr_size];
float Dot_Prod_Pntr(float* arr_1, float* arr_2, const int size);

int main() {
	_int64 ctr_1 = 0, ctr_2 = 0, freq = 0;
	int acc = 0, n = 0, d_prod = 0;
	double total_time = 0;

	for (int n = 0; n < arr_size; n++) {
		A[n] = n / 2.0;
		B[n] = n / 3.0;
	}

	cout << "Array size: " << arr_size << endl;
	
	// to account for deviation in error (this is normal), we are running this program 10 times, and then taking the average result. That way we net the accurate representative running time.
	for (int i = 0; i < 10; i++) {
		if (QueryPerformanceCounter((LARGE_INTEGER*)&ctr_1) != 0) {
			d_prod = Dot_Prod_Pntr(&A[0], &B[0], arr_size); // using Pointer
			QueryPerformanceCounter((LARGE_INTEGER*)&ctr_2);

			// cout << "Beginning value: " << ctr_1 << endl; // remove comment if you would like to know arbitrary beginning and ending values
			// cout << "Ending value: " << ctr_2 << endl;

			QueryPerformanceFrequency((LARGE_INTEGER*)&freq);

			// cout << "QueryPerformance min resolution: 1/" << freq << " secs" << endl; // remove comment to see min resolution ... i.e. the frequency
			cout << "Run number: " << i+1 << endl << "Running time: " << (ctr_2 - ctr_1) * 1.0 / freq << " secs" << endl;
			total_time += (ctr_2 - ctr_1) * 1.0 / freq;
			// cout << "TotalTime: " << total_time << endl << endl; // remove comment to see total time
		}

		else {
			DWORD dwError = GetLastError();
			cout << "Error value: " << dwError << endl;
		}
	}
	cout << "Average time: " << (total_time / 10) << endl; // Note this time and graph it into the excel doc

	system("pause");
	return 0;
}