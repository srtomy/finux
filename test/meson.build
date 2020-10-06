
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
  workdir: '../sr',
)

test('Teste Caixa',logic_test)
