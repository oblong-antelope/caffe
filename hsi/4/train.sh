#!/bin/bash

nohup  ../../build/tools/caffe train --solver=solver.prototxt &> logs/t3-rand1.log
