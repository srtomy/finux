class TestCaixa : Gee.TestCase {

public TestCaixa() {
    // assign a name for this class
    base("Caixa Teste");
    // add test methods
    add_test("Validar Caixa", test_validar_caixa);
   }

   public override void set_up () {
     // setup your test
   }

   public void test_validar_caixa() {
        Finux.Caixa caixa = new Finux.Caixa();
     assert("teste" == "teste");
   }

   public override void tear_down () {
     // tear down your test
   }
}

