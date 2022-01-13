import re

###Usuario:
def getuser(cadean):
	user = (re.findall('://.{14}:',cadean))
	user = str(user[0])
	user = user.replace('//','')
	user = user.replace(':','')
	return (user)
##Password
def getpass(cadean):
	password =(re.findall(':.{64}@',cadean))
	password =str(password[0])
	password = password.replace(':', '')
	password = password.replace('@', '')
	return (password)
##Host
def gethost(cadean):
	Host = (re.findall('@.{42}|@.{41}',cadean))
	Host = str(Host[0])
	Host = Host.replace('@', '')
	Host = Host.replace(':', '')
	return (Host)
##Puerto
def getport(cadean):
	Port = (re.findall(':[0-9]{4}/',cadean))
	Port = str(Port[0])
	Port = Port.replace(':','')
	Port = Port.replace('/', '')
	return (Port)
###NombreBAse
def getdbname(cadean):
	cadean = cadean + " "
	dbname = (re.findall('/.{14} ',cadean))
	dbname = str(dbname[0])
	dbname = dbname.replace(' ','')
	dbname = dbname.replace('/','')
	return (dbname)

