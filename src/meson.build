finux_sources = [
  'main.vala',
  'window.vala',
]

finux_deps = [
  dependency('gio-2.0', version: '>= 2.50'),
  dependency('gtk+-3.0', version: '>= 3.22'),
]

gnome = import('gnome')

finux_sources += gnome.compile_resources('finux-resources',
  'finux.gresource.xml',
  c_name: 'finux'
)

executable('finux', finux_sources,
  vala_args: '--target-glib=2.50',  dependencies: finux_deps,
  install: true,
)
