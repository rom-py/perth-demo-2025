# Interactive demo

This is an interactive demo of how to use the code in this repository

## 1. Clone the repository and setup a virtual environment

```bash
git clone git@github.com:rom-py/perth-demo-2025.git perth-demo
cd perth-demo
python -m venv venv
source venv/bin/activate
pip install -r requirements.txt
```

## 2. Open and run the notebook

Open and run [`example_perth.ipynb`](example_perth.ipynb) in a Jupyter environment.

## 3. Explore the cli

### a. Generate workspace

The equivalent configuration is defined in [`example_perth.yaml`](example_perth.yaml). You can run it from the command line as follows:

```bash
rompy generate example_perth.yaml -v
```

## b. Run the model locally using the local backend configuration [`backends/local.yaml`](backends/local.yaml)

Assumes you have swan installed, use the build_swan.sh script to install it if not

```bash
rompy run example_perth.yaml --backend-config backends/local.yaml -v
```

### c. Run the same model in a docker  using the docker backend configuration [`backends/docker.yaml`](backends/docker.yaml)

Does not require swan to be installed locally, but requires docker to be installed and running.
The configuration points to teh dockerfile [`../docker/Dockerfile`](../docker/Dockerfile) and will build the image automatically if not found locally.

```bash
rompy run example_perth.yaml --backend-config backends/local.yaml -v
```

# 4. Use real data

The above examples use small test datasets for rapid testing. To use real datasets, lets examine an example using the the datamesh source to use inputs from Oceanum's datamesh.

### a. Hindcast

[`rompy_datamesh_demo.yaml`](rompy_datamesh_demo.yaml) shows the same setup, but now using DatameshSource to point to data from oceanum's datamesh. Here we are using ERA5 winds and spectral data from Oceanum's wave hindcast

Lets generate the workdpace, and run it run it locally

```bash
rompy run rompy_datamesh_demo.yaml --backend-config backends/local.yaml -v




