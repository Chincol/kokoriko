import xml.etree.ElementTree as ET
from datapoints import Datapoint

tree = ET.parse('birds.xml')

data = set()

for recording in tree.getroot():
    try:
        filename = recording.find('filename').text
        datapoint = Datapoint(filename)
        isBird = recording.find('isBird').text.lower() == 'true'
        isNoise = recording.find('isNoise').text.lower() == 'true'
        datapoint.setClasses(isBird, isNoise)

        overlayFiles = recording.find('compositionOf')
        if overlayFiles is not None:
            for f in overlayFiles:
                fname = f.find('filename').text
                dp = Datapoint(fname)
                startTime = float(f.find('startTime').text)
                endTime = float(f.find('endTime').text)
                dp.setStartEnd(startTime, endTime)
                datapoint.addOverlayFile(dp)

        data.add(datapoint)

    except AttributeError as e:
        print('[Warning] Datapoint missing one or more fields')
    except NameError as e:
        print('[Error] Datapoint has invalid field value')


for p in data:
    print(p)
