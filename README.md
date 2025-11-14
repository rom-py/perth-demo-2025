# Rompy Perth Demo

A demonstration repository showcasing the use of Rompy for configuring and running SWAN (Simulating WAves Nearshore) models. This project provides tools and examples for ocean wave modeling with a focus on procedural and declarative configuration approaches.

## Overview

This repository contains example configurations and code for running SWAN models using Rompy, a Python library that provides programmatic interfaces for ocean modeling. SWAN is a third-generation wave model that computes random, short-crested wind-generated waves in coastal regions and estuaries.

The project includes:
- Procedural configuration examples using Python code
- Declarative configuration examples using YAML
- Integration with ocean data sources (bathymetry, winds, wave spectra)
- Docker-based execution environment
- Jupyter notebooks for interactive modeling

## Prerequisites

- Python 3.8+
- Docker (for containerized execution)
- JupyterLab or Jupyter Notebook

## Installation

1. Clone the repository:
```bash
git clone <repository-url>
cd rompy-perth-demo
```

2. Create a virtual environment:
```bash
python -m venv .venv
source .venv/bin/activate  # On Windows: .venv\Scripts\activate
```

3. Install dependencies:
```bash
pip install -r requirements.txt
```

## Usage

### Running the Examples

The project includes both procedural and declarative examples:

1. **Procedural Example**: The notebook `examples/example_perth.ipynb` demonstrates how to programmatically build a SWAN model configuration using Python.

2. **Declarative Example**: The YAML file `examples/example_perth.yaml` shows how to configure a model using a declarative approach.

To run the notebook:
```bash
jupyter lab examples/example_perth.ipynb
```

### Docker Execution

The project includes a Dockerfile for containerized execution of SWAN models:

- Located at `docker/Dockerfile`
- Contains the SWAN model executable built from source
- Uses Ubuntu 20.04 as the base image
- Includes all necessary dependencies for execution

## Project Structure

```
├── prax-notebook.yaml        # Prax notebook configuration
├── docker/                   # Docker configuration
│   └── Dockerfile            # SWAN model Docker image
├── examples/                 # Example notebooks and configurations
│   ├── example_perth.ipynb   # Procedural example notebook
│   ├── example_perth.py      # Procedural example as Python script
│   └── example_perth.yaml    # Declarative example configuration
├── requirements.txt          # Python dependencies
└── tests/                    # Test data
```

## Key Features

- **Configurable SWAN Models**: Define and customize SWAN model parameters programmatically
- **Multiple Configuration Approaches**: Both procedural and declarative methods
- **Data Integration**: Connect with various oceanographic data sources
- **Model Grid Management**: Tools for defining and working with model grids
- **Execution Backends**: Support for local, Docker, and HPC execution
- **Visualization**: Built-in plotting and visualization capabilities

## SWAN Model Components

The Rompy library provides Python components that map to SWAN commands:

- **Grid Configuration**: CGRID component for defining model grids
- **Physics**: Components for wave generation, breaking, friction, and triads
- **Boundary Conditions**: Support for various boundary condition types
- **Output Configuration**: Define outputs including grids, points, and spectra
- **Initial Conditions**: Support for default, zero, parametric, and hotstart conditions

## Execution Backends

The project supports multiple execution backends:

- **Local**: Direct execution on the local machine
- **Docker**: Containerized execution for reproducibility
- **HPC**: High-performance computing cluster integration

## Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Add tests if applicable
5. Submit a pull request

## License

This project is licensed under the terms specified in the repository.

## Acknowledgments

- SWAN model developers for the underlying wave modeling engine
- Rompy developers for the Python interface to SWAN
- The oceanographic modeling community for providing valuable data sources