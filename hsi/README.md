# Caffe for HSI classification

directory structure
---------------------
* 1              = contians files to convert raw data from .mat to bin sample files
* 2              = contians files to generate train and val list text files
* 3              = contians files to convert bin to lmdb dataset
* 4              = contians files for defining network and training
* databases      = contains lmdb datasets
* public-data    = contains raw data in .mat format
* samples        = contains the generated bin sample files
* train-val-list = contains the generated train and val list text files
* configure      = used to configure settings before training the network (see below)

installation
-------------
- git clone this repository
- install caffe as usually
- download the .mat files for data and label, and place these files under the directory public-data, also open the .mat files to identify the name of the variables that contians the actual data and label in each .mat file.

For usage with tensorflow

- also install tensrflow as usual
- git clone caffe-tensorflow from https://github.com/ethereon/caffe-tensorflow


usage
------
- run "./configure [num_of_classes] [name_of_mat_data] [name_of_mat_label] [name_of_data_variable] [name_of_label_variable] [output_prefix_name]"

  e.g. ./configure 16 Indian_pines_corrected.mat Indian_pines_gt.mat indian_pines_corrected indian_pines_gt Indian_pines

- cd into each of directory 1, 2, 3 to preapre data and label for training:
- under 1, run run_me.m using matalb
- under 2, run "./create-train-val-list.sh"
- under 3, run "./convert-to-lmdb.sh"
- cd into directory 4 to start trainig
- modify solver.prototxt to tune the optimizer
- run "./train" to train the network
- model weights are saved at regular training iterations under 4/models
- training log files are saved at regular traiinig iterations under 4/logs

To convert network definition and weights to tensorflow model and weighs, use convert.py from caffe-tensorflow Note that this only works with the deployment version of the network as multiple input blobs is not supported. The deployment netowrk is at 4/deployment.prototxt.

- run "path/to/caffe-tensorflow/convert.py --caffemodel the_caffe_model.caffemodel --data-output-path tensrflow_weights.npy -p train path/to/caffe/hsi/4/deployment.prototxt" to convert a saved caffe model weights "the_caffe_model.caffemodel" to tensorflow weights "tensrflow_weights.npy"
- run "path/to/caffe-tensorflow/convert.py --code-output-path tensrflow_model.py -p train path/to/caffe/hsi/4/deployment.prototxt" to convert a the caffe network "deplomyent.prototxt" to tensorflow model "tensrflow_model.py"

Note: -p train is needed as the network uses dropout, to generate a network for testing only, remove the dropout layer from the deployment network and run the above commands with -p test. The generated tensroflow files have dependency on a few standalone files from caffe-tensorflow







