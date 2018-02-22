#!/bin/bash

#generate training and test datasets
#the samples are romdomized, 
#$train_num (from 3 to 15) samples of each class are listed in a training file (*-train.dat).
#the remaining samples are listed in a test file  (*-val.dat).

#input directory: samples/
#output directory: train-val-list/

#randomize 10 times
for ((randid=1; randid<=10; randid++))
do
	#for each class
        for ((labelid=1; labelid<=###@1###; labelid++))
        do
		((readid=labelid-1));
		echo  "$labelid "

		count=0;
	        echo $PWD	
		#for each sample in the randomized list (randomized by command 'sort -R')
		for ff in `find ../samples/ -type f -name "pixel5x5-cls${labelid}-*-0.bin" | sort -R`
		do
                        ff="$(echo $ff | cut -d"/" -f2-)"
			#for different number of train samples
			for ((train_num=3; train_num<=15; train_num++))
			do
				#write file names to the training sample list
				if [ $count -lt $train_num ]
				then
					fileid=${ff%-?.bin}
					echo "${fileid}-0.bin $readid" >> ../train-val-list/t${train_num}-rand${randid}-train.dat
					echo "${fileid}-1.bin $readid" >> ../train-val-list/t${train_num}-rand${randid}-train.dat
					echo "${fileid}-2.bin $readid" >> ../train-val-list/t${train_num}-rand${randid}-train.dat
					echo "${fileid}-3.bin $readid" >> ../train-val-list/t${train_num}-rand${randid}-train.dat
					echo "${fileid}-4.bin $readid" >> ../train-val-list/t${train_num}-rand${randid}-train.dat
					echo "${fileid}-5.bin $readid" >> ../train-val-list/t${train_num}-rand${randid}-train.dat
					echo "${fileid}-6.bin $readid" >> ../train-val-list/t${train_num}-rand${randid}-train.dat
					echo "${fileid}-7.bin $readid" >> ../train-val-list/t${train_num}-rand${randid}-train.dat
				#write file names to the validation/testing sample list
				else
					echo "$ff $readid">> ../train-val-list/t${train_num}-rand${randid}-val.dat
				fi
			done

			((count++));
		done #for ff

	done #for labelid
done #for randid





