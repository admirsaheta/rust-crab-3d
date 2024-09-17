#include <stdio.h>

extern void render_crab(int *size, char *result);

void render_crab_c(int size, char *result) {
    render_crab(&size, result);
}