import numpy as np
import databaseAccess as dbAccess

#connection = ('/@latread',)
connection = ('/@asp',)

def apply(sql, cursorFunc=dbAccess.nullFunc, connection=connection, args=None):
    return dbAccess.apply(sql, cursorFunc, connection, args)

sep = 1.
ra, dec = 275.21716667, -28.37041667

ra_min = ra - sep/np.cos(np.pi*dec)
ra_max = ra + sep/np.cos(np.pi*dec)
print ra_min, ra_max
dec_min = dec - 1
dec_max = dec + 1

sql = "select * from glast_asp.pointsources where RA<%(ra_max).3f and RA>%(ra_min).3f and DEC<-27.37 and DEC>-29.37" % locals()
print sql

func = lambda curs : [entry for entry in curs]

foo = apply(sql, func)

print foo

sql = "select distinct SOURCE_TYPE from glast_asp.pointsources"
foo = apply(sql, func)
print foo
