package java;


import java.util.concurrent.Semaphore;

 class Philosopher extends Thread {
    private Semaphore leftFork;
    private Semaphore rightFork;
    private int meals;

    public Philosopher(Semaphore leftFork, Semaphore rightFork, int meals) {
        this.leftFork = leftFork;
        this.rightFork = rightFork;
        this.meals = meals;
    }

    public void run() {
        for (int i = 0; i < meals; i++) {
            try {
                think();
                leftFork.acquire();
                System.out.println(Thread.currentThread().getName() + " picked up left fork.");
                rightFork.acquire();
                System.out.println(Thread.currentThread().getName() + " picked up right fork and is now eating.");
                eat();
                leftFork.release();
                System.out.println(Thread.currentThread().getName() + " put down left fork.");
                rightFork.release();
                System.out.println(Thread.currentThread().getName() + " put down right fork and is now thinking.");
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
        }
    }

    private void think() throws InterruptedException {
        Thread.sleep((int)(Math.random() * 1000));
    }

    private void eat() throws InterruptedException {
        Thread.sleep((int)(Math.random() * 1000));
    }
}
public class main {
    public static void main(String[] args) {
        int numPhilosophers = 5;
        int meals = 5;
        Semaphore[] forks = new Semaphore[numPhilosophers];

        for (int i = 0; i < numPhilosophers; i++) {
            forks[i] = new Semaphore(1);
        }

        for (int i = 0; i < numPhilosophers; i++) {
            int leftFork = i;
            int rightFork = (i + 1) % numPhilosophers;
            Philosopher philosopher = new Philosopher(forks[leftFork], forks[rightFork], meals);
            philosopher.setName("Philosopher " + (i + 1));
            philosopher.start();
        }
    }
}