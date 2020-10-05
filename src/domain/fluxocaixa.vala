public class Finux.SaldoInicial{
    public int id;
    public double valor_previsto;
    public double valor_realizado;
    public string competencia;
    public Caixa caixa;

}

public class Finux.Valor{
    public double previsto;
    public double realizado;
}

public class Finux.Caixa{
    public int id;
    public string competencia;
    public Gee.List<Lancamento> lancamentos = new Gee.ArrayList<Lancamento>();
    public SaldoInicial saldo_inicial;
}


public enum Finux.Fluxo{
    ENTRADA, SAIDA
}


public class Finux.Conta{
    public int id  { get; set; }
    public string descricao {get; set;}
    public Fluxo fluxo {get; set;}

}

public class Finux.Lancamento{
    public int id;
    public Caixa caixa;
    public Date data { get; set; }
    public Conta conta { get; set; }
    public double valor_previsto { get; set; }
    public double valor_realizado { get; set; }

    public bool validar(){
        if(conta == null)
            return false;

        if(valor_previsto == 0 & valor_realizado == 0)
            return false;

        return true;
    }

}
