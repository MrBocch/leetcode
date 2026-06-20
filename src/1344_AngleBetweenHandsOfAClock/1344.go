import "math"

func angleClock(hour int, minutes int) float64 {
    mHand := float64(minutes) * 6

    hHand := (float64(hour) / 12) * 60 * 6
    hHand = math.Mod(hHand, 360) 
    hHand += (float64(minutes) / 60) * 5 * 6 

    angle := math.Abs(hHand - mHand)

    return math.Min(angle, 360 - angle)
}