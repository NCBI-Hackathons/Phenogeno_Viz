#define ROWS 8919
#define COLS 7

#include <stdio.h>
#include <math.h>
#include <stdlib.h>
#include <string.h>

void deSeq(double matrix[][COLS]);
void getCol(double matrix[][COLS], double col[], int cIndex);
static int cmpfunc (const void * a, const void * b);
double getMedian(double col[]);
void readFileToMatrix(char* filename, double matrix[][COLS]);

int main() {
	double matrix[ROWS][COLS];
	readFileToMatrix("/home/lindsey/Downloads/pasillaCountTableTrim.txt", matrix);

	deSeq(matrix);

	for(int i = 0; i < 10; i++) {
		for(int j = 0; j < COLS; j++) {
			printf("%g ", matrix[i][j]);
		}
		printf("\n");
	}
}

void readFileToMatrix(char* filename, double matrix[ROWS][COLS]) {
	FILE *file;
	char str[100];
	char *token;

	file=fopen(filename, "r");
	fgets(str, 100, file); /* Skip header */

	for(int i = 0; i < ROWS; i++){
		fgets(str, 100, file);
		/* ignore the first column */
		token = strtok(str, "\t");
		token = strtok(NULL, "\t");

		int j = 0;
		while( token != NULL && j < COLS) {
			matrix[i][j++] = atof(token);
			token = strtok(NULL, "\t");
		}
	}
	fclose(file);
}

void deSeq (double matrix[ROWS][COLS]) {
	double num, denom;
	double sMatrix[ROWS][COLS];
	double colMedians[COLS];

	for(int i = 0; i < ROWS; i++) {
		denom = 1;
		for(int j = 0; j < COLS; j++) {
			if (matrix[i][j] > 0)
				denom *= matrix[i][j];
		}

		denom = pow(denom, 1/(double)COLS);
		for(int j = 0; j < COLS; j++) {
			num = matrix[i][j];
			sMatrix[i][j] = num/denom;
		}
	}

	double col[ROWS];
	for(int i = 0; i < COLS; i++){
		getCol(sMatrix, col, i);
		qsort(col, ROWS, sizeof(double), cmpfunc);
		colMedians[i] = getMedian(col);
	}

	for(int i = 0; i < ROWS; i++) {
		for(int j = 0; j < COLS; j++) {
			matrix[i][j] = matrix[i][j] / colMedians[j];
		}
	}
}

void getCol(double matrix[ROWS][COLS], double col[ROWS], int cIndex) {
	for(int i = 0; i < ROWS; i++) {
		col[i] = matrix[i][cIndex];
	}
}

double getMedian(double col[ROWS]) {
	if(ROWS%2==0) {
        // if there is an even number of elements, return mean of the two elements in the middle
        return((col[ROWS/2] + col[ROWS/2 - 1]) / 2.0);
    } else {
        // else return the element in the middle
        return col[ROWS/2];
    }
}

int cmpfunc (const void * a, const void * b) {
   if (*(double*)a > *(double*)b)
    return 1;
  else if (*(double*)a < *(double*)b)
    return -1;
  else
    return 0;
}
