public class Finux.SaldoInicial{
    public int id {get; set;}
    public double valor_previsto {get; set;}
    public double valor_realizado {get; set;}
    public string competencia {get; set;}
    public Caixa caixa {get; set;}

}

public class Finux.Valor{
    public double previsto {get; set;}
    public double realizado {get; set;}
}

public class Finux.Caixa{
    public int id {get; set;}
    public string competencia {get; set;}
    public Gee.List<Lancamento> _lancamentos = new Gee.ArrayList<Lancamento>();
    public SaldoInicial saldo_inicial {get; set;}

    public Gee.List<Lancamento>  lancamentos {
        get { return _lancamentos; }
        set { _lancamentos = value; }
    }

    public Valor calcular_total_entrada(){
        Valor valor = new Valor();

        foreach (Lancamento lan in lancamentos){
            if(lan.conta.fluxo == Fluxo.ENTRADA){
                valor.previsto += lan.valor_previsto;
                valor.realizado += lan.valor_realizado;
            }

        }

        return valor;
    }

    public Valor calcular_total_saida(){
        Valor valor = new Valor();

        foreach (Lancamento lan in lancamentos){
            if(lan.conta.fluxo == Fluxo.SAIDA){
                valor.previsto += lan.valor_previsto;
                valor.realizado += lan.valor_realizado;
            }

        }

        return valor;
    }


    public bool validar(){
        if(competencia == null | competencia == "")
            return false;

        if(saldo_inicial == null)
            return false;

        foreach(Lancamento lan in _lancamentos){
            if(lan.validar() == false)
                return false;
        }

        return true;
    }
}


public enum Finux.Fluxo{
    ENTRADA, SAIDA;

     public string to_string(){
        switch(this){
        case ENTRADA :
            return "Entrada";
        case SAIDA :
            return "Saida";
        }
        return "";
    }
}


public class Finux.Conta{
    public int id  { get; set; }
    public string descricao {get; set;}
    public Fluxo fluxo {get; set;}

    public bool validar(){
        if(descricao == null)
            return false;

        if (fluxo.to_string() == "")
            return false;

        return true;
    }

}

public class Finux.Lancamento{
    public int id {get; set;}
    public Caixa caixa {get; set;}
    public DateTime data { get; set; }
    public Conta conta { get; set; }
    public double valor_previsto { get; set; }
    public double valor_realizado { get; set; }

    public bool validar(){
        if(conta == null)
            return false;

        if(valor_previsto == 0 & valor_realizado == 0)
            return false;

        if(caixa == null)
            return false;

        if(conta.validar() == false)
            return false;

        return true;
    }

}
