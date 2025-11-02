func numRookCaptures(board [][]byte) int {
    ri, rj := findRook(board)    

    checkDirection := func (x int, y int) int {
        xOff := 0 
        yOff := 0
        for ; (rj+xOff < 8 && rj+xOff > -1) && (ri+yOff < 8 && ri+yOff > -1) ; {
            if board[ri+yOff][rj+xOff] == 'p' { return 1 }
            if board[ri+yOff][rj+xOff] == 'B' { return 0 }

            xOff += x
            yOff += y
        }
        return 0
    }

    return checkDirection(1, 0) + checkDirection(-1, 0) + checkDirection(0, 1) + checkDirection(0, -1) 
}

func findRook(board [][]byte) (int, int) {
    for i := range(8){
        for j := range(8){
            if board[i][j] == 'R' {
                return i, j
            }
        }
    }  
    return 0, 0
}