/**************************************************
 * Name: AccountTriggerHandler.cls
 * Description: Handler class for Account trigger
 **************************************************/
public without sharing class AccountTriggerHandler extends BaseTriggerHandler {

  // Custom Exception
  private class CommonException extends Exception {}

  // Constants
  private static final System.loggingLevel LOGGING_LEVEL_DEFAULT = CommonLogger.LOGGING_LEVEL_DEFAULT;
  private static final String CLASS_NAME = AccountTriggerHandler.class.getName();

  // Logger Variable
  private final CommonLogger logger = CommonLogger.getInstance();

  // Class Variables
  private static String methodName;

  // Instance Variables
  public List<Account> oldAccounts;
  public List<Account> newAccounts;
  public Map<ID, Account> oldAccountMap;
  public Map<ID, Account> newAccountMap;

  /*********************************************
   * Name: AccountTriggerHandler
   * Description: Constructor with no parameter
   *
   * @param  null
   * @return AccountTriggerHandler
   *********************************************/
  public AccountTriggerHandler() {
    super(Account.class.getName());
    methodName = 'AccountTriggerHandler';
    logger.stackDebugLog(LOGGING_LEVEL_DEFAULT, CLASS_NAME, methodName, 'Trigger.isExecuting: ' + this.triggerIsExecuting);
    logger.stackDebugLog(LOGGING_LEVEL_DEFAULT, CLASS_NAME, methodName, 'Trigger.size: ' + this.triggerSize);
    logger.stackDebugLog(LOGGING_LEVEL_DEFAULT, CLASS_NAME, methodName, 'Trigger.TriggerOperation: ' + this.TriggerOperationType);
    this.oldAccounts = (List<Account>)this.oldObjects;
    this.newAccounts = (List<Account>)this.newObjects;
    this.oldAccountMap = (Map<Id, Account>)this.oldObjectMap;
    this.newAccountMap = (Map<Id, Account>)this.newObjectMap;
  }

  /*********************************************
   * Name: createTriggerObserver
   * Description: create a TriggerObserver
   *
   * @param  System.Type apexClass
   * @return ITriggerObserver
   *********************************************/
  @TestVisible
  protected override ITriggerObserver createTriggerObserver(System.Type apexClass) {
    if (null == apexClass) {
      return null;
    } else if (AccountTriggerService.class.equals(apexClass)) {
      return AccountTriggerService.getInstance(this);
    } else if (AccountTriggerValidation.class.equals(apexClass)) {
      return AccountTriggerValidation.getInstance(this);
    } else {
      return null;
    }
  }

}
