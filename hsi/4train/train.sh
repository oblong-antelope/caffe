#!/bin/bash

nohup  ../../build/tools/caffe train --solver=solver.t3-rand1.prototxt &> logs/t3-rand1.log
