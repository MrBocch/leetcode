
struct DynArray {
    int capacity;
    int length;
    // cant use generics in C?
    char* array;
};

struct DynArray* create_array(){
    struct DynArray* array = malloc(sizeof(struct DynArray));
    array->capacity = 4;
    array->length = 0;
    array->array = malloc(sizeof(char) * array->capacity);

    return array;
}

char array_at(struct DynArray* array, int index){
    if(index >= array->length){
        // cant think of something else to return if error
        return '\0';
    }
    return array->array[index];
}

char array_last(struct DynArray* array){
    if(array->length-1 < 0) return '\0'; //should probably stop this from happening?
    return array->array[array->length-1];
}

void array_push(struct DynArray* array, char val){
    if(array->length == array->capacity){
        array->capacity *= 2;
        // realloc returns a (void*) so you must cast it
        array->array = (char*) realloc(array->array, sizeof(char) * array->capacity);
        array->array[array->length] = val;
        array->length += 1;
        return;
    }
    array->array[array->length] = val;
    array->length += 1;
    return;
}

char array_pop(struct DynArray* array){
    char c = array_last(array);
    array->length -= 1;
    return c;
}

void array_print(struct DynArray* array){
    for(int i = 0; i < array->length; i++){
        printf("%c", array->array[i]);
    }
}

void array_destroy(struct DynArray* array){
    if(array){
        free(array->array);
        free(array);
    }
}

bool isValid(char* s) {
    struct DynArray* stack = create_array();

    int idx = 0;
    char c = s[idx];
    while(c != '\0'){
        if(c == '(' || c == '[' || c == '{') array_push(stack, c);

        if(c == ')' || c == ']' || c == '}') {
            if(stack->length == 0) goto bye;
            char last = array_last(stack);
            if(c == ')' && last != '(') goto bye;
            if(c == ']' && last != '[') goto bye;
            if(c == '}' && last != '{') goto bye;
            array_pop(stack);
        }
        idx += 1;
        c = s[idx];
    }
    
    return stack->length == 0;

bye:
    array_destroy(stack);
    return false;
}