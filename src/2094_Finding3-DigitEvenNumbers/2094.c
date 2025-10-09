/**
 * Note: The returned array must be malloced, assume caller calls free().
 */

struct DynArray {
    int capacity;
    int length;
    // cant use generics in C?
    int* array;
};

struct DynArray* create_array(){
    struct DynArray* array = malloc(sizeof(struct DynArray));
    array->capacity = 4;
    array->length = 0;
    array->array = malloc(sizeof(int) * array->capacity);

    return array;
}

int array_at(struct DynArray* array, int index){
    if(index >= array->length){
        // cant think of something else to return if error
        return -1;
    }
    return array->array[index];
}


void array_push(struct DynArray* array, int val){
    if(array->length == array->capacity){
        array->capacity *= 2;
        // realloc returns a (void*) so you must cast it
        array->array = (int*) realloc(array->array, sizeof(int) * array->capacity);
        array->array[array->length] = val;
        array->length += 1;
        return;
    }
    array->array[array->length] = val;
    array->length += 1;
    return;
}

void array_print(struct DynArray* array){
    for(int i = 0; i < array->length; i++){
        printf("%d - ", array->array[i]);
    }
}

void array_destroy(struct DynArray* array){
    if(array){
        free(array->array);
        free(array);
    }
}
// had to get this from chatgpt
int get_digit_from_right(int num, int n) {
    return (num / (int)pow(10, n - 1)) % 10;
}
int* findEvenNumbers(int* digits, int digitsSize, int* returnSize) {
    int freq[10] = {0};
    for(int i = 0; i < digitsSize; i++){
        freq[digits[i]] += 1;
    }

    struct DynArray* arr = create_array();
    int copy[10];
    for(int i = 100; i <= 999; i+=2){
        memcpy(copy, freq, sizeof(freq)); 
        int first_dig = get_digit_from_right(i, 3);
        int mid_dig = get_digit_from_right(i, 2);
        int last_dig = get_digit_from_right(i, 1);

        copy[first_dig] -= 1;
        copy[mid_dig] -= 1;
        copy[last_dig] -= 1;

        if (copy[first_dig] >= 0 && 
            copy[mid_dig] >= 0 &&
            copy[last_dig] >= 0){

                array_push(arr, i);
            }
    }

    *returnSize = 0; // had to look at someone else do this, totally forgot
    if(arr->length == 0) return NULL;

    //copying array over
    int* ans = malloc(sizeof(int) * arr->length);
    for(int i = 0; i < arr->length; i++){
        ans[i] = array_at(arr, i);
    }

    *returnSize = arr->length;
    array_destroy(arr);
    return ans;
}