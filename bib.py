import re
file = open('spec/biblio.md', 'r')

l = []
for line in file:
    if line != "\n":
        l.append(line.strip())

it = iter(l)

for i, t in enumerate(it):
    i += 1
    x = re.sub(r'\[\[def: ', '', t)
    x = re.sub(r'\]\]', '', x)
    print(f"[{i}]. {x}")
    
    y = re.sub(r'~', '', next(it))
    print(f"[{i}]: {y.strip()}\n")
