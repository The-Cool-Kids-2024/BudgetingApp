extensions = ['sphinx_simplepdf', 
              'breathe', 
              'myst_parser', 
              'sphinx_rtd_theme' ]

# Read from rst and md files
source_suffix = ['.rst', '.md']

root_doc = 'index'

project = 'CommonCents'
copyright = '2024'
author = 'Alexander Hooper, Ethan Timpe, Hana Tollossa, Jahcorian Ivery, Varshitha Thanam'
show_authors = True
version = '0.0.1'

breathe_projects = {"CommonCents": "./xml"}
breathe_default_project = "CommonCents"

# HTML theming
html_theme = 'sphinx_rtd_theme'
html_static_path = ['_static']
html_logo = '_static/logo.png'
html_favicon = '_static/favicon.png'
html_theme_options = {
    'titles_only': False,
    'navigation_depth': 2,
    'logo_only': True,
    'display_version': False
}

def setup(app):
    app.add_css_file('theme.css')