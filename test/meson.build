
finux_source_test = [
  'testmain.vala',
  'testcaixa.vala',
  'testcase.vala',
  finux_test_sources,
  ]

logic_test = executable(
  'finux',
  sources: finux_source_test,
  dependencies: finux_deps,
  include_directories: source_root,
  workdir: '../sr',
)

test('Caixa Teste',logic_test)
