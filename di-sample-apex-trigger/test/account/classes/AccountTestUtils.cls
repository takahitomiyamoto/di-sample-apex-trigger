/*******************************************************
 * Name: AccountTestUtils.cls
 * Description: Create test data for Account
 ********************************************************/
@isTest(SeeAllData=false)
public without sharing class AccountTestUtils {

  public static List<Account> createAccounts() {
    List<Account> accounts = new List<Account>();

    Account account0 = new Account();
    account0.Name = 'Account0';
    accounts.add(account0);

    Account account1 = new Account();
    account1.Name = 'Account1';
    account1.Fax = '03-1234-5678';
    account1.Phone = '';
    accounts.add(account1);

    return accounts;
  }

  public static void insertAccounts() {
    List<Account> accounts = AccountTestUtils.createAccounts();
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
