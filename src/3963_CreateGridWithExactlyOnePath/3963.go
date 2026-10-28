import "strings"

func createGrid(m int, n int) []string {
    ans := make([]string, m)

    for i := 0; i < m; i++ {
        var b strings.Builder

        for j := 0; j < n; j++ {
            if i == 0 || j+1 >= n {
                b.WriteString(".")
            } else {
                b.WriteString("#")
            }
        }

        ans[i] = b.String()
    }

    return ans
}