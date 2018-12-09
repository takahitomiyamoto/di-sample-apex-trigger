/*******************************************************
 * Name: CommonTriggerHandlerTest.cls
 * Description: Test class for CommonTriggerHandler
 ********************************************************/
@isTest(SeeAllData=false)
private class CommonTriggerHandlerTest {

  private class CommonTriggerObserverMock implements ITriggerObserver {

    private CommonTriggerHandler handler;

    public CommonTriggerObserverMock() {}

    public ITriggerObserver getTriggerObserver(CommonTriggerHandler handler) {
      this.handler = handler;
      return (ITriggerObserver)this;
    }

    public void onBeforeInsert() {}
    public void onBeforeUpdate() {}
    public void onBeforeDelete() {}
    public void onAfterInsert() {}
    public void onAfterUpdate() {}
    public void onAfterDelete() {}
    public void onAfterUndelete() {}
  }

  // NOTE: you can use any sObject, such as Account
  private static final String SOBJECT_NAME_ACCOUNT = Account.class.getName();

  @testSetup static void setup() {
    CommonTestUtils.insertNormalAccounts();
  }

  @isTest static void isRecursive_Undelete() {
    List<Account> accounts = CommonTestUtils.selectAccounts();

    Test.startTest();
    CommonTestUtils.deleteAccounts(accounts);
    CommonTestUtils.undeleteAccounts(accounts);
    Test.stopTest();
  }

  @isTest static void invoke_BeforeUpdate() {
    List<Account> accounts = CommonTestUtils.selectAccounts();

    Test.startTest();
    CommonTestUtils.updateAccounts(accounts);
    Test.stopTest();
  }

  @isTest static void invoke_catchException() {
    Test.startTest();
    CommonTestUtils.insertAbnormalAccounts();
    Test.stopTest();
  }

  @isTest static void onBeforeInsert() {
    CommonTriggerHandler handler = new CommonTriggerHandler(SOBJECT_NAME_ACCOUNT);
    ITriggerObserver triggerObserver = (ITriggerObserver)CommonTriggerObserverMock.class.newInstance();
    handler.beforeInsertObservers.add(triggerObserver);

    Test.startTest();
    handler.onBeforeInsert();
    Test.stopTest();
  }

  @isTest static void onBeforeUpdate() {
    CommonTriggerHandler handler = new CommonTriggerHandler(SOBJECT_NAME_ACCOUNT);
    ITriggerObserver triggerObserver = (ITriggerObserver)CommonTriggerObserverMock.class.newInstance();
    handler.beforeUpdateObservers.add(triggerObserver);

    Test.startTest();
    handler.onBeforeUpdate();
    Test.stopTest();
  }

  @isTest static void onBeforeDelete() {
    CommonTriggerHandler handler = new CommonTriggerHandler(SOBJECT_NAME_ACCOUNT);
    ITriggerObserver triggerObserver = (ITriggerObserver)CommonTriggerObserverMock.class.newInstance();
    handler.beforeDeleteObservers.add(triggerObserver);

    Test.startTest();
    handler.onBeforeDelete();
    Test.stopTest();
  }

  @isTest static void onAfterInsert() {
    CommonTriggerHandler handler = new CommonTriggerHandler(SOBJECT_NAME_ACCOUNT);
    ITriggerObserver triggerObserver = (ITriggerObserver)CommonTriggerObserverMock.class.newInstance();
    handler.afterInsertObservers.add(triggerObserver);

    Test.startTest();
    handler.onAfterInsert();
    Test.stopTest();
  }

  @isTest static void onAfterUpdate() {
    CommonTriggerHandler handler = new CommonTriggerHandler(SOBJECT_NAME_ACCOUNT);
    ITriggerObserver triggerObserver = (ITriggerObserver)CommonTriggerObserverMock.class.newInstance();
    handler.afterUpdateObservers.add(triggerObserver);

    Test.startTest();
    handler.onAfterUpdate();
    Test.stopTest();
  }

  @isTest static void onAfterDelete() {
    CommonTriggerHandler handler = new CommonTriggerHandler(SOBJECT_NAME_ACCOUNT);
    ITriggerObserver triggerObserver = (ITriggerObserver)CommonTriggerObserverMock.class.newInstance();
    handler.afterDeleteObservers.add(triggerObserver);

    Test.startTest();
    handler.onAfterDelete();
    Test.stopTest();
  }

  @isTest static void onAfterUndelete() {
    CommonTriggerHandler handler = new CommonTriggerHandler(SOBJECT_NAME_ACCOUNT);
    ITriggerObserver triggerObserver = (ITriggerObserver)CommonTriggerObserverMock.class.newInstance();
    handler.afterUndeleteObservers.add(triggerObserver);

    Test.startTest();
    handler.onAfterUndelete();
    Test.stopTest();
  }

  @isTest static void addObserver() {
    CommonTriggerHandler handler = new CommonTriggerHandler(SOBJECT_NAME_ACCOUNT);
    ITriggerObserver triggerObserver = (ITriggerObserver)CommonTriggerObserverMock.class.newInstance();
    List<System.TriggerOperation> triggerOperations = new List<System.TriggerOperation>{
      System.TriggerOperation.BEFORE_INSERT,
      System.TriggerOperation.BEFORE_UPDATE,
      System.TriggerOperation.BEFORE_DELETE,
      System.TriggerOperation.AFTER_INSERT,
      System.TriggerOperation.AFTER_UPDATE,
      System.TriggerOperation.AFTER_DELETE,
      System.TriggerOperation.AFTER_UNDELETE
    };

    Test.startTest();
    handler.addObserver(triggerOperations, triggerObserver);
    Test.stopTest();
  }

  @isTest static void createTriggerObserver_NULL() {
    CommonTriggerHandler handler = new CommonTriggerHandler(SOBJECT_NAME_ACCOUNT);

    Test.startTest();
    ITriggerObserver triggerObserver = handler.createTriggerObserver(null);
    Test.stopTest();

    System.assertEquals(null, triggerObserver);
  }

  @isTest static void isRecursive_NonFirstRun() {
    CommonTriggerHandler handler = new CommonTriggerHandler(SOBJECT_NAME_ACCOUNT);

    Test.startTest();
    CommonTriggerHandler.firstRun = false;
    Boolean isRecursive = handler.isRecursive();
    Test.stopTest();

    System.assertEquals(true, isRecursive);
  }

  @isTest static void invoke_isRecursive() {
    CommonTriggerHandler handler = new CommonTriggerHandler(SOBJECT_NAME_ACCOUNT);

    Test.startTest();
    CommonTriggerHandler.firstRun = false;
    handler.invoke();
    Test.stopTest();
  }

}