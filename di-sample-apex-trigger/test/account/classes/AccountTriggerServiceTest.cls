/*******************************************************
 * Name: AccountTriggerServiceTest.cls
 * Description: Test class for AccountTriggerService
 ********************************************************/
@isTest(SeeAllData=false)
private class AccountTriggerServiceTest {

  private static final String SOBJECT_NAME_ACCOUNT = Account.class.getName();

  @testSetup static void setup() {
    AccountTestUtils.insertNormalAccounts();
    AccountTestUtils.insertAbnormalAccounts();
  }

  @isTest static void onBeforeInsert() {
    AccountTriggerService validation = new AccountTriggerService();

    Test.startTest();
    validation.onBeforeInsert();
    Test.stopTest();
  }

  @isTest static void onBeforeUpdate() {
    AccountTriggerService validation = new AccountTriggerService();

    Test.startTest();
    validation.onBeforeUpdate();
    Test.stopTest();
  }

  @isTest static void onBeforeDelete() {
    AccountTriggerService validation = new AccountTriggerService();

    Test.startTest();
    validation.onBeforeDelete();
    Test.stopTest();
  }

  @isTest static void onAfterInsert() {
    AccountTriggerService validation = new AccountTriggerService();

    Test.startTest();
    validation.onAfterInsert();
    Test.stopTest();
  }

  @isTest static void onAfterUpdate() {
    AccountTriggerService validation = new AccountTriggerService();

    Test.startTest();
    validation.onAfterUpdate();
    Test.stopTest();
  }

  @isTest static void onAfterDelete() {
    AccountTriggerService validation = new AccountTriggerService();

    Test.startTest();
    validation.onAfterDelete();
    Test.stopTest();
  }

  @isTest static void onAfterUndelete() {
    AccountTriggerService validation = new AccountTriggerService();

    Test.startTest();
    validation.onAfterUndelete();
    Test.stopTest();
  }

  @isTest static void addPrefixToName() {
    AccountTriggerService service = new AccountTriggerService();
    List<Account> accounts = null;

    Test.startTest();
    service.addPrefixToName(accounts);
    Test.stopTest();
  }

}