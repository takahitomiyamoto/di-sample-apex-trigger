/**************************************************
 * Name: CommonTestUtils.cls
 * Description: Utilities class of Test for Common
 **************************************************/
@isTest(SeeAllData=false)
public without sharing class CommonTestUtils {

  private static List<Account> createNormalAccounts() {
    List<Account> accounts = new List<Account>();

    Account normalAccount0 = new Account();
    normalAccount0.Name = 'Normal Account 0';
    accounts.add(normalAccount0);

    return accounts;
  }

  private static List<Account> createAbnormalAccounts() {
    List<Account> accounts = new List<Account>();

    Account abnormalAccount0 = new Account();
    abnormalAccount0.Name = 'Abnormal Account 1';
    abnormalAccount0.Fax = '03-1234-5678';
    abnormalAccount0.Phone = '';
    accounts.add(abnormalAccount0);

    return accounts;
  }

  public static void insertNormalAccounts() {
    List<Account> accounts = CommonTestUtils.createNormalAccounts();
    Database.SaveResult[] results = Database.insert(accounts, false);
    for (Database.SaveResult result : results) {
      if (!result.isSuccess()) {
        Database.Error[] errors = result.getErrors();
        for (Database.Error error : errors) {
          System.debug(System.LoggingLevel.FINE, CommonErrorUtils.createErrorMessage(error));
        }
      }
    }
  }

  public static void insertAbnormalAccounts() {
    List<Account> accounts = CommonTestUtils.createAbnormalAccounts();
    Database.SaveResult[] results = Database.insert(accounts, false);
    for (Database.SaveResult result : results) {
      if (!result.isSuccess()) {
        Database.Error[] errors = result.getErrors();
        for (Database.Error error : errors) {
          System.debug(System.LoggingLevel.FINE, CommonErrorUtils.createErrorMessage(error));
        }
      }
    }
  }

  public static List<Account> selectAccounts() {
    List<Account> accounts = [
      SELECT
        Id,
        Name,
        Fax,
        Phone
      FROM
        Account
      ORDER BY
        Name ASC
      LIMIT 50000
    ];

    return accounts;
  }

  public static void updateAccounts(List<Account> accounts) {
    Database.SaveResult[] results = Database.update(accounts, false);
    for (Database.SaveResult result : results) {
      if (!result.isSuccess()) {
        Database.Error[] errors = result.getErrors();
        for (Database.Error error : errors) {
          System.debug(System.LoggingLevel.FINE, CommonErrorUtils.createErrorMessage(error));
        }
      }
    }
  }

  public static void deleteAccounts(List<Account> accounts) {
    Database.DeleteResult[] results = Database.delete(accounts, false);
    for (Database.DeleteResult result : results) {
      if (!result.isSuccess()) {
        Database.Error[] errors = result.getErrors();
        for (Database.Error error : errors) {
          System.debug(System.LoggingLevel.FINE, CommonErrorUtils.createErrorMessage(error));
        }
      }
    }
  }

  public static void undeleteAccounts(List<Account> accounts) {
    Database.UndeleteResult[] results = Database.undelete(accounts, false);
    for (Database.UndeleteResult result : results) {
      if (!result.isSuccess()) {
        Database.Error[] errors = result.getErrors();
        for (Database.Error error : errors) {
          System.debug(System.LoggingLevel.FINE, CommonErrorUtils.createErrorMessage(error));
        }
      }
    }
  }

}
