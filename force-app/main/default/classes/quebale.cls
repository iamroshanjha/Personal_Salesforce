public class quebale implements System.Queueable {
    public Account acc;
    public quebale(Account acc)
    {
        this.acc = acc;
    }
    public void execute(System.QueueableContext qc)
    {
          acc.name='Roshan';
          update acc;
        

    }
}