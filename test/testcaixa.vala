class TestCaixa : Gee.TestCase {

public TestCaixa() {
    // assign a name for this class
    base("teste-caixa");
    // add test methods
    add_test("teste-nao-validar-lancamento", test_nao_validar_lancamento);
    add_test("teste-validar",test_validar_lancamento);
    add_test("teste-nao-validar-caixa", test_nao_validar_caixa);
    add_test("teste-calcular-total-entrada-caixa", test_total_entrada_caixa);
    add_test("teste-calcular-total-saida-caixa", test_total_saida_caixa);
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


   public void test_total_entrada_caixa(){
        Finux.Conta conta = new Finux.Conta();
        Finux.Lancamento lan1 = new Finux.Lancamento();
        Finux.Lancamento lan2 = new Finux.Lancamento();
        Finux.Caixa caixa = new Finux.Caixa();

        conta.id = 1;
        conta.descricao = "Cartao";
        conta.fluxo = Finux.Fluxo.ENTRADA;

        lan1.id = 1;
        lan1.caixa = new Finux.Caixa();
        lan1.data = new DateTime.now_local ();
        lan1.conta = conta;
        lan1.valor_previsto = 150;
        lan1.valor_realizado = 150;

        lan2.id = 1;
        lan2.caixa = new Finux.Caixa();
        lan2.data = new DateTime.now_local ();
        lan2.conta = conta;
        lan2.valor_previsto = 350;
        lan2.valor_realizado = 350;

        caixa.id = 0;
        caixa.competencia = "10/2020";
        caixa.lancamentos.add(lan1);
        caixa.lancamentos.add(lan2);

        var esperado = 500.00;
        var atual = caixa.calcular_total_entrada().previsto;

        assert(esperado == atual);

   }


    public void test_total_saida_caixa(){
        Finux.Conta conta = new Finux.Conta();
        Finux.Lancamento lan1 = new Finux.Lancamento();
        Finux.Lancamento lan2 = new Finux.Lancamento();
        Finux.Caixa caixa = new Finux.Caixa();

        conta.id = 1;
        conta.descricao = "Cartao";
        conta.fluxo = Finux.Fluxo.SAIDA;

        lan1.id = 1;
        lan1.caixa = new Finux.Caixa();
        lan1.data = new DateTime.now_local ();
        lan1.conta = conta;
        lan1.valor_previsto = 956.96;
        lan1.valor_realizado = 956.96;

        lan2.id = 1;
        lan2.caixa = new Finux.Caixa();
        lan2.data = new DateTime.now_local ();
        lan2.conta = conta;
        lan2.valor_previsto = 165;
        lan2.valor_realizado = 165;

        caixa.id = 0;
        caixa.competencia = "10/2020";
        caixa.lancamentos.add(lan1);
        caixa.lancamentos.add(lan2);

        var esperado = 1121.96;
        var atual = caixa.calcular_total_saida().previsto;

        assert(esperado == atual);

   }

   public override void tear_down () {
     // tear down your test
   }
}

