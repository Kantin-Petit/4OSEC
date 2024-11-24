import signal
valid_signals = signal.valid_signals()
print(valid_signals)

s1 = list(signal.valid_signals())[0]
print(s1.name)
print(s1.numerator)
print(s1.value)
print(s1.real)
print(s1._member_names_)