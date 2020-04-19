import models as coneccion
d = coneccion.valida_loggin_est("CUCD161223HDFRRGA0", "NULL")
print(d[0][0])
f = coneccion.valida_loggin_prof("CACI730227MDFRRM05", "mamey.c.c@hotmail.com")
print(f[0][0])