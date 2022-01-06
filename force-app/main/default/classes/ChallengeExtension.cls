public class ChallengeExtension {
    private ApexPages.StandardSetController pageSetController;
    private ApexPages.StandardController pageController;

    private Account pageAccount;
    private String currentSelection = '';

    // Constructors
    public ChallengeExtension(ApexPages.StandardController controller) {
        pageController = controller;
        if (pageController.getRecord() != null) {
            pageAccount = (Account)pageController.getRecord();
        }
        else {
            pageAccount = DefaultRecord(0);
        }
    }
    public ChallengeExtension(ApexPages.StandardSetController controller) {
        pageSetController = controller;
        if (pageSetController.getRecords().size() == 0) {
            pageSetController.setSelected(DefaultRecords(45, 0));
            pageAccount = (Account)pageSetController.getRecord();
        }
        else {
            pageAccount = DefaultRecord(0);
        }
    }
    // Constructor helper
    private List<Account> DefaultRecords(Integer maxSize, Integer offset) {
        return [SELECT name FROM Account LIMIT :maxSize OFFSET :offset];
    }
    // Constructor helper
    private Account DefaultRecord(Integer offset) {
        return [SELECT name FROM Account LIMIT 1 OFFSET :offset];
    }

    // Apex Controller Methods
    public String getGreeting() {
        return 'Hello, ' + pageAccount.name + '! You\'re our favorite customer.';
    }
    private String alertName = '';
    public void MyAction() {
        if (alertName == '') {
            alertName = 'Alert: Your name is ' + pageAccount.name;
        } else {
            alertName = '';
        }
    }
    public String getMessage() {
        return alertName;
    }
}
