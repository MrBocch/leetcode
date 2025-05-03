#include <stdio.h>
#include <stdlib.h>
#include <string.h>

/*
    This does not work.

    I thought it was easy because i could
    just go thrue the array left from right
    and depending of the state of the before and after elements
    you write ., R or L

    but what about
    'R..L'
    if you implemented your algorithm correctly
    you would get
    'R..L'


*/

enum Leans{
    LEFT,
    NONE,
    RIGHT
};

char* test(int len);

int main(){
    enum Leans to_left = NONE;
    //enum Leaning to_right;

    char* c = test(3);
    c = "abcde";
    printf("%lu\n", strlen(c));
    return 0;
}

char* test(int len){
    char* c = malloc(sizeof(char) * len);
    return c;
}

enum Leaning {
    LEFT,
    NONE,
    RIGHT,
    to_be_determined
};

char* pushDominoes(char* dominoes) {
    int len   = strlen(dominoes);
    // rewrite using malloc
    char* res = calloc(len+1, sizeof(char));


    // theres is some case that im missing here.
    enum Leaning to_left  = NONE;
    enum Leaning to_right = to_be_determined;
    printf("before change: %d\n", to_left);
    to_left = RIGHT;
    printf("after change: %d\n", to_left);

    for(int i = 0; i < len; i++){
        char c = dominoes[i];
        if(c == 'R'){
            to_left = RIGHT;
            res[i] = c;
            continue;
        }
        if(c == 'L'){
            to_left = LEFT;
            res[i] = c;
            continue;
        }
        if(c == '.'){
            if(to_right == to_be_determined){
                for(int j = i+1; j < len; j++){
                    c = dominoes[j];
                    if(c == '.') continue;
                    if(c == 'L') to_right = LEFT; break;
                    if(c == 'R') to_right = RIGHT; break;
                }
            }
            printf("left leans: %d\n", to_left);
            printf("right leans: %d\n", to_right);
            if(to_left == NONE && to_right == LEFT) res[i] = 'L';
            if(to_left == NONE && to_right == RIGHT) res[i] = '.';

            if(to_left == LEFT && to_right == LEFT) res[i] = 'L';
            if(to_left == LEFT && to_right == RIGHT) res[i] = '.';

            if(to_left == RIGHT && to_right == RIGHT) res[i] = 'R';
            if(to_left == RIGHT && to_right == LEFT) res[i] = '.';

            if(to_right == to_be_determined) res[i] = '.';
            to_right = to_be_determined;

        }

    }


    return res;
}
