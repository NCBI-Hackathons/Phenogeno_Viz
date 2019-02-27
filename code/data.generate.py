# -*- coding: UTF-8 -*-
import sys
import subprocess
import os
from operator import itemgetter
import math

class rnaSeqData:
    def __init__(self, rnaData, descriptionData, outputFile, requiredTissue):
        self.rna = rnaData
        self.description = descriptionData
        self.output      = outputFile
        self.queryTissue = requiredTissue
    
    def descriptHash(self):
        des_hash = {}
        with open(self.description, 'r') as f:
            line = f.readline()
            while line:
                [id, tissue] = itemgetter(0,5)(line.split('\t'))
                des_hash[id] = tissue
                line = f.readline()
        return(des_hash)

    def columnExtract(self):
        
        tissueHash = self.descriptHash()
        
        with open (self.rna, 'r') as f:
            topLine = f.readline()
        
        neededColumnList =[0,1]
        neededColumnName =['ID1','ID2']
        neededColumn = 0
        list_id = topLine.split('\t')
        for i in list_id:
            neededColumn = neededColumn + 1
            if (i in tissueHash and tissueHash[i] in requiredTissue):
                neededColumnList.append(neededColumn)
                neededColumnName.append('_'.join([tissueHash[i], str(neededColumn)]))

        #print(neededColumnList)
        #print(neededColumnName)
        
        jjj = 0
        with open(self.output, 'w') as fw:
            fw.write('\t'.join(neededColumnName))
            fw.write('\n')
            with open(self.rna,'r') as f:
                line = f.readline()
                while line:
                    jjj = jjj + 1
                    if jjj > 1:
                        line_list = line.split('\t')
                        eleNeeded = [line_list[j] for j in neededColumnList]
                        aa = '\t'.join(eleNeeded)
                        
                        fw.write(aa)
                        fw.write('\n')
                    line = f.readline()
                
            


if __name__ == '__main__':
    [rnaData, des, outputFile, *requiredTissue] = sys.argv[1:]
    #print(requiredTissue)
    class_go = rnaSeqData(rnaData, des, outputFile, requiredTissue)
    class_go.columnExtract()
    #aa = class_go.descriptHash()
    #print(aa)
