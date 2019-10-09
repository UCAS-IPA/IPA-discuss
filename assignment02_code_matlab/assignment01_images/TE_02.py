import math

def gaussKernel(sig, *m):
    threshold = 2 * (int(3 * sig)) + 1

    if len(m) == 0:
        size = threshold

    elif m[0] < threshold:
        print("m is too smal")
        return

    else:
        size = m[0]

    kernel = [[0 for i in range(size)] for j in range(size)]
    center = (size - 1) / 2
    norm = 0

    for i in range(size):
        for j in range(size):
            x1 = 1 / (2 * math.pi * sig ** 2)
            x2 = - (pow(i - center, 2) + pow(j - center, 2)) / (2 * sig ** 2)
            kernel[i][j] = x1 * math.exp(x2)
            norm += kernel[i][j]

    for i in range(size):
        for j in range(size):
            kernel[i][j] = kernel[i][j] / norm
    return kernel

a = gaussKernel(1,7)
print(a)

