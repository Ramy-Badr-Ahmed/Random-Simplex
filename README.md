![MATLAB](https://img.shields.io/badge/MATLAB-%23D00000.svg?style=plastic&logo=mathworks&logoColor=white)   ![Fortran](https://img.shields.io/badge/Fortran-%23734F96.svg?style=plastic&logo=fortran&logoColor=white) ![GitHub](https://img.shields.io/github/license/Ramy-Badr-Ahmed/random-simplex?style=plastic)

[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.12808899.svg)](https://doi.org/10.5281/zenodo.12808899)


# Random Simplex Matrix

## Overview

This repository contains a function that utilises the Dirichlet distribution method to generate points on the `(n−1)`-dimensional simplex. The `randomSimplexMatrix.m` generates `m x n` matrices where each row is a random sample from the `(n−1)`-dimensional simplex, i.e., it produces vectors where each element is a non-negative number and the sum of all elements in each vector is 1.

### About

[Mathematica Link](https://reference.wolfram.com/language/ref/Simplex.html)

## Methodology

1. **Generation of K Unit-Exponential Distributed Random Draws**:
    - In each row (sample), the function generates K uniform random numbers `y_i` from the open interval `(0,1]`.
    - These are transformed to unit-exponential distributed random numbers `x_i = -log(y_i)`.

2. **Normalization**:
    - Compute the sum `S` of all `x_i` values.

3. **Calculation of Simplex Coordinates**:
    - The coordinates `t_1, ..., t_K` of the final point on the unit simplex are computed as `t_i = x_i / S`.

4. **Output**:
    - Returns a matrix, where each row is a vector on the `(n-1)`-dimensional simplex.


## Some Applications

#### Stability Analysis

- Polynomial Stability/Stability of discrete-time control systems: 

    > Use simplex sampling to generate coefficients for polynomials and analyse their stability by checking if all roots lie within the unit circle.

- Lyapunov Functions: 

    > Construct Lyapunov functions with randomly sampled coefficients to study the stability of equilibrium points in dynamical systems.

#### Bifurcation Analysis

- Parameter Space Exploration:

    > Investigate the behavior of dynamical systems under different parameter regimes by sampling parameters from a simplex. Identify bifurcation points where system behavior changes qualitatively.

- Nonlinear Dynamics: 

    > Model/simulate nonlinear systems to study chaos, where initial conditions or parameters are sampled from a simplex.

## Additional Scripts

1. `simplexSpace.m`

   > Demonstrates various plots and visualisations of simplex sampling.

2. `MultivariateND.m`

   > Showcases an application of simplex sampling for sampling from a multivariate normal distribution.

3. `VoronoiDiagram.m`

   > Visualise the Voronoi diagram of random points on a 2-dimensional simplex, divides regions based on proximity.


## Example Usage

```matlab
n = 100;  % Number of columns (dimensionality of simplex)
m = 1500;  % Number of rows (number of samples)
y = randomSimplexMatrix(n, m);
disp('Generated simplex matrix:');
disp(y);
```
