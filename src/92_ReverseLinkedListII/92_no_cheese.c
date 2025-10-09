struct ListNode* reverseList(struct ListNode* head);

struct ListNode* reverseBetween(struct ListNode* head, int left, int right) {
    if(head->next == NULL || right == left) return head;

    struct ListNode* curr = head;

    struct ListNode* left_node;
    struct ListNode* right_node;

    bool found_left = false;
    struct ListNode* before_left;
    struct ListNode* after_right;


    int i = 1;
    while(1){
        if(curr == NULL) break;

        if(i == left){
            left_node = curr;
            found_left = true;
        }

        if(i == right){
            right_node = curr;
            after_right = curr->next;
            if(right_node->next != NULL){
                right_node->next = NULL;
            }
        }

        if(!found_left){
            before_left = curr;
        }
        i += 1;
        curr = curr->next;

    }

    // reverse the sublist
    left_node = reverseList(left_node);

    // before left node, connect with reverserd list
    if(before_left != NULL){
        before_left->next = left_node;
    } else {
        // case were [1,2....] 
        // sublist = [1,2]
        head = left_node;
    }

    // traverse sublist, set it to point to after the sublist
    curr = left_node;
    while(1){
        if(curr->next == NULL){
            curr->next = after_right;
            break;
        }
        curr = curr->next;
    }

    return head;
}

struct ListNode* reverseList(struct ListNode* head) {
    if(head == NULL) return head;

    struct ListNode* tail = NULL;
    struct ListNode* curr = head;
    struct ListNode* temp;
    while(1){
        if (curr->next == NULL){
            curr->next = tail;
            return curr;
        }

        temp = curr->next;
        curr->next = tail;
        tail = curr;
        curr = temp;
    }
}