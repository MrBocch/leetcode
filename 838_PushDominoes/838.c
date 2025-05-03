char check(char left, char right);

char* pushDominoes(char* dominoes) {
    int len       = strlen(dominoes);
    char* res     = malloc(len +1);
    char* scratch = malloc(len +1);
    strcpy(res, dominoes);
    strcpy(scratch, dominoes);

    int compare;
    while(1){
        for(int i = 0; i < len; i++){
            char mid = res[i];
            char left = '\0';
            char right = '\0';

            if(mid != '.') continue;
            if(i-1 >= 0) left = res[i-1];
            if(i+1 < len) right = res[i+1];

            char c = check(left, right);

            scratch[i] = c;
        }
        compare = memcmp(res, scratch, len);
        if(compare == 0) return res;

        strcpy(res, scratch);
    }
}

char check(char left, char right){
    if(left == '\0' && right == '\0') return '.';
    if(left == '\0' && right == 'L') return 'L';
    if(left == '\0' && right == 'R') return '.';
    if(left == '\0' && right == '.') return '.';

    if(left == 'L' && right == '\0') return '.';
    if(left == 'L' && right == 'L') return 'L';
    if(left == 'L' && right == 'R') return '.';
    if(left == 'L' && right == '.') return '.';

    if(left == 'R' && right == '\0') return 'R';
    if(left == 'R' && right == 'L') return '.';
    if(left == 'R' && right == 'R') return 'R';
    if(left == 'R' && right == '.') return 'R';

    if(left == '.' && right == '\0') return '.';
    if(left == '.' && right == 'L') return 'L';
    if(left == '.' && right == 'R') return '.';
    if(left == '.' && right == '.') return '.';

    // this should never reach; have to write this because of compiler flag
    return '9';
}
