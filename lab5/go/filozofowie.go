package main

import (
	"fmt"
	"sync"
	"time"
)

type Philosopher struct {
	leftFork  *sync.Mutex
	rightFork *sync.Mutex
	meals     int
	id        int
}

func (p *Philosopher) eat(wg *sync.WaitGroup) {
	for i := 0; i < p.meals; i++ {
		p.leftFork.Lock()
		p.rightFork.Lock()
		fmt.Printf("Philosopher %d picked up left fork.\n", p.id)
		fmt.Printf("Philosopher %d picked up right fork and is now eating.\n", p.id)
		time.Sleep(time.Duration(100+p.id*100) * time.Millisecond)
		fmt.Printf("Philosopher %d put down left fork.\n", p.id)
		p.leftFork.Unlock()
		fmt.Printf("Philosopher %d put down right fork and is now thinking.\n", p.id)
		p.rightFork.Unlock()
		time.Sleep(time.Duration(100+p.id*100) * time.Millisecond)
	}
	wg.Done()
}

func main() {
	numPhilosophers := 5
	meals := 3

	var wg sync.WaitGroup
	wg.Add(numPhilosophers)

	forks := make([]*sync.Mutex, numPhilosophers)
	philosophers := make([]*Philosopher, numPhilosophers)

	for i := 0; i < numPhilosophers; i++ {
		forks[i] = &sync.Mutex{}
	}

	for i := 0; i < numPhilosophers; i++ {
		leftFork := i
		rightFork := (i + 1) % numPhilosophers
		philosophers[i] = &Philosopher{forks[leftFork], forks[rightFork], meals, i + 1}
		go philosophers[i].eat(&wg)
	}

	wg.Wait()
}
