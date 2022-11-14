#include <immintrin.h>
#include <stdio.h>

float Dot_Prod_Pntr(float* a, float* b, int n) {
    __m256 ymm0, ymm1, ymm2, result = _mm256_setzero_ps();
    const int mask = 0xF1;
    float product = 0.0;

#pragma loop(hint_parallel(8))
    for (int i = 0; i < n / 8; i++) {
        ymm0 = _mm256_load_ps(a + i * 8);
        ymm1 = _mm256_load_ps(b + i * 8);
        ymm2 = _mm256_dp_ps(ymm0, ymm1, mask);

        float* temp = (float*)&ymm0;
        product += (temp[0] + temp[4]);
    }

    //_mm256_store_ps(product, result);

    return product;
}