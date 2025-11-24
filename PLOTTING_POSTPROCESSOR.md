# Plotting Postprocessor for Rompy Perth Demo

This repository includes a custom postprocessor that generates plots from SWAN model outputs, based on the plotting code from the example notebook.

## Overview

The `PlottingPostprocessor` generates various plots from SWAN model outputs, including:
- Model depth plots
- Gridded significant wave height (Hs) plots
- Gridded wind plots with quivers
- Spectra plots
- Time series plots comparing table and spectra data
- Hotfile plots showing Hs, Tp, and Dpm

## Installation

The postprocessor is automatically registered when you install the package using pyproject.toml:

```bash
pip install -e .
```

The postprocessor is now part of the `rompy_perth_demo` package and will be available system-wide after installation.

## Usage

Once installed, you can use the plotting postprocessor with any Rompy model run:

```python
# After running your model
model_run = ModelRun(...)  # your model configuration
success = model_run.run(backend=your_backend_config)

# Postprocess with the plotting postprocessor
results = model_run.postprocess(processor='plotting')

# The results will include information about the plots created
print(results)
```

### Command Line Usage

You can also use the postprocessor via the command line from any directory within the project:

```bash
rompy postprocess --processor plotting path/to/your/config.yaml -v
```

For example, from the examples directory:
```bash
rompy postprocess --processor plotting rompy_datamesh_demo.yaml -v
```

Or from the project root:
```bash
rompy postprocess --processor plotting examples/rompy_datamesh_demo.yaml -v
```

This works because the postprocessor is now properly packaged and installed as part of the `rompy-perth-demo` package.

## Customization Options

The plotting postprocessor supports several customization options:

- `plot_format`: Format for saved plots (default: "png")
- `plot_dpi`: DPI for saved plots (default: 150)
- `plot_every_n_timesteps`: Plot every N timesteps (default: 3)
- `validate_outputs`: Whether to validate that output directory exists (default: True)

Example with custom options:

```python
results = model_run.postprocess(
    processor='plotting',
    plot_format='pdf',
    plot_dpi=300,
    plot_every_n_timesteps=1
)
```

## Generated Plots

The postprocessor will create the following plots in the model run output directory:

- `depth_{run_id}.{format}` - Model depth visualization
- `gridded_hs_{run_id}.{format}` - Gridded significant wave height
- `gridded_wind_{run_id}.{format}` - Gridded wind fields with direction
- `spec_{run_id}.{format}` - Spectra plots
- `timeseries_comparison_{run_id}.{format}` - Comparison of table vs spectra data
- `hotfile_{run_id}_{hotfile_name}.{format}` - Hotfile data visualization

## How It Works

The postprocessor:
1. Identifies the SWAN output files from the model run
2. Loads gridded, spectral, and tabular data
3. Creates appropriate visualizations using matplotlib and cartopy
4. Saves plots to the output directory
5. Returns a dictionary with information about the processing results

## Registration

The postprocessor is registered via the `setup.py` entry point configuration:
```python
entry_points={
    "rompy.postprocess": [
        "plotting = plotting_postprocessor:PlottingPostprocessor",
    ],
}
```

This makes it available as `processor='plotting'` in model run postprocessing.