#!/bin/bash

#convert all training sets to lmdb format
for ff in ../train-val-list/t*-train.dat;
do
    fff="$(echo $ff | cut -d"/" -f3-)"
    echo $ff;
    ../../build/tools/convert_hsi_imageset --shuffle=true ../ $ff ../databases/${fff%.dat}-lmdb;
done

#convert all test sets to lmdb format
for ff in ../train-val-list/t*-val.dat;
do
    fff="$(echo $ff | cut -d"/" -f3-)"
    echo $ff;
	../../build/tools/convert_hsi_imageset --shuffle=false ../ $ff ../databases/${fff%.dat}-lmdb;
done

#generate mean files for all training sets
for ff in ../databases/*train*;
do
    echo $ff;
        ../../build/tools/compute_image_mean -backend lmdb $ff ${ff%-lmdb}-mean;
done
