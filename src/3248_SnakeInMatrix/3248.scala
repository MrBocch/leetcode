object Solution {
    def finalPositionOfSnake(n: Int, commands: List[String]): Int = {
        val d = commands.map((cmd) => {
            cmd match {
                case "UP"    => (-1, 0)
                case "DOWN"  => (1, 0)
                case "LEFT"  => (0, -1)
                case "RIGHT" => (0, 1)
                case _ => (0,0)
            }
        }).reduce( (a: (Int,Int) ,b: (Int, Int)) => (a(0)+b(0), a(1)+b(1)))
        d(0) * n + d(1)
        
    }
}