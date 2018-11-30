
/*******************************************************
 * Name: ITriggerObserver.cls
 * Description: Interface for all trigger observers
 *******************************************************/
public interface ITriggerObserver {
  ITriggerObserver getTriggerObserver(CommonTriggerHandler handler);
  void onBeforeInsert();
  void onBeforeUpdate();
  void onBeforeDelete();
  void onAfterInsert();
  void onAfterUpdate();
  void onAfterDelete();
  void onAfterUndelete();
}