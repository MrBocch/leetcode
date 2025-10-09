int maximumDifference(int* nums, int numsSize) { 
    int maxDif = -1;
    int smallest = nums[0];

    for(int i = 1; i < numsSize; i++){
        if(smallest >= nums[i]){
            smallest = nums[i];
            continue;
        }

        int curDif = nums[i] - smallest;
        if(maxDif < curDif) maxDif = curDif;
    }
    

    return maxDif;
}