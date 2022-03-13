finux_sources = [
  'main.vala',
  'window.vala',
  resources
]

finux_deps = [
  dependency('gio-2.0', version: '>= 2.50'),
  dependency('gtk4', version: '>= 4')
]

executable('finux', finux_sources,
  vala_args: '--target-glib=2.50',  dependencies: finux_deps,
  install: true,
)
