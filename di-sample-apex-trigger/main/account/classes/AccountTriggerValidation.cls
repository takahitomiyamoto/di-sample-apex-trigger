/**************************************************
 * Name: AccountTriggerValidation.cls
 * Description: Validation for Account trigger
 **************************************************/
public with sharing class AccountTriggerValidation implements ITriggerObserver {

  // Custom Exception
  private class CommonException extends Exception {}

  // Constants
  private static final System.loggingLevel LOGGING_LEVEL_DEFAULT = CommonLogger.LOGGING_LEVEL_DEFAULT;
  private static final String CLASS_NAME = AccountTriggerValidation.class.getName();
  private static final String ERROR_MESSAGE_PHONE_REQUIRED = AccountConstants.ERROR_MESSAGE_PHONE_REQUIRED;

  // Logger Variable
  private final CommonLogger logger = CommonLogger.getInstance();

  // Class Variables
  private static String methodName;

  // Instance Variables
  private AccountTriggerHandler handler;

  /**************************************************
   * Name: AccountTriggerValidation
   * Description: Constructor with some parameters
   *
   * @param  BaseTriggerHandler handler
   * @return AccountTriggerValidation
   **************************************************/
  @TestVisible
  private AccountTriggerValidation(BaseTriggerHandler handler) {
    methodName = 'AccountTriggerValidation';

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
    AccountTriggerValidation validation = new AccountTriggerValidation(handler);
    return (ITriggerObserver)validation;
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

    this.validatePhone(handler.newAccounts);
  }

  /*******************************************************
   * Name: onBeforeUpdate
   * Description: Custom action in case of before update
   *
   * @param  null
   * @return void
   ********************************************************/
  public void onBeforeUpdate() {
    methodName = 'onBeforeUpdate';

    this.validatePhone(handler.newAccounts);
  }

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

  /********************************************************************************
   * Name: validatePhone
   * Description: Fax(FAX)項目に値が入っており、かつ電話(Phone)項目に値が入っていない場合は
   * 「FAXが入っている場合は電話番号も入力してください」というエラーにする。
   *
   * @param  List<Account> accounts
   * @return void
   ********************************************************************************/
  private void validatePhone(List<Account> accounts) {
    methodName = 'validatePhone';

    for (Account a : accounts) {
      Boolean hasFax = String.isNotEmpty(a.Fax);
      Boolean hasPhone = String.isNotEmpty(a.Phone);

      logger.stackDebugLog(LOGGING_LEVEL_DEFAULT, CLASS_NAME, methodName, 'hasFax: ' + hasFax);
      logger.stackDebugLog(LOGGING_LEVEL_DEFAULT, CLASS_NAME, methodName, 'hasPhone: ' + hasPhone);

      if (hasFax && !hasPhone) {
        a.Phone.addError(ERROR_MESSAGE_PHONE_REQUIRED);
        throw new CommonException(ERROR_MESSAGE_PHONE_REQUIRED);
      }
    }
  }

}
