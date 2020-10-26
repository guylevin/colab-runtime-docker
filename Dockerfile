
FROM continuumio/anaconda3

# Avoid warnings by switching to noninteractive
ENV DEBIAN_FRONTEND=noninteractive

# Update
RUN apt-get update

# Clean up
RUN apt-get autoremove -y \
    && apt-get clean -y \
    && rm -rf /var/lib/apt/lists/*

# Install pip essentials 
RUN /opt/conda/bin/pip install tensorflow keras torch

# Install OpenCV
RUN apt update -y \
    && apt install -y libgl1-mesa-glx ninja-build g++\
    && /opt/conda/bin/pip install opencv-python fvcore torchvision pycocotools


# Install Jupyter
RUN conda install -c conda-forge jupyterlab


# Install jupyter_http_over_ws
RUN pip install jupyter_http_over_ws \
    && jupyter serverextension enable --py jupyter_http_over_ws \
    && apt install -y unzip

# Set workdir
WORKDIR /content

# Start server and authenticate
ENTRYPOINT jupyter notebook \
           --NotebookApp.allow_origin='https://colab.research.google.com' \
           --ip=0.0.0.0 \
           --port=8888 \
           --allow-root \
           --NotebookApp.port_retries=0
