func numRookCaptures(board [][]byte) int {
    ri, rj := findRook(board)    

    attacked_pawns := 0
    for i:= ri+1 ; i < 8 ; i++ {
        if board[i][rj] != '.' && board[i][rj] != 'p' { break }
        if board[i][rj] == 'p'{
            attacked_pawns += 1
            break
        }
    }
    for i:= ri-1 ; i >= 0 ; i-- {
        if board[i][rj] != '.' && board[i][rj] != 'p' { break }
        if board[i][rj] == 'p'{
            attacked_pawns += 1
            break
        }
    }
    for j:= rj+1 ; j < 8 ; j++ {
        if board[ri][j] != '.' && board[ri][j] != 'p' { break }
        if board[ri][j] == 'p'{
            attacked_pawns += 1
            break
        }
    }
    for j:= rj-1 ; j >= 0 ; j-- {
        if board[ri][j] != '.' && board[ri][j] != 'p' { break }
        if board[ri][j] == 'p'{
            attacked_pawns += 1
            break
        }
    }

    return attacked_pawns
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
