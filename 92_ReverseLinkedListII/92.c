/**
 * Definition for singly-linked list.
 * struct ListNode {
 *     int val;
 *     struct ListNode *next;
 * };
 */
struct ListNode* reverseBetween(struct ListNode* head, int left, int right) {
    if(head->next == NULL) return head;
    // we dont actually 'reverse' the nodes, just traverse list, and overwrite it?

    int size = right - left + 1;
    int store[size]; 

    struct ListNode* curr = head;
    int i = 1;
    int idx = 0;

    // get values
    while(1){
        if(curr == NULL) break;

        if(i >= left && i <= right) {
            store[idx] = curr->val; 
            idx += 1;
        }

        curr = curr->next;
        i += 1;
    }

    curr = head;
    i = 1;
    idx = size -1;
    // write the values
    while(1){
        if(curr == NULL) break;

        if(i >= left && i <= right) {
            curr->val = store[idx]; 
            idx -= 1;
        }

        curr = curr->next;
        i += 1;
    }

    return head;
}