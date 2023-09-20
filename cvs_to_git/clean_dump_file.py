import sys

def is_not_auto_merge(line, auto_marks):
    if not (line.startswith('merge :') or line.startswith('from :')):
        return True
    mark = line.strip().split(':')[1]
    if mark in auto_marks:
        return False
    return True

infile = sys.argv[1]

auto_update_marks = set()
stanza = []
with open(infile) as fobj:
    for i, line in enumerate(fobj):
        if not stanza or not line.startswith('commit '):
            stanza.append(line)
        else:
            if 'AutoUpdate\n' in stanza:
                for item in stanza:
                    if item.startswith('mark :'):
                        auto_update_marks.add(item.strip().split(':')[1])
                        break
            else:
                for item in stanza:
                    if is_not_auto_merge(item, auto_update_marks):
                        sys.stdout.write(item)
            stanza = [line]
    for item in stanza:
        if is_not_auto_merge(item, auto_update_marks):
            sys.stdout.write(item)
