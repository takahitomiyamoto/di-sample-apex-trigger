/**************************************************
 * Name: AccountTriggerService.cls
 * Description: Service for Account trigger
 **************************************************/
public with sharing class AccountTriggerService implements ITriggerObserver {

  // Custom Exception
  private class CommonException extends Exception {}

  // Constants
  private static final System.loggingLevel LOGGING_LEVEL_DEFAULT = CommonLogger.LOGGING_LEVEL_DEFAULT;
  private static final String CLASS_NAME = AccountTriggerService.class.getName();
  private static final String NAME_PREFIX_SAMPLE = AccountConstants.NAME_PREFIX_SAMPLE;

  // Logger Variable
  private final CommonLogger logger = CommonLogger.getInstance();

  // Class Variables
  private static String methodName;

  // Instance Variables
  private AccountTriggerHandler handler;

  /**************************************************
   * Name: AccountTriggerService
   * Description: Constructor with some parameters
   *
   * @param  BaseTriggerHandler handler
   * @return AccountTriggerService
   **************************************************/
  @TestVisible
  private AccountTriggerService(BaseTriggerHandler handler) {
    methodName = 'AccountTriggerService';

    this.handler = (AccountTriggerHandler)handler;
  }

  /**************************************************
   * Name: getInstance
   * Description: Get Instance with some parameters
   *
   * @param  BaseTriggerHandler handler
   * @return ITriggerObserver
   **************************************************/
  public static ITriggerObserver getInstance(BaseTriggerHandler handler) {
    AccountTriggerService service = new AccountTriggerService(handler);
    return (ITriggerObserver)service;
  }

  /*******************************************************
   * Name: onBeforeInsert
   * Description: Custom action in case of before insert
   *
   * @param  null
   * @return void
   ********************************************************/
  public void onBeforeInsert() {
    methodName = 'onBeforeInsert';

    this.addPrefixToName(handler.newAccounts);
  }

  /*******************************************************
   * Name: onBeforeUpdate
   * Description: Custom action in case of before update
   *
   * @param  null
   * @return void
   * @deprecated
   ********************************************************/
  public void onBeforeUpdate() {}

  /*******************************************************
   * Name: onBeforeDelete
   * Description: Custom action in case of before delete
   *
   * @param  null
   * @return void
   * @deprecated
   ********************************************************/
  public void onBeforeDelete() {}

  /*******************************************************
   * Name: onAfterInsert
   * Description: Custom action in case of after insert
   *
   * @param  null
   * @return void
   * @deprecated
   ********************************************************/
  public void onAfterInsert() {}

  /*******************************************************
   * Name: onAfterUpdate
   * Description: Custom action in case of after update
   *
   * @param  null
   * @return void
   * @deprecated
   ********************************************************/
  public void onAfterUpdate() {}

  /*******************************************************
   * Name: onAfterDelete
   * Description: Custom action in case of after delete
   *
   * @param  null
   * @return void
   * @deprecated
   ********************************************************/
  public void onAfterDelete() {}

  /*******************************************************
   * Name: onAfterUndelete
   * Description: Custom action in case of after undelete
   *
   * @param  null
   * @return void
   * @deprecated
   ********************************************************/
  public void onAfterUndelete() {}

  /*****************************************************************
   * Name: addPrefixToName
   * Description: 取引先名(Name)項目の先頭に[サンプル]という文字列を付ける。
   *
   * @param  List<Account> accounts
   * @return void
   *****************************************************************/
  private void addPrefixToName(List<Account> accounts) {
    methodName = 'addPrefixToName';

    for (Account a : accounts) {
      a.Name = NAME_PREFIX_SAMPLE + a.Name;
      logger.stackDebugLog(LOGGING_LEVEL_DEFAULT, CLASS_NAME, methodName, 'Name: ' + a.Name);
    }
  }

}
