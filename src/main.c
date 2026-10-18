#include <stdio.h>

int main(void)
{
    char word[8] = {0};
    int result = scanf("%s", word);

    if (result == 1) {
        printf("word: %s\n", word);
    }

    return 0;
}