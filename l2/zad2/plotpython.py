#%%
import matplotlib.pyplot as plt
import numpy as np

x = np.arange(-5, 40, 0.1)
y = (np.e ** x) * np.log(1 + np.e ** (-x))

plt.plot(x, y)
plt.show()
