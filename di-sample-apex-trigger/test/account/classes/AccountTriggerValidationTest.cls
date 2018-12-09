/*******************************************************
 * Name: AccountTriggerValidationTest.cls
 * Description: Test class for AccountTriggerValidation
 ********************************************************/
@isTest(SeeAllData=false)
private class AccountTriggerValidationTest {

  private static final String SOBJECT_NAME_ACCOUNT = Account.class.getName();

  @testSetup static void setup() {
    AccountTestUtils.insertNormalAccounts();
    AccountTestUtils.insertAbnormalAccounts();
  }

  @isTest static void onBeforeInsert() {
    AccountTriggerValidation validation = new AccountTriggerValidation();

    Test.startTest();
    validation.onBeforeInsert();
    Test.stopTest();
  }

  @isTest static void onBeforeUpdate() {
    AccountTriggerValidation validation = new AccountTriggerValidation();

    Test.startTest();
    validation.onBeforeUpdate();
    Test.stopTest();
  }

  @isTest static void onBeforeDelete() {
    AccountTriggerValidation validation = new AccountTriggerValidation();

    Test.startTest();
    validation.onBeforeDelete();
    Test.stopTest();
  }

  @isTest static void onAfterInsert() {
    AccountTriggerValidation validation = new AccountTriggerValidation();

    Test.startTest();
    validation.onAfterInsert();
    Test.stopTest();
  }

  @isTest static void onAfterUpdate() {
    AccountTriggerValidation validation = new AccountTriggerValidation();

    Test.startTest();
    validation.onAfterUpdate();
    Test.stopTest();
  }

  @isTest static void onAfterDelete() {
    AccountTriggerValidation validation = new AccountTriggerValidation();

    Test.startTest();
    validation.onAfterDelete();
    Test.stopTest();
  }

  @isTest static void onAfterUndelete() {
    AccountTriggerValidation validation = new AccountTriggerValidation();

    Test.startTest();
    validation.onAfterUndelete();
    Test.stopTest();
  }

  @isTest static void onBeforeUpdate_validatePhone() {
    AccountTriggerValidation validation = new AccountTriggerValidation();
    CommonTriggerHandler handler = new CommonTriggerHandler(SOBJECT_NAME_ACCOUNT);
    ITriggerObserver triggerObserver = validation.getTriggerObserver(handler);
    handler.beforeUpdateObservers.add(triggerObserver);

    Test.startTest();
    validation.onBeforeUpdate();
    Test.stopTest();
  }

  @isTest static void validatePhone_Exception() {
    AccountTriggerValidation validation = new AccountTriggerValidation();
    List<Account> accounts = AccountTestUtils.selectAccounts();
    String message = '';

    Test.startTest();
    try {
      validation.validatePhone(accounts);
    } catch (Exception e) {
      message = CommonErrorUtils.createErrorMessage(e);
      System.assertNotEquals('', message);
    }
    Test.stopTest();
  }

}