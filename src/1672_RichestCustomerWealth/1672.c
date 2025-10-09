#include <stdio.h>

int maximumWealth(int** accounts, int accountsSize, int* accountsColSize){
    
    int maxWealth = 0;
    int currentWealth = 0;

    for(int i = 0; i < accountsSize; i++){
        
    int currentWealth = 0;
        for(int j = 0; j < accountsColSize[0]; j++){
            
            currentWealth += accounts[i][j];
        }
        //if(maxWealth < currentWealth) maxWealth = currentWealth;
        maxWealth = fmax(maxWealth, currentWealth);
    }   
    return maxWealth;
}