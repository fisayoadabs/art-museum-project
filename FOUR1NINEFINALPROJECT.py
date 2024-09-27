import mysql.connector
from tabulate import tabulate

#Define admin user
def admin(username, passcode):
    cnx = mysql.connector.connect(
            host="127.0.0.1",
            port=3306,
            user=username,
            password= passcode)    
    # Get a cursor
    cur = cnx.cursor(buffered=True)

    # Getting the database the user wishes to use
    cur.execute("use artmuseum")
    print("Administrator was only created no actual functions run with it.")
    pass

#Define employee user
def data_entry(username, passcode):
    cnx = mysql.connector.connect(
            host="127.0.0.1",
            port=3306,
            user=username,
            password= passcode)    
    # Get a cursor
    cur = cnx.cursor(buffered=True)

    # Getting the database the user wishes to use
    cur.execute("use artmuseum")
    employeemain(cur)

#Define guest user 
def guest_view(username, passcode):
    cnx = mysql.connector.connect(
            host="127.0.0.1",
            port=3306,
            user=username,
            password= passcode)    
        # Get a cursor
    cur = cnx.cursor(buffered=True)

    # Getting the database the user wishes to use
    cur.execute("use artmuseum")
    guessmain(cur)


#Defined Insert function 
def insert(mice, tabval):
    mice.execute(f"select * from {tabval}")
    cols = mice.column_names
    values_list = []
    for i in range(len(cols)):
        ask = input(f"What is your {tabval} {cols[i]}? ")
        values_list.append(ask)
    values_list = tuple(values_list)
    mice.execute(f"insert into {tabval} values {values_list}")
    mice.commit()
    print("Insert successful")

#Defined Delete function 
def delete(mice, tabval):
    mice.execute(f"select * from {tabval}")
    cols = mice.column_names
    for i in range(len(cols)):
        print(cols[i], end='\t')
    ask = input("\nFrom the above please type out in the same format which column you would like to utilize in deleting the row? ")
    askvalue = input("What is the exact name/value under the column you have chosen to delete the row? ")
    if ask in cols:
        mice.execute(f"delete from {tabval} where {ask} = '{askvalue}'")
        mice.execute(f"select * from {tabval}")
        mice.commit()
        print("Delete successful")
    else:
        print("Delete unsuccessful")

#Defined update function
def update(mice, tabval): 
    mice.execute(f"select * from {tabval}")
    cols = mice.column_names
    for i in range(len(cols)):
        print(cols[i], end='\t')
    ask = input("\nFrom the above please type out in the same way you see above which column you wish to change along with their new values. Please add a comma between each column choosen. (Example Column Name = 'new value', column name 2 = 'new value 2') ")
    askvalue = input("What is the exact name/value under the column you have chosen to make changes to?(Example column name = 'Value') ")
    mice.execute(f"update {tabval} set {ask} where {askvalue}")
    mice.commit()
    print("Update successful")
   
#Defined alter function for admin
def alter(mice, tabval):
    ask = input("Would you like to add or drop or modify a column? ").lower()
    if(ask == 'drop'):
        tabval = input("What is the name of the column you are dropping? ")
        mice.execute(f"alter table {tabval} drop column {tabval}")
        mice.execute(f"select * from {tabval}")
        mice.commit()
    elif(ask == 'add'):
        askthree = input("What is the name of the column you are adding? ")
        askfour = input("What is the length of the string or integer of your column?(Ex: varchar(123), integer, varchar(123) not null) ")
        mice.execute(f"alter table {tabval} add {askthree} {askfour}")
        mice.execute(f"select * from {tabval}")
        mice.commit()
    elif(ask == 'modify'):
        askfive = input("What column datatype would you like to modify? ")
        asksix = input("What is the new datatype value?(Ex: varchar(123), integer, varchar(123) not null) ")
        mice.execute(f"alter table {tabval} modify column {askfive} {asksix}")
        mice.execute(f"select * from {tabval}")
        mice.commit()
    else:
        print('Invalid input. Restart')
        return()

#Defined display table function
def showtable(mice, tabval):
    askone = input("Would you like the table to display based on search?(Yes/No) ").lower()
    if (askone == 'yes' or askone == 'y'):
        print(f"Names of {tabval} columns:")
        mice.execute(f"select * from {tabval}")
        cols = mice.column_names
        for i in range(len(cols)):
            print(cols[i], end='\t')
        asktwo = input("\nWhat are your search conditions?(Example: Id_no = '0001' and Artist = 'George Gower') ")         
    askthree = input("Do you wish to order the table by an attribute?(Yes/No) ").lower()
    if (askthree == 'yes' or askthree == 'y'):
        askfour = input('What is your attribute name to order by? ') 
    if ((askthree == 'yes' or askthree == 'y') and (askone == 'yes' or askone == 'y')):
        mice.execute(f"select * from {tabval} where {asktwo} order by {askfour}")
        mice.commit()
    elif((askthree =='no' or askthree == 'n') and (askone == 'yes' or askone == 'y')):
        mice.execute(f"select * from {tabval} where {asktwo}")
        mice.commit()
    elif((askthree =='no' or askthree == 'n') and (askone == 'no' or askone == 'n')):
        mice.execute(f"select * from {tabval}")
        mice.commit()
    elif((askthree == 'yes' or askthree == 'y') and (askone == 'no' or askone == 'n')):
        mice.execute(f"select * from {tabval} order by {askfour}")
        mice.commit() 
    row = mice.fetchall()
    print(tabulate(row, headers = mice.column_names))

