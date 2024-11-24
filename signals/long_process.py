import multiprocessing
import os

name = []

def print_hello():
    os.fork()
    for i in range(10):
        print(name)
        name.append(i)

p1 = multiprocessing.Process(target=print_hello)
p1.start()

def print_hi():
    for _ in range(10):
        print(name)
        print(f"Hi {os.getppid()}")

p2 = multiprocessing.Process(target=print_hi)
p2.start()