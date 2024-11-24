import signal
import time

valid_signals = signal.valid_signals()
print(valid_signals)

s1 = list(signal.valid_signals())[0]
# print(s1.name)
# print(s1.numerator)
# print(s1.value)
# print(s1.real)
# print(s1._member_names_)

# Our signal handler
def signal_handler ( signum , frame ):
    global original_handler
    print (" Signal ID : " , signum , " Frame : " , frame )
    original_handler ( signum , frame )

original_handler = signal . signal ( signal . SIGINT , signal_handler )
print (" Waiting for 5 seconds ... ")
time.sleep(5)