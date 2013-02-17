" drop down autocompletion list when typing .
" imap . .<C-N><C-P>

compiler pylint

python << EOF
def evalCurrentLine():
    # replace <string> with file+linene since we do know them
    eval(compile(vim.current.line, '<string>', 'single'), globals())
    #globals().update(locals())

def breakCurrentLine():
    'break string assignment on current line'
    # XXX: support visual selection
    lvars = {}
    eval(compile(vim.current.line, '<string>', 'single'), globals(), lvars)
    stringname, string = lvars.items()[0]
    newstr = breakString(stringname, string=string)

    # check that the string didn't change
    eval(compile(newstr, '<string>', 'single'), globals(), lvars)
    print len(string), len(newstr)
    assert string == lvars.items()[0][1], 'strings not equal'

    newstr = newstr.splitlines()
    y, x = vim.current.window.cursor
    vim.current.buffer[y - 1:y] = newstr

def breakString(stringname, maxwidth=60, string=None):
    '''break a python string over multiple lines. considers
    len(repr(string)), not len(string), so hex escaped characters in string
    will wrap as expected. 
    '''
    # XXX: respect indent
    i = 0
    lines = []
    if string == None:
        string = globals()[stringname]
    prefix = '%s = ' % stringname
    while i < len(string):
        # start with string that fits and shrink it until repr(string) fits.
        first = True
        localmaxwidth = maxwidth - (len(prefix) if i == 0 else 0)
        width = localmaxwidth + 1
        while first or len(line) >= localmaxwidth:
            width -= 1
            line = repr(string[i:i + width])
            first = False
        lines.append(line)
        i += width
    # add prefix. left adjust.
    lines = [x.ljust(width) if i > 0 else prefix + x.ljust(width - len(prefix))
             for i, x in enumerate(lines)]
    ret = ' + \\\n'.join(lines)
    return ret
EOF
