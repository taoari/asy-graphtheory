import re

external=re.compile('\s*\[.*\]\((.*)\)\s*')

def preview(mainfn='README_doc.md'):
    with open(mainfn) as f:
        for line in f:
            m = external.match(line)
            if m:
                fn = m.group(1)
                print fn

def process(mainfn='README_doc.md'):
    md_all = []
    with open(mainfn) as f:
        for line in f:
            m = external.match(line)
            if m:
                fn = m.group(1)
                if fn.endswith('.asy'):
                    md_all.append('\n\n```\n')
                    with open(fn) as f2:
                        md_all.extend(f2.readlines())
                    md_all.append('```\n\n')
                elif fn.endswith('.md'):
                    md_all.append('\n\n')
                    with open(fn) as f2:
                        md_all.extend(f2.readlines())
                    md_all.append('\n\n')
            else:
                md_all.append(line)
    return md_all

preview()
md = process()
with open('node.md', 'w') as f:
    f.write(''.join(md))
    
