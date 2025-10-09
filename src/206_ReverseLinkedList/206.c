/**
 * Definition for singly-linked list.
 */
struct ListNode {
    int val;
    struct ListNode *next;
};

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