#Defined options of update, delete, insert, alter and display the tables.
def options(mice, table):
    opask = input("What would you like to do?\na-Insert\nb-Delete\nc-Update\nd-Show Table\ne-Go back/Undo\n").lower()

    if(opask == 'a' or opask == 'insert'):
        print("Welcome to Insert")
        insert(mice, table)
    elif(opask == 'b' or opask == 'delete'):
        print("Welcome to Delete")
        delete(mice, table)
    elif(opask == 'c' or opask == 'update'):
        print("Welcome to Update")
        update(mice, table)
    elif(opask == 'd' or opask == 'show table' or opask == 'showtable'):
        showtable(mice, table)
    elif(opask == 'e' or opask == 'go back' or opask == 'undo' or opask == 'goback/undo' or opask == 'go back/undo' or opask == 'goback'):
        return()

#Define guess menu
def guessmain(cur):

    while(True): #While loop to keep asking user for input
        firstask = input("\nWelcome to the main menu. Where would you like to browse?\n1-ART OBJECTS\n2-ARTISTS\n3-EXHIBITIONS\n4-COLLECTIONS\n5-DISPLAYS\n6-PAINTINGS\n7-SCULPTURES/STATUES\n8-OTHERS\n9-PERMANENT COLLECTIONS\n10-BORROWED\n11-EXIT\n").lower()
       
        if(firstask == '11' or firstask == 'exit'):
            break
        elif(firstask == '1' or firstask == 'art objects' or firstask == 'artobjects'):
           tablewanted = 'art_object'
           print('Art Object')
           showtable(cur, tablewanted)
        elif(firstask == '2' or firstask == 'artists'):
            tablewanted = 'artist'
            print('Artists')
            showtable(cur, tablewanted)
        elif(firstask == '3' or firstask == 'exhibitions'):
            tablewanted = 'exhibitions'
            print('Exhibitions')
            showtable(cur, tablewanted)
        elif(firstask == '4' or firstask == 'collections'):
            tablewanted = 'collections'
            print('Collections')
            showtable(cur, tablewanted)
        elif(firstask == '5' or firstask == 'displays'):
            tablewanted = 'displays'
            print('Displays')
            showtable(cur , tablewanted)
        elif(firstask == '6' or firstask == 'painting'):
            tablewanted = 'paintings'
            print('Paintings')
            showtable(cur, tablewanted)
        elif(firstask == '7' or firstask == 'sculptures/statues' or firstask == 'sculptures' or firstask == 'statues'):
            tablewanted = 'sculpture_statue'
            print('Sculptures/Statues')
            showtable(cur, tablewanted)
        elif(firstask == '8' or firstask == 'other'):
            tablewanted = 'other'
            print('Others')
            showtable(cur, tablewanted)
        elif(firstask == '9' or firstask == 'permanentcollections' or firstask == 'permanent collections'):
            tablewanted = 'permanent_collection'
            print('Permanent Collection')
            showtable(cur, tablewanted)
        elif(firstask == '10' or firstask == 'borrowed'):
            tablewanted = 'borrowed'
            print('Borrowed') 
            showtable(cur, tablewanted)

def employeemain(cur):

    while(True): #While loop to keep asking user for input
        table_list = ['artist', 'art_object', 'exhibitions', 'collections', 'displays', 'paintings', 'sculpture_statue', 'other', 'permanent_collection', 'borrowed']
        print("\nWelcome to the editor menu. What table would you like to edit?\nART_OBJECT\nARTIST\nEXHIBITIONS\nCOLLECTIONS\nDISPLAYS\nPAINTINGS\nSCULPTURE_STATUE\nOTHER\nPERMANENT_COLLECTION\nBORROWED\nEnter exit to signout\n")
    
        tableask = input("Type your table here: ").lower()

        if(tableask in table_list):
            options(cur, tableask)
        elif(tableask == 'exit'):
            break
    print("Successfully signed out!")
if __name__ == '__main__':
    while(True):
        # Connect to server
        print("\nWelcome to the Art Museum Database:")
        print("In order to proceed please select your role from the list below:")
        print("1-DataBase Admin")
        print("2-Data Entry")
        print("3-Browse as guest")
        print("4-Leave Database")

        selection = input("Please type 1, 2, or 3 to select your role: ")
     
        if(selection == '1'):
            username= input("What is administrator username:")
            passcode= input("What is administrator password:")
            admin(username, passcode)
        elif(selection == '2'):
            username= input("What is your work username:")
            passcode= input("What is your work password:")
            data_entry(username, passcode)
        elif(selection == '3'):
            username="guest"
            passcode=None
            guest_view(username, passcode)
        elif(selection == '4'):
            print('Thank you for using Art Museum Database. Goodbye!')
            break
        else:
            print("Invalid entry please try again\n")
