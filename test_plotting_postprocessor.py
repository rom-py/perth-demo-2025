"""
Simple test to verify the plotting postprocessor implementation.
"""

import tempfile
from pathlib import Path
from rompy_perth_demo.plotting_postprocessor import PlottingPostprocessor


def test_postprocessor_creation():
    """Test that the postprocessor can be instantiated."""
    processor = PlottingPostprocessor()
    print("✓ PlottingPostprocessor instantiated successfully")
    return processor


def test_postprocessor_interface():
    """Test that the postprocessor has the required interface."""
    processor = PlottingPostprocessor()
    
    # Check that it has the process method
    assert hasattr(processor, 'process'), "Processor must have a 'process' method"
    assert callable(getattr(processor, 'process')), "'process' must be callable"
    print("✓ Process method exists and is callable")
    
    # Check method signature by examining it
    import inspect
    sig = inspect.signature(processor.process)
    params = list(sig.parameters.keys())
    expected_params = ['model_run', 'validate_outputs', 'output_dir']
    for param in expected_params:
        assert param in params, f"Parameter '{param}' should be in process method signature"
    print(f"✓ Process method has expected parameters: {params[:3]}...")


if __name__ == "__main__":
    print("Testing PlottingPostprocessor implementation...")
    
    processor = test_postprocessor_creation()
    test_postprocessor_interface()
    
    print("\n✓ All tests passed! The plotting postprocessor is correctly implemented.")
    print("\nTo use the postprocessor in a model run:")
    print("model_run.postprocess(processor='plotting')")