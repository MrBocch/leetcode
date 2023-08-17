int maximumWealth(int** accounts, int accountsSize, int* accountsColSize){
    int maxwealth = 0;
    for(int i = 0; i < accountsSize; i++){
    int currentWealth = 0;
        for(int j = 0; j < accountsColSize[0]; j++){
            currentWealth += accounts[i][j];
        }
        if(maxwealth < currentWealth) maxwealth = currentWealth;
    }   
    return maxwealth;
}