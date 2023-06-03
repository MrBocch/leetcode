/**
 * Note: the returned array must be malloced, assume caller calls free()
 */

int *twoSum(int *nums, int numsSize, int target, int *returnSize)
{
    //brute force
    for(int i = 0; i < numsSize -1; i++){

        for(int j = i+1; j < numsSize; j++){

            if(nums[i] + nums[j] == target){
                *returnSize = 2;
                int *result = malloc(2 * sizeof(int));
                result[0] = i;
                result[1] = j;

                return result;
            }
        }
    }

    *returnSize = 0;

    return;
}