class Datapoint:
    def __init__(self, filename):
        self.filename = filename
        self.isBird = None
        self.isNoise = None
        self.startTime = None
        self.endTime = None
        self.overlayOf = set()

    def setClasses(self, isBird, isNoise):
        self.isBird = isBird
        self.isNoise = isNoise

    def setStartEnd(self, startTime, endTime):
        self.startTime = startTime
        self.endTime = endTime

    def addOverlayFile(self, datapoint):
        self.overlayOf.add(datapoint)

    def __str__(self):
        string = 'Datapoint: %s' % (self.filename)
        if self.isBird is not None:
            string += ' | isBird: %s | isNoise: %s' % (self.isBird, self.isNoise)
        if self.startTime is not None:
            string += ' | startTime: %s | endTime: %s' % (self.startTime, self.endTime)
        if len(self.overlayOf) > 0:
            string += '\n\tOverlay of:\n\t\t'
            overlayStr = []
            for dp in self.overlayOf:
                overlayStr += [str(dp)]
            string += '\n\t\t'.join(overlayStr)

        return string
