/***********************************
 * Name: AccountTrigger.trigger
 * Description: trigger for Account
 *
 * @param  before insert
 * @param  before update
 * @param  before delete
 * @param  after insert
 * @param  after update
 * @param  after delete
 * @param  after undelete
 * @return none
 ***********************************/
trigger AccountTrigger on Account(
  before insert,
  before update,
  before delete,
  after insert,
  after update,
  after delete,
  after undelete
) {

  BaseTriggerHandler handler = new AccountTriggerHandler();
  handler.invoke();

}