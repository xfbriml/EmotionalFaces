#Before experiment

from numpy.random import random, randint, normal, shuffle
import xlrd


Jitter = random() * (1.25 - 0.75) + 0.75

# Begin experiment

expNumber = 0

import xlrd #Version 1.2.0 or below
import random
import numpy as np  # whole numpy lib is available, prepend 'np.'
from numpy.random import random, randint, normal, shuffle, choice as randchoice

import xlrd #Version 1.2.0 or below
import random

#create Face Class to atribute an index to each file
class Face:
    def __init__(self, emotionFace, neutralFace, index):
        self.emotionFace = emotionFace
        self.neutralFace = neutralFace
        self.index = index
    def __repr__(self):
        return str(self.index)

#Open xlsx file.
in_file = './FacesList.xlsx'
inbook = xlrd.open_workbook(in_file)
insheet = inbook.sheet_by_index(0)

#num of study items
num_study = 200
num_new = 100

#arrays for our stimuli
faces = []
newFaces = []


#read the stimuli from our sheet
for excelRow in range(0,num_study):
    
    #read in the values of all columns on this row
    row = insheet.row_values(excelRow + 1)

    #Create instance of Face with both filename and index
    face = Face(row[0], row[5], row[10])
    
    #print row[0]
    #saving the word to word array
    faces.append(face)

print(faces)

random.shuffle(faces);
random.shuffle(newFaces);
insheet = inbook.sheet_by_index(1)


for excelRow in range (0,num_new):
    row = insheet.row_values(excelRow + 1)
    newFaces.append(row[0])


experimentSeries = []

sets = 10 # ce tinha falado de 12 blocos, mas só tem 200 caras???
facesPerSet = 20

for set in range(sets):
    currentSerie = []

    for face in range (facesPerSet):
        currentSerie.append(faces[(set * 20) + face])
       
    experimentSeries.append(currentSerie)


#Begin Routine Study

Jitter = random() * (1.25 - 0.75) + 0.75

#Begin Routine Study Trial

 expNumber = 0

import xlrd #Version 1.2.0 or below
import random
import numpy as np  # whole numpy lib is available, prepend 'np.'
from numpy.random import random, randint, normal, shuffle, choice as randchoice

import xlrd #Version 1.2.0 or below
import random

#create Face Class to atribute an index to each file
class Face:
    def __init__(self, emotionFace, neutralFace, index):
        self.emotionFace = emotionFace
        self.neutralFace = neutralFace
        self.index = index
    def __repr__(self):
        return str(self.index)

#Open xlsx file.
in_file = './FacesList.xlsx'
inbook = xlrd.open_workbook(in_file)
insheet = inbook.sheet_by_index(0)

#num of study items
num_study = 200
num_new = 100

#arrays for our stimuli
faces = []
newFaces = []


#read the stimuli from our sheet
for excelRow in range(0,num_study):
    
    #read in the values of all columns on this row
    row = insheet.row_values(excelRow + 1)

    #Create instance of Face with both filename and index
    face = Face(row[0], row[5], row[10])
    
    #print row[0]
    #saving the word to word array
    faces.append(face)

print(faces)

random.shuffle(faces);
random.shuffle(newFaces);
insheet = inbook.sheet_by_index(1)


for excelRow in range (0,num_new):
    row = insheet.row_values(excelRow + 1)
    newFaces.append(row[0])


experimentSeries = []

sets = 10 # ce tinha falado de 12 blocos, mas só tem 200 caras???
facesPerSet = 20

for set in range(sets):
    currentSerie = []

    for face in range (facesPerSet):
        currentSerie.append(faces[(set * 20) + face])
       
    experimentSeries.append(currentSerie)

#End routine Study Trial

 #log the current face and context to our data file
 EmotionalFaceOrder = EmotionalFaceOrder + 1
 thisExp.addData('facesfile', CallEmotionalFace)

#Begin Routine before Test Trial

import xlrd #Version 1.2.0 or below
import random
import numpy as np  # whole numpy lib is available, prepend 'np.'
from numpy.random import random, randint, normal, shuffle, choice as randchoice

import xlrd #Version 1.2.0 or below
import random

length = 10;

if NeutralFaceOrder == 0:
    neutralFacesFilePerSet = list(map(getNeutralFile, experimentSeries[expNumber]))
    random.shuffle(neutralFacesFilePerSet)
    neutralFacesFilePerSet.extend(newFaces[expNumber*10:length*(expNumber+1)])
    random.shuffle(neutralFacesFilePerSet);



CallNeutralFace = neutralFacesFilePerSet [NeutralFaceOrder];
    
print (neutralFacesFilePerSet)

#Begin Routine Test Trial

NeutralFaceOrder = NeutralFaceOrder + 1
print (neutralFacesFilePerSet);

#End Routine Test Trial


if OldNewResp.keys == 'v':
    myConditional = True
elif OldNewResp.keys == 'n':
    myConditional = False

thisExp.addData('facesfile_test', CallNeutralFace)

# Begin Routine CounterBlocks

expNumber = expNumber +1
 
