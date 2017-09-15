#!/usr/bin/env python
#
# created by everettjf 20170915
#
# Input  : Path of directory , which include raw *.ostrace files.
# Output : Path of output json file , which will be given to catapult.
#

import os
import optparse


class Merger:
    def __init__(self,dir):
        self.dir = dir
        self.output_path = os.path.join(dir,"trace.json")

        if os.path.exists(self.output_path):
            os.remove(self.output_path)

        self.output = open(self.output_path,'w')
        self.output.write('[\n')

    def append(self,line):
        line = line.strip('\n')
        print len(line),' : ', line
        self.output.write(line)
        self.output.write(',\n')

    def merge_file(self,file_path):
        print file_path

        file = open(file_path)
        while True:
            line = file.readline()
            if not line or line == '':
                break
            self.append(line)

    def run(self):
        i = 0
        while True:
            if i == 0:
                file_path = os.path.join(self.dir,"trace.ostrace")
            else:
                file_path = os.path.join(self.dir,"trace_%d.ostrace" % (i))

            if not os.path.exists(file_path):
                break

            self.merge_file(file_path)
            i+=1

def main():
    m = Merger('tracedata/raw')
    m.run()

if __name__ == '__main__':
    main()
