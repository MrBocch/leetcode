struct LinkedList {
    char val;
    struct LinkedList* next;
};

void push_node(struct LinkedList* head, char val){
    struct LinkedList* node = malloc(sizeof(struct LinkedList));
    node->val = val;
    node->next = head->next;
    head->next = node;
    return;
}

char peek(struct LinkedList* head){
    // this should be
    // if(head == NULL || head->next == NULL)
    if(head->next == NULL) return '\0';
    return head->next->val;
}

void pop(struct LinkedList* head){
    struct LinkedList* temp = head->next->next;
    free(head->next);
    head->next = temp;
}

bool isValid(char* s) {
    int i = 0;
    char curr = s[i];
    struct LinkedList* top = malloc(sizeof(struct LinkedList));
    top->next = NULL;

    while(curr != '\0'){
        // when "([{" push to stack
        if(curr == '(' || curr == '[' || curr == '{'){
            push_node(top, curr);
        } else {
            char stack_c = peek(top);
            if(stack_c == '\0') return false;
            if((stack_c == '(' && curr == ')') ||
               (stack_c == '{' && curr == '}') ||
               (stack_c == '[' && curr == ']')) {

                pop(top);
            } else return false;
        }
        // when ")]}" pop from stack
        i+= 1;
        curr = s[i];
    }

    // case were list is not empty
    char c = peek(top);
    if(c != '\0'){
        // should free the linked list?
        while(c != '\0'){
            pop(top);
            c = peek(top);
        }
        free(top);
        return false;
    }
    free(top);
    return true;
}
