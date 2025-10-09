from functools import partial

class Solution:
    def isValidSudoku(self, board: List[List[str]]) -> bool:
        # check rows
        for rows in board:
            seen = {}
            for n in rows:
                if n == ".": 
                    continue 
                if n not in seen:
                    seen[n] = 1 
                else:
                    return False 
        # check columns 
        for i in range(len(board)):
            seen = {}
            for j in range(len(board)):
                n = board[j][i]
                if n == ".":
                    continue 
                if n not in seen:
                    seen[n] = 1
                else:
                    return False

        # check boxs 
        check_bbox = partial(check_box, board=board)
        if not check_bbox([0,3], [0,3]):
            return False
        if not check_bbox([0,3], [3,6]):
            return False
        if not check_bbox([0,3], [6,9]):
            return False
        if not check_bbox([3,6], [0,3]):
            return False
        if not check_bbox([3,6], [3,6]):
            return False
        if not check_bbox([3,6], [6,9]):
            return False
        if not check_bbox([6,9], [0,3]):
            return False
        if not check_bbox([6,9], [3,6]):
            return False
        if not check_bbox([6,9], [6,9]):
            return False

        return True 

# i, j[start, end]
def check_box(i: List[int], j: List[int], board: List[List[str]]) -> bool:
        seen = {}
        for iidx in range(i[0], i[1]):
            for jidx in range(j[0], j[1]):
                n = board[iidx][jidx] 
                if n == ".":
                    continue 
                if n not in seen:
                    seen[n] = 1
                else:
                    return False
        return True  