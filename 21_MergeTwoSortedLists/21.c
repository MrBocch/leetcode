/**
 * Definition for singly-linked list.
 * struct ListNode {
 *     int val;
 *     struct ListNode *next;
 * };
 */
struct ListNode* solver(struct ListNode* merged, 
                        struct ListNode* l1, 
                        struct ListNode* l2);

struct ListNode* last_node(struct ListNode* head){
    struct ListNode* curr = head;
    if(curr == NULL) return curr;
    while(curr->next != NULL){
        curr = curr->next;
    }
    return curr;
}

struct ListNode* mergeTwoLists(struct ListNode* list1, struct ListNode* list2) {
    struct ListNode* merged;
    struct ListNode* l1 = list1;
    struct ListNode* l2 = list2;

    return solver(merged, l1, l2);
}

struct ListNode* solver(struct ListNode* merged, 
                        struct ListNode* l1, 
                        struct ListNode* l2)
{
    if(l1 == NULL && l2 == NULL) return merged;

    struct ListNode* last = last_node(merged);
    if(l2 == NULL){
        if(last == NULL) {
            merged = l1;
            return merged;
        } else {
            last->next = l1;
            return merged;
        }
    }
    if(l1 == NULL){
        if(last == NULL){
            merged = l2;
            return merged;
        } else {
            last->next = l2;
            return merged;
        }
    }

    if(l1->val < l2->val){
        struct ListNode* temp = l1->next;
        l1->next = NULL;
        if(last != NULL){
            last->next = l1;
            l1 = temp;
        } else {
            merged = l1;
            l1 = temp;
        }
    } else {
        struct ListNode* temp = l2->next;
        l2->next = NULL;
        if(last != NULL){
            last->next = l2;
            l2 = temp;
        } else {
            merged = l2;
            l2 = temp;
        }
    }

    return solver(merged, l1, l2);
}
