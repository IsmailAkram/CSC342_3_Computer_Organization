#include <iostream>
#include <time.h>
#include <stdint.h>
#include <stdlib.h>

#define NANO 1000000000L 
using namespace std;

const int arr_size = 65536; // array size is constant; we'll be performing for N = 16, 32, 64, 128, 256, 512, & 1024 ... 2^16 = 65536

static float A[arr_size]; // two arrays
static float B[arr_size];
float Dot_Prod_Pntr(float* arr_1, float* arr_2, const int size);

int main() {
	uint64_t elapsedTime; // difference
	uint64_t total_time = 0;
	int d_prod;
	struct timespec startTime, endTime;

	for (int n = 0; n < arr_size; n++) {
		A[n] = n / 2.0;
		B[n] = n / 3.0;
	}

	cout << "Array size: " << arr_size << endl;
	
	// to account for deviation in error (this is normal), we are running this program 10 times, and then taking the average result. That way we net the accurate representative running time.
	for (int i = 0; i < 10; i++) {
		clock_gettime(CLOCK_PROCESS_CPUTIME_ID, &startTime); // Begin Timer
		d_prod = Dot_Prod_Pntr(&A[0], &B[0], arr_size); // using Pointer
		clock_gettime(CLOCK_PROCESS_CPUTIME_ID, &endTime);

		elapsedTime = NANO * (endTime.tv_sec - startTime.tv_sec) + (endTime.tv_nsec - startTime.tv_nsec);

		total_time += elapsedTime;
		// cout << "TotalTime: " << total_time << endl << endl; // remove comment to see total time
		}

	cout << "Average time: " << (total_time / 10) << " ns" << endl; // Note this time and graph it into the excel doc
	return 0;
}
