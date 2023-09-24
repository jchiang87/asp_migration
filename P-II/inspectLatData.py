import os
from FileStager import FileStager
from getFitsData import getStagedFitsData

output_dir = os.environ['OUTPUTDIR']
os.chdir(output_dir)

fileStager = FileStager('stagingDir', stageArea=output_dir,
                        messageLevel="INFO", cleanup=True)
ft1, ft2 = getStagedFitsData(fileStager=fileStager)

print("FT1 files:")
for item in ft1:
    print(item)

print("FT2 files:")
for item in ft2:
    print(item)
