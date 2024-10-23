class Person():
    def is_major(self):
        return self.age >= 18

toto = Person()
toto.age = 20
titi = Person()
titi.age = 32
nana = Person()
nana.age = 12
nono = Person()
nono.age = 8

a = toto.is_major()
b = titi.is_major()
c = nana.is_major()
d = nono.is_major()

f = not(a and (not b) and (a or b)) or (not a and b) and not(a or (not b) or (not c)) # f = b or not a

g = not((c or d) and a and not(c) and d and (not a) and c or (not d)) # g = d
 
s1 = a and (a or b) # s1 = a
s2 = (a or b) and ((not a) or b) # s2 = b
s3 = (a and (not b) or c) and (a or (not b)) # s3 = c and (a or not b) 
s4 = (a and b) or c and (not a) or (b and c) and (not b) # s4 = b or c
s5 = (a or b or c) and (not a or b or c) or (a and b) or c and d # s5 = b or c
s6 = a or b or ((not c) and b) or (a or (not c)) or not((not a) or b or ((not a) and c))  # s5 = a or b
