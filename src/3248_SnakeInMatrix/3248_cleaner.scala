object Solution {
    def finalPositionOfSnake(n: Int, commands: List[String]): Int = {
        commands.map((cmd) => {
            cmd match {
                case "UP"    => -n
                case "DOWN"  => n
                case "LEFT"  => -1
                case "RIGHT" => 1 
                case _ => 0
            }
        }).sum
    }
}