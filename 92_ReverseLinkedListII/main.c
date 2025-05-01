#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>

// FORGOT CASE WERE
// list = [1,2...]
// sublist [1,2]

struct ListNode {
    int val;
    struct ListNode *next;
};

struct ListNode* reverseList(struct ListNode* head);
void printList(struct ListNode* head);

struct ListNode* reverseBetween(struct ListNode* head, int left, int right) {
    if(head->next == NULL || right == left) return head;

    struct ListNode* curr = head;

    struct ListNode* left_node;
    struct ListNode* right_node;

    bool found_left = false;

    // what happens when the list is [3,5] ?
    struct ListNode* before_left;
    struct ListNode* after_right;


    int i = 1;
    while(1){
        if(curr == NULL) break;

        if(i == left){
            printf("found left node, %d\n", curr->val);
            left_node = curr;
            found_left = true;
        }

        if(i == right){
            printf("found right node, %d\n", curr->val);
            right_node = curr;
            after_right = curr->next;
            right_node->next = NULL;
        }

        if(!found_left){
            before_left = curr;
        }
        i += 1;
        curr = curr->next;

    }

    // reverse the sublist
    printList(left_node);
    left_node = reverseList(left_node);
    before_left->next = left_node;

    //traverse sublist, set it to point to after the sublist
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



int main(){
    struct ListNode* head = malloc(sizeof(struct ListNode));
    struct ListNode* n2 = malloc(sizeof(struct ListNode));
    struct ListNode* n3 = malloc(sizeof(struct ListNode));
    struct ListNode* n4 = malloc(sizeof(struct ListNode));
    struct ListNode* n5 = malloc(sizeof(struct ListNode));
    head->val = 3;
    head->next = n2;

    n2->val = 5;
    n2->next = NULL;

    // n3->val = 3;
    // n3->next = n4;

    // n4->val = 4;
    // n4->next = n5;

    // n5->val = 5;
    // n5->next = NULL;


    reverseBetween(head, 2, 4);

    puts("List after function");
    printList(head);
    return 0;
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

void printList(struct ListNode* head) {
    struct ListNode* curr = head;
    while(curr->next != NULL){
        printf("%d -> ", curr->val);
        curr = curr->next;
    }
    printf("%d -> NULL\n", curr->val);
}
