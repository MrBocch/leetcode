bool is_odd(int n);

bool threeConsecutiveOdds(int* arr, int arrSize) {

    bool n1, n2, n3;
    for(int i = 0; i < arrSize -2; i++){
        n1 = is_odd(arr[i]);
        n2 = is_odd(arr[i+1]);
        n3 = is_odd(arr[i+2]);

        if(n1 && n2 && n3) return true;
    }

    return false;
}

bool is_odd(int n){
	// this occured to me after the fact looking at the code
	// return n % 2 != 0; this is much nicer to look at, whatever
    return !((n % 2) == 0);
}
