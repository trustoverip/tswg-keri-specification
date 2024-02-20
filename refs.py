import re
file = open('spec/spec.md', 'r')

refs = []
defs = []

for line in file:
    refs += list(map(str.strip, re.findall(r'\[\[ref:(.*?)\]\]', line)))
    for d in re.findall(r'\[\[def:(.*?)\]\]', line):
        defs += list(map(str.strip, d.split(',')))

print(set(refs) - set(defs))
