public class Challenge4Controller {
    private final Integer ACCOUNT_OFFSET = 40;

    public Account staticAccount {get; set;}
    
    public Challenge4Controller() {
        staticAccount = [SELECT name, phone, website FROM Account LIMIT 1 OFFSET :ACCOUNT_OFFSET];
    }
}
