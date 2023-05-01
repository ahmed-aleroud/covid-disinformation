* Encoding: UTF-8.
begin program python3.
import spss
IQE2rVars = []
IQI2rVars = []
spssCmd = ""
varWithoutR = ''
for ind in range (spss.GetVariableCount()):
    varNam = spss.GetVariableName(ind)
    if '_IQE2r' in varNam:
       # print(varNam)
        IQE2rVars.append(varNam)
        
    if '_IQI2r' in varNam:
       # print(varNam)
        IQI2rVars.append(varNam)
print('')
print('')        
#print(IQE2rVars)        
#print(IQI2rVars)

for var in IQE2rVars:
    print(var)
    #print(var[:-1])
    varWithoutR = var[:-1]
    
    #Recode old variables into new variables
    spssCmd = "RECODE %s (1=5) (2=4) (3=3) (4=2) (5=1) INTO %s."%(var, varWithoutR)
    #print(spssCmd)
    spss.Submit(spssCmd)
    
    #new value labels for new variables
    spssCmd = "value labels %s 1 'Strongly Disagree' 2 'Disagree' 3 'Neither Agree nor Disagree' 4 'Agree' 5 'Strongly Agree'."%(varWithoutR)
    #print(spssCmd)
    spss.Submit(spssCmd)
    
    #format new variables wtih no decimals
    spssCmd = "formats %s(f8.0)."%(varWithoutR)
    #print(spssCmd)
    spss.Submit(spssCmd)   
    
    #make new labels for new variables
    spssCmd = "VARIABLE LABELS\n%s '%s - This information is difficult to manipulate to meet my needs. (R)'"%(varWithoutR, varWithoutR[:-4] +"IQ")
   # print(spssCmd)
    spss.Submit(spssCmd)
    
     #make new var scale 
    spssCmd = "VARIABLE LEVEL %s (SCALE)."%(varWithoutR)
    spss.Submit(spssCmd) 

for var in IQI2rVars:
    print(var)
    #print(var[:-1])
    varWithoutR = var[:-1]
    
    #Recode old variables into new variables
    spssCmd = "RECODE %s (1=5) (2=4) (3=3) (4=2) (5=1) INTO %s."%(var, varWithoutR)
    #print(spssCmd)
    spss.Submit(spssCmd)

    #new value labels for new variables
    spssCmd = "value labels %s 1 'Strongly Disagree' 2 'Disagree' 3 'Neither Agree nor Disagree' 4 'Agree' 5 'Strongly Agree'."%(varWithoutR)
    #print(spssCmd)
    spss.Submit(spssCmd)
    
    #format new variables wtih no decimals
    spssCmd = "formats %s(f8.0)."%(varWithoutR)
    #print(spssCmd)
    spss.Submit(spssCmd)   
    
    #make new labels for new variables
    spssCmd = "VARIABLE LABELS\n%s '%s - This information is difficult to interpret. (R)'"%(varWithoutR, varWithoutR[:-4] +"IQ")
    #print(spssCmd)
    spss.Submit(spssCmd)  
    
    #make new var scale
    spssCmd = "VARIABLE LEVEL %s (SCALE)."%(varWithoutR)
    spss.Submit(spssCmd)
    
END PROGRAM.




*
* delete old vars
* you must save the file before running the following code
*

begin program python3.
import spss
IQE2rVars = []
IQI2rVars = []
spssCmd = ""
varWithoutR = ''
for ind in range (spss.GetVariableCount()):
    varNam = spss.GetVariableName(ind)
    if '_IQE2r' in varNam:
       # print(varNam)
        IQE2rVars.append(varNam)
        
    if '_IQI2r' in varNam:
       # print(varNam)
        IQI2rVars.append(varNam)
print('')
print('')   

for var in IQE2rVars:
    print(var)
    
    #clean up old vars
    spssCmd = "DELETE VARIABLES %s."%(var)
    spss.Submit(spssCmd)
    
for var in IQI2rVars:
    print(var)
    
    #clean up old vars
    spssCmd = "DELETE VARIABLES %s."%(var)
    spss.Submit(spssCmd)
    
    
END PROGRAM.

sort variables by name.


FREQUENCIES VARIABLES=S1011Mm_IQE1 S1011Mm_IQE2 S1011Mm_IQE3 S1011Mm_IQI1 S1011Mm_IQI2 S1011Mm_IQI3 S1011Mm_IQU1 S1011Mm_IQU2 S1011Mm_IQU3
  /STATISTICS= MINIMUM MAXIMUM STDDEV MEAN
  /FORMAT=NOTABLE
  /ORDER=ANALYSIS.

