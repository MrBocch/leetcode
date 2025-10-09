#include <stdio.h>
#include <stdlib.h>

struct ListNode {
    int val;
    struct ListNode *next;
};

void printList(struct ListNode* head) {
    struct ListNode* curr = head;
    while(curr->next != NULL){
        printf("%d -> ", curr->val);
        curr = curr->next;
    }
    printf("%d -> NULL\n", curr->val);
}

struct ListNode* reverseList(struct ListNode* head) {
    if (head == NULL) return head;

    struct ListNode* tail = NULL;
    struct ListNode* curr = head;

    while(1){
        if(curr->next == NULL){
            puts("reached the end");
            printf("prev: %p\n", tail);
            printf("curr %p, %d\n", curr, curr->val);
            curr->next = tail;
            return curr;
        }

        printf("prev: %p\n", tail);
        printf("curr %p, %d\n", curr, curr->val);
        struct ListNode* temp = curr->next;

        curr->next = tail;
        tail = curr;
        curr = temp;
    }
}

int main(){

    // i totally forgot that you have to allocate memory
    struct ListNode* head = malloc(sizeof(struct ListNode));
    struct ListNode* n2 = malloc(sizeof(struct ListNode));
    struct ListNode* n3 = malloc(sizeof(struct ListNode));
    head->val = 1;
    head->next = n2;
    n2->val = 2;
    n2->next = n3;
    n3->val = 3;
    n3->next = NULL;

    printList(head);
    head = reverseList(head);
    printList(head);

    free(head);
    return 0;
}
