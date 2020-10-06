class TestCaixa : Gee.TestCase {

public TestCaixa() {
    // assign a name for this class
    base("teste-caixa");
    // add test methods
    add_test("teste-nao-validar-lancamento", test_nao_validar_lancamento);
    add_test("teste-validar",test_validar_lancamento);
    add_test("teste-nao-validar-caixa", test_nao_validar_caixa);
   }

   public override void set_up () {
     // setup your test
   }

   public void test_nao_validar_lancamento() {
        Finux.Lancamento lan = new Finux.Lancamento();

        var esperado = false;
        var atual = lan.validar();

     assert(esperado == atual);
   }

   public void test_validar_lancamento() {
        Finux.Lancamento lan = new Finux.Lancamento();

        Finux.Conta conta = new Finux.Conta();
        conta.id = 1;
        conta.descricao = "Cartao";
        conta.fluxo = Finux.Fluxo.ENTRADA;

        lan.id = 1;
        lan.caixa = new Finux.Caixa();
        lan.data = new DateTime.now_local ();
        lan.conta = conta;
        lan.valor_previsto = 200;
        lan.valor_realizado = 200;

        var esperado = true;
        var atual = lan.validar();

        assert(esperado == atual);
   }

    public void test_nao_validar_caixa(){
        Finux.Conta conta = new Finux.Conta();
        Finux.Lancamento lan = new Finux.Lancamento();
        Finux.Caixa caixa = new Finux.Caixa();

        conta.id = 1;
        conta.descricao = "Cartao";
        conta.fluxo = Finux.Fluxo.ENTRADA;

        lan.id = 1;
        lan.caixa = new Finux.Caixa();
        lan.data = new DateTime.now_local ();
        lan.conta = conta;
        lan.valor_previsto = 200;
        lan.valor_realizado = 200;

        caixa.id = 0;
        caixa.competencia = "10/2020";
        caixa.lancamentos.add(lan);

        var esperado = false;
        var atual = caixa.validar();

        assert(esperado == atual);
   }

   public override void tear_down () {
     // tear down your test
   }
}

