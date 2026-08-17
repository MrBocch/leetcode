func clamp(l float64, x float64, r float64) float64 {
	return min(r, max(l, x))
}

func champagneTower(poured int, query_row int, query_glass int) float64 {

	solver := cupExcess(poured)

    lexcess := float64(0)
    rexcess := float64(0)
	if query_row == 0 {
		if poured >=1 { return 1 }
		return 0

	} else if query_glass == 0 {
		rexcess = solver(query_row-1, query_glass) / 2

	} else if query_glass == query_row {
		lexcess = solver(query_row-1, query_glass-1) / 2
	} else {
		lexcess = solver(query_row-1, query_glass) / 2
		rexcess = solver(query_row-1, query_glass-1) / 2
	}

    return clamp(0, lexcess+rexcess, 1)
}



type Key struct {
	Row int
	Glass int
}

func cupExcess(poured int) func(int,int) float64 {
	cache := make(map[Key] float64)

	var excess func(int, int) float64
	excess = func(row int, glass int) float64 {
		key := Key{Row: row, Glass:glass}
		if res, ok := cache[key]; ok {
			return res
		}

		result := float64(0)
		upExcess := float64(0)
		leftExcess := float64(0)

		if row == 0 {
			result = max(0, float64(poured - 1))
			cache[key] = result
			return cache[key]

		} else if glass == 0 {
			upExcess = excess(row-1, glass) / 2 
		} else if glass == row {
			leftExcess = excess(row-1, glass-1) / 2 
		} else {
			leftExcess = excess(row-1, glass-1) / 2 
			upExcess = excess(row-1, glass) / 2 
		}

		leftExcess = max(0, leftExcess)
		upExcess   = max(0, upExcess)
		result = max(0, (leftExcess + upExcess) - 1)
  
		cache[key] = result
		return cache[key]
	}

	return excess
}