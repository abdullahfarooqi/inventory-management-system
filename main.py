import pyodbc
conn = pyodbc.connect('Driver={SQL Server};'
                      'Server=DESKTOP-3JSJI2F;'
                      'Database=IMS;'
                      'Trusted_Connection=yes;')

cursor = conn.cursor()

role=input("Are you an employee(1) or admin(2)")
if role == '1':
    ad_menu=input ("1. Request an item\n"
                   "2. See Acquired items")
    if (ad_menu==1):
        choice=input("Enter item name")
if role== '2':
    ad_menu=input ("1. See list of requested items\n"
                   "2. See status of stock")
    if ad_menu=='1':
        cursor.execute("SELECT * FROM requests where status = 'Pending'")
        for row in cursor:
            print(row)
        req_choice=int(input ("Enter request id you want to approve"))
        cursor.execute(f"update requests set status ='Approved' where requestid={req_choice}")
        
        cursor.execute('SELECT * FROM requests')
        for row in cursor:
            print(row)

conn.commit()
conn.close()