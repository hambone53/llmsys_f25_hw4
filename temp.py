import pycuda.driver as cuda
import pycuda.autoinit

device = cuda.Device(0)
props = device.get_attributes()
print("Max threads per block:", props[cuda.device_attribute.MAX_THREADS_PER_BLOCK])
print("Max grid size:", props[cuda.device_attribute.MAX_GRID_DIM_X])