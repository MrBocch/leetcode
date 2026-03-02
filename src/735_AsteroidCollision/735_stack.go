type Stack[T any] struct {
    items []T
}

func (s *Stack[T]) Push(v T) {
    s.items = append(s.items, v)
}

func (s *Stack[T]) Peek() (T, error) {
    if len(s.items) == 0 {
        var zero T
        return zero, fmt.Errorf("empty stack")
    }
    return s.items[len(s.items)-1], nil
}

func (s *Stack[T]) Pop() (T, error) {
    if len(s.items) == 0 {
        var zero T
        return zero, fmt.Errorf("empty stack")
    }

    popped := s.items[len(s.items)-1]

    var zero T
    s.items[len(s.items)-1] = zero  // dont get whhy need to zero it out
    s.items = s.items[:len(s.items)-1]

    return popped, nil
}

func (s *Stack[T]) IsEmpty() bool {
    return len(s.items) == 0
}

func (s *Stack[T]) Items() []T {
    return s.items
}

func abs(x int) int {
    if x < 0 { return x*-1 }
    return x
}

func asteroidCollision(asteroids []int) []int {
    i := 0
    stack := Stack[int]{}
    for ; i < len(asteroids) ; {
        ast := asteroids[i]

        if stack.IsEmpty() {
            stack.Push(ast)
            i += 1
            continue 
        }
        peek, err := stack.Peek() 
        if err != nil { panic("something very wrong") }
        if ast > 0 || peek < 0 {
            stack.Push(ast)
            i += 1
            continue 
        } 

        if abs(ast) < peek {
            i += 1
            continue 
        }

        if abs(ast) == peek {
            i += 1
            stack.Pop()
            continue
        }

        if abs(ast) > peek {
            stack.Pop()
            continue 
        }

    }
    return stack.items
}