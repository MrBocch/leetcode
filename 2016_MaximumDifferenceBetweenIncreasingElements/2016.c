int maximumDifference(int* nums, int numsSize) { 
    int maxDif = -1;

    for(int i = 0; i < numsSize-1; i++){
        for(int j = i+1; j < numsSize; j++){
            if(nums[i] > nums[j]) continue;

            int curDif = nums[j] - nums[i];

            if(curDif > maxDif && curDif != 0) maxDif = curDif;
        }
    }

    return maxDif;
}