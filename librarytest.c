#include "pcg.h"
#include <stdio.h>

int main(int argc, char **argv) {
    if (argc > 0) {
        printf("%s\n", argv[1]);
        printf("%s\n", reverse(argv[1]));
    }
}