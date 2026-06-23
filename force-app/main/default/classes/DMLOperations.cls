public class DMLOperations {

    public static void executeDMLExamples() {

        //Single Record Insert
        Account acc1 = new Account();
        acc1.Name = 'TCS';
        insert acc1;


        //Single Record Insert (Data Assignment in Single Line)

        Account acc2 = new Account(
            Name = 'Infosys',
            Phone = '9876543210',
            Industry = 'IT'
        );
        insert acc2;


        //Single Record Update

        Account acc3 = [SELECT Id, Name FROM Account LIMIT 1];

        acc3.Name = 'Updated Account';
        update acc3;


        // Single Record Update (Data Assignment in Single Line)

        Account acc4 = new Account(
            Id = acc3.Id,
            Name = 'Single Line Updated Account'
        );

        update acc4;

        //Multiple Record Insertion

        List<Account> accListInsert = new List<Account>();

        accListInsert.add(new Account(
            Name = 'Wipro',
            Industry = 'IT'
        ));

        accListInsert.add(new Account(
            Name = 'HCL',
            Industry = 'Software'
        ));

        accListInsert.add(new Account(
            Name = 'Tech Mahindra',
            Industry = 'Technology'
        ));

        insert accListInsert;


        //Single Record Delete

        Account accDelete = [SELECT Id FROM Account LIMIT 1];

        delete accDelete;


        //Single Record Delete (Data Assignment in Single Line)

        Account accDeleteSingleLine =
            new Account(Id = acc2.Id);

        delete accDeleteSingleLine;

        //Multiple Record Updation

        List<Account> accListUpdate =
            [SELECT Id, Name FROM Account LIMIT 3];

        for(Account acc : accListUpdate) {

            acc.Name = acc.Name + ' Updated';
        }

        update accListUpdate;


        //Multiple Record Deletion

        List<Account> accListDelete =
            [SELECT Id FROM Account LIMIT 2];

        delete accListDelete;


        //Upsert Operation

        Account upsertAcc = new Account(
            Name = 'Upsert Account'
        );

        upsert upsertAcc;


        //Merge Operation

        Account masterAcc =
            new Account(Name = 'Master Account');

        Account duplicateAcc =
            new Account(Name = 'Duplicate Account');

        insert new List<Account>{masterAcc, duplicateAcc};

        merge masterAcc duplicateAcc;


        //Undelete Operation

        Account undeleteAcc =
            new Account(Name = 'Deleted Account');

        insert undeleteAcc;

        delete undeleteAcc;

        undelete undeleteAcc;

        //Database DML Methods

        //Database.insert();

        Account dbInsertAcc =
            new Account(Name = 'DB Insert');

        Database.SaveResult sr1 =
            Database.insert(dbInsertAcc);

		//Database.update();

        dbInsertAcc.Name = 'DB Updated';

        Database.SaveResult sr2 =
            Database.update(dbInsertAcc);


        //Database.delete();

        Database.DeleteResult dr1 =
            Database.delete(dbInsertAcc);


        //Database.upsert();

        Account dbUpsertAcc =
            new Account(Name = 'DB Upsert');

        Database.UpsertResult ur1 =
            Database.upsert(dbUpsertAcc);


        //Database.undelete();

        delete dbUpsertAcc;

        Database.UndeleteResult ur2 =
            Database.undelete(dbUpsertAcc);


        //Database.merge();

        Account dbMaster =
            new Account(Name = 'DB Master');

        Account dbDuplicate =
            new Account(Name = 'DB Duplicate');

        insert new List<Account>{dbMaster, dbDuplicate};

        Database.MergeResult mr =
            Database.merge(dbMaster, dbDuplicate);

		//Database.insert(); with allOrNone = false
        

        List<Account> dbInsertList =
            new List<Account>();

        dbInsertList.add(new Account(Name = 'Acc 1'));
        dbInsertList.add(new Account());

        Database.SaveResult[] saveResults =
            Database.insert(dbInsertList, false);

		//Database.update(); with allOrNone = false

        Database.SaveResult[] updateResults =
            Database.update(accListUpdate, false);

		//Database.delete(); with allOrNone = false

        Database.DeleteResult[] deleteResults =
            Database.delete(accListDelete, false);

        //Database.emptyRecycleBin()

        Account recycleAcc =
            new Account(Name = 'Recycle Bin Account');

        insert recycleAcc;

        delete recycleAcc;

        Database.emptyRecycleBin(recycleAcc);

    }
}