bool isMonotonic(int* nums, int numsSize){
    int monoInc = 0;
    int monoDec = 0;

    for(int i = 0; i < numsSize-1; i++){
        if(nums[i] == nums[i+1]) continue;
        if(nums[i] < nums[i+1]){
            monoDec = 1;
            break;
        }else{
            monoInc = 1;
            break;
        }
    }

    if(monoInc){
        for(int i = 0; i < numsSize-1; i++){
            if(nums[i] < nums[i+1]) return false;
        }
    }
    if(monoDec){
        for(int i = 0; i < numsSize-1; i++){
            if(nums[i] > nums[i+1]) return false;
        }
    }

    return true;
}