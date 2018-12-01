/**************************************************
 * Name: CommonTriggerHandler.cls
 * Description: Base class for all triggers
 **************************************************/
// public abstract class CommonTriggerHandler {
public without sharing class CommonTriggerHandler {

  // Custom Exception
  private class CommonException extends Exception {}

  // Constants
  private static final String CLASS_NAME = CommonTriggerHandler.class.getName();
  private static final System.loggingLevel LOGGING_LEVEL_DEFAULT = CommonLogger.LOGGING_LEVEL_DEFAULT;

  // Logger Variable
  private final CommonLogger logger = CommonLogger.getInstance();

  // Class Variables
  private static String methodName;
  public static Boolean firstRun = true;

  // Instance Variables
  public List<sObject> oldObjects;
  public List<sObject> newObjects;
  public Map<ID, sObject> oldObjectMap;
  public Map<ID, sObject> newObjectMap;
  private String sObjectName;
  private Boolean triggerIsExecuting;
  private Integer triggerSize;
  private System.TriggerOperation triggerOperationType;
  private List<ITriggerObserver> beforeInsertObservers = new List<ITriggerObserver>();
  private List<ITriggerObserver> beforeUpdateObservers = new List<ITriggerObserver>();
  private List<ITriggerObserver> beforeDeleteObservers = new List<ITriggerObserver>();
  private List<ITriggerObserver> afterInsertObservers = new List<ITriggerObserver>();
  private List<ITriggerObserver> afterUpdateObservers = new List<ITriggerObserver>();
  private List<ITriggerObserver> afterDeleteObservers = new List<ITriggerObserver>();
  private List<ITriggerObserver> afterUndeleteObservers = new List<ITriggerObserver>();

  /**************************************************
   * Name: CommonTriggerHandler
   * Description: Constructor with no parameter
   *
   * @param  none
   * @return CommonTriggerHandler
   **************************************************/
  public CommonTriggerHandler(String sObjectName) {
    methodName = 'CommonTriggerHandler';

    this.sObjectName = sObjectName;
    this.oldObjects = Trigger.old;
    this.newObjects = Trigger.new;
    this.oldObjectMap = Trigger.oldMap;
    this.newObjectMap = Trigger.newMap;
    this.triggerIsExecuting = Trigger.isExecuting;
    this.triggerSize = Trigger.size;
    this.triggerOperationType = Trigger.operationType;
  }

  /*******************************************************
   * Name: onBeforeInsert
   * Description: Custom action in case of before insert
   *
   * @param  null
   * @return void
   ********************************************************/
  @TestVisible
  private void onBeforeInsert() {
    methodName = 'onBeforeInsert';
    logger.stackDebugLog(LOGGING_LEVEL_DEFAULT, CLASS_NAME, methodName, 'beforeInsertObservers: ' + beforeInsertObservers.size());

    for (ITriggerObserver triggerObserver : beforeInsertObservers) {
      triggerObserver.onBeforeInsert();
    }
  }

  /*******************************************************
   * Name: onBeforeUpdate
   * Description: Custom action in case of before update
   *
   * @param  null
   * @return void
   ********************************************************/
  @TestVisible
  private void onBeforeUpdate() {
    methodName = 'onBeforeUpdate';
    logger.stackDebugLog(LOGGING_LEVEL_DEFAULT, CLASS_NAME, methodName, 'beforeUpdateObservers: ' + beforeUpdateObservers.size());

    for (ITriggerObserver triggerObserver : beforeUpdateObservers) {
      triggerObserver.onBeforeUpdate();
    }
  }

  /*******************************************************
   * Name: onBeforeDelete
   * Description: Custom action in case of before delete
   *
   * @param  null
   * @return void
   ********************************************************/
  @TestVisible
  private void onBeforeDelete() {
    methodName = 'onBeforeDelete';
    logger.stackDebugLog(LOGGING_LEVEL_DEFAULT, CLASS_NAME, methodName, 'beforeDeleteObservers: ' + beforeDeleteObservers.size());

    for (ITriggerObserver triggerObserver : beforeDeleteObservers) {
      triggerObserver.onBeforeDelete();
    }
  }

  /*******************************************************
   * Name: onAfterInsert
   * Description: Custom action in case of after insert
   *
   * @param  null
   * @return void
   ********************************************************/
  @TestVisible
  private void onAfterInsert() {
    methodName = 'onAfterInsert';
    logger.stackDebugLog(LOGGING_LEVEL_DEFAULT, CLASS_NAME, methodName, 'afterInsertObservers: ' + afterInsertObservers.size());

    for (ITriggerObserver triggerObserver : afterInsertObservers) {
      triggerObserver.onAfterInsert();
    }
  }

  /*******************************************************
   * Name: onAfterUpdate
   * Description: Custom action in case of after update
   *
   * @param  null
   * @return void
   ********************************************************/
  @TestVisible
  private void onAfterUpdate() {
    methodName = 'onAfterUpdate';
    logger.stackDebugLog(LOGGING_LEVEL_DEFAULT, CLASS_NAME, methodName, 'afterUpdateObservers: ' + afterUpdateObservers.size());

    for (ITriggerObserver triggerObserver : afterUpdateObservers) {
      triggerObserver.onAfterUpdate();
    }
  }

  /*******************************************************
   * Name: onAfterDelete
   * Description: Custom action in case of after delete
   *
   * @param  null
   * @return void
   * @deprecated
   ********************************************************/
  @TestVisible
  private void onAfterDelete() {
    methodName = 'onAfterDelete';
    logger.stackDebugLog(LOGGING_LEVEL_DEFAULT, CLASS_NAME, methodName, 'afterDeleteObservers: ' + afterDeleteObservers.size());

    for (ITriggerObserver triggerObserver : afterDeleteObservers) {
      triggerObserver.onAfterDelete();
    }
  }

  /*******************************************************
   * Name: onAfterUndelete
   * Description: Custom action in case of after undelete
   *
   * @param  null
   * @return void
   * @deprecated
   ********************************************************/
  @TestVisible
  private void onAfterUndelete() {
    methodName = 'onAfterUndelete';
    logger.stackDebugLog(LOGGING_LEVEL_DEFAULT, CLASS_NAME, methodName, 'afterUndeleteObservers: ' + afterUndeleteObservers.size());

    for (ITriggerObserver triggerObserver : afterUndeleteObservers) {
      triggerObserver.onAfterUndelete();
    }
  }

  /************************************************************
   * Name: addObserver
   * Description: Add an observer
   *
   * @param  List<System.TriggerOperation> triggerOperations
   * @param  ITriggerObserver triggerObserver
   * @return void
   ************************************************************/
  public void addObserver(List<System.TriggerOperation> triggerOperations, ITriggerObserver triggerObserver){
    methodName = 'addObserver';

    for (System.TriggerOperation triggerOperation : triggerOperations) {
      switch on triggerOperation {
        when BEFORE_INSERT {
          beforeInsertObservers.add(triggerObserver);
        }
        when BEFORE_UPDATE {
          beforeUpdateObservers.add(triggerObserver);
        }
        when BEFORE_DELETE {
          beforeDeleteObservers.add(triggerObserver);
        }
        when AFTER_INSERT {
          afterInsertObservers.add(triggerObserver);
        }
        when AFTER_UPDATE {
          afterUpdateObservers.add(triggerObserver);
        }
        when AFTER_DELETE {
          afterDeleteObservers.add(triggerObserver);
        }
        // AFTER_UNDELETE
        when else {
          afterUndeleteObservers.add(triggerObserver);
        }
      }
    }
  }

  /*****************************************
   * Name: createTriggerObserver
   * Description: create TriggerObserver
   *
   * @param  System.Type apexClass
   * @return ITriggerObserver
   *****************************************/
  @TestVisible
  private ITriggerObserver createTriggerObserver(System.Type apexClass) {
    if (null == apexClass) {
      return null;
    } else {
      ITriggerObserver observer = (ITriggerObserver)apexClass.newInstance();
      return observer.getTriggerObserver(this);
    }
  }

  /***************************************************
   * Name: addActiveTriggerOperations
   * Description: Add some active TriggerOperations
   *
   * @param  Trigger_Observer__mdt triggerObserver
   * @return void
   ***************************************************/
  private void addActiveTriggerOperations(Trigger_Observer__mdt triggerObserver) {
    methodName = 'addActiveTriggerOperations';

    if (!triggerObserver.Active__c) {
      return;
    }

    List<System.TriggerOperation> activeTriggerOperation = new List<System.TriggerOperation>();

    if (triggerObserver.Before_Insert__c) {
      activeTriggerOperation.add(System.TriggerOperation.BEFORE_INSERT);
    }

    if (triggerObserver.Before_Update__c) {
      activeTriggerOperation.add(System.TriggerOperation.BEFORE_UPDATE);
    }

    if (triggerObserver.Before_Delete__c) {
      activeTriggerOperation.add(System.TriggerOperation.BEFORE_DELETE);
    }

    if (triggerObserver.After_Insert__c) {
      activeTriggerOperation.add(System.TriggerOperation.AFTER_INSERT);
    }

    if (triggerObserver.After_Update__c) {
      activeTriggerOperation.add(System.TriggerOperation.AFTER_UPDATE);
    }

    if (triggerObserver.After_Delete__c) {
      activeTriggerOperation.add(System.TriggerOperation.AFTER_DELETE);
    }

    if (triggerObserver.After_Undelete__c) {
      activeTriggerOperation.add(System.TriggerOperation.AFTER_UNDELETE);
    }

    if (triggerObserver.Test_Only__c) {
      return;
    }

    System.Type apexClass = System.Type.forName(triggerObserver.Apex_Class__c);
    ITriggerObserver activeTriggerObserver = this.createTriggerObserver(apexClass);
    this.addObserver(activeTriggerOperation, activeTriggerObserver);
  }

  /*******************************
   * Name: addObservers
   * Description: Add observers
   *
   * @param  String sObjectName
   * @return void
   *******************************/
  @TestVisible
  private void addObservers(String sObjectName) {
    methodName = 'addObservers';

    for (Trigger_Observer__mdt triggerObserver : [
      SELECT
        Id,
        DeveloperName,
        Object__c,
        Apex_Class__c,
        Test_Only__c,
        Active__c,
        Before_Insert__c,
        Before_Update__c,
        Before_Delete__c,
        After_Insert__c,
        After_Update__c,
        After_Delete__c,
        After_Undelete__c
      FROM
        Trigger_Observer__mdt
      WHERE
        Object__c = :sObjectName
      ORDER BY
        DeveloperName ASC
      LIMIT 50000
    ]) {
      this.addActiveTriggerOperations(triggerObserver);
    }
  }

  /************************************************************
   * Name: isRecursive
   * Description: Validate whether this is recursive or not
   *
   * @param  none
   * @return Boolean
   ************************************************************/
  private Boolean isRecursive() {
    methodName = 'isRecursive';
    logger.stackDebugLog(LOGGING_LEVEL_DEFAULT, CLASS_NAME, methodName, 'firstRun: ' + CommonTriggerHandler.firstRun);

    if (CommonTriggerHandler.firstRun) {
      return false;
    } else if (System.TriggerOperation.AFTER_UNDELETE === this.triggerOperationType) {
      return false;
    } else {
      return true;
    }
  }

  /********************************************************************************
   * Name: invoke
   * Description: Invoke each custom action depending on the Apex DML operations
   *
   * @param  none
   * @return void
   ********************************************************************************/
  public void invoke() {
    methodName = 'invoke';

    System.Savepoint savepoint = Database.setSavepoint();
    try {
      if (this.isRecursive()) {
        return;
      }

      this.addObservers(this.sObjectName);

      switch on Trigger.operationType {
        when BEFORE_INSERT {
          this.onBeforeInsert();
        }
        when BEFORE_UPDATE {
          this.onBeforeUpdate();
        }
        when BEFORE_DELETE {
          this.onBeforeDelete();
        }
        when AFTER_INSERT {
          this.onAfterInsert();
          CommonTriggerHandler.firstRun = false;
        }
        when AFTER_UPDATE {
          this.onAfterUpdate();
          CommonTriggerHandler.firstRun = false;
        }
        when AFTER_DELETE {
          this.onAfterDelete();
          CommonTriggerHandler.firstRun = false;
        }
        // AFTER_UNDELETE
        when else {
          this.onAfterUndelete();
          CommonTriggerHandler.firstRun = false;
        }
      }
    } catch (Exception e) {
      Database.rollback(savepoint);
      logger.stackDebugLog(LoggingLevel.ERROR, CLASS_NAME, methodName, CommonErrorUtils.createErrorMessage(e));
    } finally {
      logger.fetchDebugLogs();
    }
  }

}
