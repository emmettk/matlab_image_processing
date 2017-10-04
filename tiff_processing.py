# -*- coding: utf-8 -*-
"""
Created on Mon Oct  2 16:56:37 2017

@author: LaVision

Rectify images via Matlab
Calls matlab file tiff_spatial_rectification.m
"""
import os
import matlab.engine
eng = matlab.engine.start_matlab()

#file = '201709261200_tower_IR_16mm_00000_120002574.tif'
#path = 'D:/RSEX17_TIFF/0926/20170926_1200_towerIR_pierIR/tower_IR_16mm_1000img/'
path = r'D:/RSEX17_TIFF/0926/20170926_1300_towerIR_towerEO/tower_IR_16mm/'

###Load every nth file
n = 10

for file in [file for file in os.listdir(path) if '.tif' in file][0::n]:
    p2 = r'D:/RSEX17_TIFF/Rectified/0926/20170926_1300_towerIR_towerEO/tower_IR_16mm/'
    output = p2 + file[:-4]+'_rectified.tif'
    print("reading into Matlab:", file)
    eng.tiff_spatial_rectification(path+file, output, nargout = 0)
    print("wrote", output)
#    print(file, output)
#    ret = eng.triarea(1.0,5.0)
#    print(ret)