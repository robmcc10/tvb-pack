#!/bin/bash

# Clear the terminal
clear

# Move to /opt directory and git clone tvb-data
cd /opt && git clone https://github.com/the-virtual-brain/tvb-data.git
# Install it because it does not require any unittest
cd /opt/tvb-data && python setup.py develop
# Remove the clone directory after everything, Because if we leave it making the image
# bigger in size.
cd /opt && rm -rf /tvb-data

# Move to /opt directory and git clone tvb-geodesic
cd /opt && git clone https://github.com/the-virtual-brain/tvb-geodesic.git
# Install it because it does not require any unittest
cd /opt/tvb-geodesic && python setup.py develop
# Remove the clone directory after everything, Because if we leave it making the image
# bigger in size.
cd /opt && rm -rf /tvb-geodesic

# Move to /opt directory and git clone tvb-library
cd /opt && git clone https://github.com/the-virtual-brain/tvb-library.git
# run the pytest for the require unittest
cd /opt/tvb-library
pytest tvb/test
# Install it
python setup.py develop
# Remove the clone directory after everything, Because if we leave it making the image
# bigger in size.
cd /opt && rm -rf /tvb-library

# Move to /opt directory and git clone tvb-framework
cd /opt && git clone https://github.com/the-virtual-brain/tvb-framework.git
# run the pytest for the require unittest
cd /opt/tvb-framework
pytest tvb/tests/framework/interfaces/web/controllers/help_controller_test
# Install it
python setup.py develop
# Create a virtual env for our building development
conda create -n tvb_distribution_env python=2.7
# Activate our env and install tvb-framework, cython, numpy and scipy because TVB depends on heavy native libraries.
source /opt/conda/bin/activate tvb_distribution_env && python setup.py develop && conda install -y cython numpy scipy


