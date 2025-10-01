void rotate(int* nums, int numsSize, int k) {
    k = k % numsSize;
    if(k == 0) { return; }

    int temp;
    for(int i = 0; i < k; i++){
        for(int j = numsSize-1; j > 0; j--){
            temp      = nums[j-1];
            nums[j-1] = nums[j];
            nums[j]   = temp;
        }
    }

    return; 
}