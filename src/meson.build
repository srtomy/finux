finux_test_sources = files(
  'domain/fluxocaixa.vala',
)

finux_sources = [
  'main.vala',
  'window.vala',
  'domain/fluxocaixa.vala',
]

finux_deps = [
  gee,
  gio,
  gtk,
]

gnome = import('gnome')

finux_sources += gnome.compile_resources('finux-resources',
  'finux.gresource.xml',
  c_name: 'finux'
)

finux = executable('finux', finux_sources,
  vala_args: '--target-glib=2.50',  dependencies: finux_deps,
  install: true,
)
