c = get_config()

c.InteractiveShellApp.exec_lines = [
    'import numpy as np',
    'import pandas as pd',
    'import seaborn as sns',
    'sns.set()',
]
c.InteractiveShell.autoindent = True
c.InteractiveShell.confirm_exit = False
c.InteractiveShell.editor = 'vim'

c.AliasManager.user_aliases = [
    ('la', 'ls -al'),
]
