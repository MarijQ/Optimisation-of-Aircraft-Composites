# -*- coding: mbcs -*-
#
# Abaqus/CAE Release 2020 replay file
# Internal Version: 2019_09_13-18.49.31 163176
# Run by Marij on Sun May 24 16:13:45 2020
#

# from driverUtils import executeOnCaeGraphicsStartup
# executeOnCaeGraphicsStartup()
#: Executing "onCaeGraphicsStartup()" in the site directory ...
from abaqus import *
from abaqusConstants import *
session.Viewport(name='Viewport: 1', origin=(0.0, 0.0), width=261.657806396484, 
    height=172.659271240234)
session.viewports['Viewport: 1'].makeCurrent()
session.viewports['Viewport: 1'].maximize()
from caeModules import *
from driverUtils import executeOnCaeStartup
executeOnCaeStartup()
session.viewports['Viewport: 1'].partDisplay.geometryOptions.setValues(
    referenceRepresentation=ON)
openMdb(pathName='D:/FYP SIMS/WorkDir/Abaqus/panel.cae')
#* IOError: D:/FYP SIMS/WorkDir/Abaqus/panel.cae: No such file or directory
openMdb(pathName='D:/Google Drive/4th Year/FYP/SIMULATIONS/Abaqus/panel.cae')
#: The model database "D:\Google Drive\4th Year\FYP\SIMULATIONS\Abaqus\panel.cae" has been opened.
session.viewports['Viewport: 1'].setValues(displayedObject=None)
p = mdb.models['panel'].parts['plate']
session.viewports['Viewport: 1'].setValues(displayedObject=p)
a = mdb.models['panel'].rootAssembly
session.viewports['Viewport: 1'].setValues(displayedObject=a)
session.viewports['Viewport: 1'].assemblyDisplay.setValues(
    optimizationTasks=OFF, geometricRestrictions=OFF, stopConditions=OFF)
session.viewports['Viewport: 1'].view.setValues(session.views['Front'])
session.viewports['Viewport: 1'].view.setProjection(projection=PARALLEL)
session.viewports['Viewport: 1'].assemblyDisplay.setValues(
    renderShellThickness=ON)
session.viewports['Viewport: 1'].view.setValues(width=289.956, height=144.364, 
    cameraPosition=(-4.45995, 18.6773, 1601.59), cameraTarget=(-4.45995, 
    18.6773, 300))
session.viewports['Viewport: 1'].view.setValues(cameraPosition=(-6.46718, 
    19.2242, 1601.59), cameraTarget=(-6.46718, 19.2242, 300))
session.viewports['Viewport: 1'].view.setValues(session.views['Iso'])
session.viewports['Viewport: 1'].view.setValues(session.views['Front'])
session.viewports['Viewport: 1'].view.setValues(movieMode=ON)
session.viewports['Viewport: 1'].view.setValues(movieMode=OFF)
session.viewports['Viewport: 1'].assemblyDisplay.meshOptions.setValues(
    meshVisibleEdges=FEATURE)
session.viewports['Viewport: 1'].assemblyDisplay.meshOptions.setValues(
    meshVisibleEdges=FREE)
session.viewports['Viewport: 1'].assemblyDisplay.meshOptions.setValues(
    meshVisibleEdges=ALL)
session.viewports['Viewport: 1'].assemblyDisplay.meshOptions.setValues(
    meshVisibleEdges=EXTERIOR)
session.viewports['Viewport: 1'].assemblyDisplay.meshOptions.setValues(
    meshEdgesInShaded=OFF)
session.viewports['Viewport: 1'].assemblyDisplay.meshOptions.setValues(
    meshEdgesInShaded=ON)
session.viewports['Viewport: 1'].setValues(displayedObject=None)
session.viewports['Viewport: 1'].setValues(displayedObject=None)
