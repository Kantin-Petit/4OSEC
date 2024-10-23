a = 1
b = 1
c = 0
d = 0
f = not(a and (not b) and (a or b)) or (not a and b) and not(a or (not b) or (not c)) # f = b or not a

g = not((c or d) and a and not(c) and d and (not a) and c or (not d)) # g = d
 
s1 = a and (a or b) # s1 = a
s2 = (a or b) and ((not a) or b) # s2 = b
s3 = (a and (not b) or c) and (a or (not b)) # s3 = a and not(b)
s4 = (a and b) or c and (not a) or (b and c) and (not b) # s4 = b or c
s5 = a or b or ((not c) and b) or (a or (not c)) or not((not a) or b or ((not a) and c))  # s5 = a or b

print("f:"+ str(f))
print("g:"+ str(g))
print("s1:"+ str(s1))
print("s2:"+ str(s2))
print("s3:"+ str(s3))
print("s4:"+ str(s4))
print("s5:"+ str(s5))
