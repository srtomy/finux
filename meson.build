project('finux', ['c', 'vala'], 
          version: '0.1.0',
    meson_version: '>= 0.50.0',
  default_options: [ 'warning_level=2',
                   ],
)

glib = dependency('glib-2.0', version: '>=2.64')
gee = dependency('gee-0.8')
gio = dependency('gio-2.0', version: '>= 2.50')
gtk =  dependency('gtk+-3.0', version: '>= 3.22')

i18n = import('i18n')

subdir('data')
subdir('src')
subdir('po')
subdir('test')

meson.add_install_script('build-aux/meson/postinstall.py')
