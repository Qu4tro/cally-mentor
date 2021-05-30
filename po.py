from pathlib import Path
import polib
import io
import tokenize
import string

def po():
    p = Path('src')

    po = polib.POFile()
    po.metadata = {
        'Project-Id-Version': '1.0',
        'Report-Msgid-Bugs-To': 'you@example.com',
        'POT-Creation-Date': '2007-10-18 14:00+0100',
        'PO-Revision-Date': '2007-10-18 14:00+0100',
        'Last-Translator': 'you <you@example.com>',
        'Language-Team': 'English <yourteam@example.com>',
        'MIME-Version': '1.0',
        'Content-Type': 'text/plain; charset=utf-8',
        'Content-Transfer-Encoding': '8bit',
    }

    for f in p.glob('**/*.elm'):
        text = f.read_text()
        for token in tokenize.generate_tokens(io.StringIO(text).readline):
            if token.type == tokenize.STRING:
                if last_token.type == tokenize.NAME:
                    if last_token.string == 'class':
                        continue
                    if last_token.string == 'type_':
                        continue
                    if last_token.string == 'withClass':
                        continue

                if not any(c in string.ascii_letters for c in token.string):
                    continue

                entry = polib.POEntry(
                    msgid=token.string.strip('"'),
                    msgstr='',
                    occurrences=[(f.relative_to('src'), token.start[0])]
                )
                po.append(entry)

            last_token = token

    po.save('out.po')

po()