from ... import utils, module

class Point(module.Module) :
    def __init__(self, name):
        super(self.__class__, self).__init__()

        self.name = name
        self.type = __name__.split('.')[-1]

        # print("Point init")
