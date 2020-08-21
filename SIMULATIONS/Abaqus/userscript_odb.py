"""
userscript_odb.py

"""
#
#from abaqus import *
from abaqusConstants import *
import odbAccess
from odbAccess import *
import __main__
import operator
import sys
import math

# Open .odb results file
odbName = 'panel.odb'
myOdb = openOdb(odbName,readOnly=True)

mode=myOdb.steps['buckle'].frames[1].mode
desc=myOdb.steps['buckle'].frames[1].description

# Write the angle in the output parameters file
paramsFile = open ('user_params.txt','w')
paramsFile.write('Eigval'+'\t'+ str(desc[30:]))
paramsFile.close()