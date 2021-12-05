#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define max_line 100
#define max_nums 1000

int read_input(unsigned int *gamma_rate, char *filename) {
    FILE *fp = fopen(filename, "r");
    char line[max_line];

    int num_lines = 1;
    int num_bits = strlen(fgets(line, max_line, fp)) - 1;  // ignore newline
    int num_ones[num_bits];

    int i;
    for (i=0; i<num_bits; i++) {
        num_ones[i] = line[i] - 48;
    }

    while (fgets(line, max_line, fp) != NULL) {
        for (i=0; i<num_bits; i++) {
            num_ones[i] += line[i] - 48;
        }
        num_lines++;
    }

    fclose(fp);

    for (i=0; i<num_bits; i++) {
        *gamma_rate |= (num_lines < 2*num_ones[i]) << (num_bits - i - 1);
    }
    return num_bits;
}

int main(int argc, char **argv) {
    if (argc != 2) {
        fprintf(stderr, "usage: %s <input_file>\n", argv[0]);
        exit(1);
    }

    unsigned int gamma_rate = 0;
    int num_bits = read_input(&gamma_rate, argv[1]);
    unsigned int epsilon_rate = ((1 << (num_bits)) - 1) & ~gamma_rate;
    printf("gamma rate: %u\n", gamma_rate);
    for (int i=0; i<num_bits; i++) {
        printf("%d", (gamma_rate >> (num_bits - i - 1)) & 1);
    }
    printf("\n");
    printf("\nepsilon rate: %u\n", epsilon_rate);
    for (int i=0; i<num_bits; i++) {
        printf("%d", (epsilon_rate >> (num_bits - i - 1)) & 1);
    }
    printf("\n");

    printf("\npower consumption: %d\n", gamma_rate * epsilon_rate);

    return 0;
}
