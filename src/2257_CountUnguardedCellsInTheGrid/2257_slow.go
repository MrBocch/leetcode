type Point struct {
    x, y int
}

func countUnguarded(m int, n int, guards [][]int, walls [][]int) int {
    
    grid := make([][]int, m)
    covered := make(map[Point] bool)

    for i := range grid {
        grid[i] = make([]int, n)
    }
    for _, v := range guards {
        i , j := v[0], v[1]
        grid[i][j] = 1
    }
    for _, v := range walls {
        i , j := v[0], v[1]
        grid[i][j] = 2
    }
    checkDirection := func (guard Point, x int, y int) {
        xOff := x 
        yOff := y
        
        for ; (guard.x+xOff < n && guard.x+xOff > -1) && (guard.y+yOff < m && guard.y+yOff > -1) ; {
            if grid[guard.y+yOff][guard.x+xOff] == 2 { return }
            if grid[guard.y+yOff][guard.x+xOff] == 1 { return }
            pp := Point{guard.y+yOff, guard.x+xOff}
            covered[pp] = true
            xOff += x
            yOff += y
        }
        return 
    }
    for _, v := range guards {
        i, j := v[0], v[1]
        p := Point{j, i}
        checkDirection(p, 1, 0)
        checkDirection(p, -1, 0)
        checkDirection(p, 0, 1)
        checkDirection(p, 0, -1)
    }

    return (m*n) - len(covered) - len(walls) - len(guards)
}