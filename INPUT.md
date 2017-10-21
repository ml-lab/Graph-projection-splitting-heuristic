These codes are for a fun project I am looking into. It is about applying graph projection splitting algorithm as a heuristic to convex integer programming problems (*e.g.,* linear integer programming problems). The codes in this repository applies the graph projection splitting heuristic to the following problem: 

$$
\begin{equation}
\begin{aligned} & \mathrm{minimize} &  & \|Dx-d\|_{2}^{2}\\
 & \mathrm{subject\;to} &  & Ax=b\\
 &  &  & 0\preceq x\preceq u\\
 &  &  & x\in\mathbf{Z}^{n},
\end{aligned}
\end{equation}
$$
where $x$ is the optimization variable and $A\in\mathbf{Z}^{m\times n},b\in\mathbf{Z}^{m},D\in\mathbf{R}^{p\times n},d\in\mathbf{R}^{p}$ are problem data. The matrix $A$ is fat full row rank ($m<n$) and the matrix $D$ is skinny full column row rank ($p>n$). 

## Code structure

There are two parts:

1. **Problem generation and pre-calculation:** The problem generation and pre-calculation is done using `Mathematica` because of the excellent package `hnfLLL`, that calculates integer normal form of a matrix using LLL algorithm, is written in `Mathematica`. The package is written by by Professor Wilberd van der Kallen and is used with his permission. 
2. **Graph projection splitting algorithm:** The algorithm is implemented in `MATLAB`. The integer least squares problem is solved exactly by using the `MATLAB` package `MILES`.



## How to use the code

1. **Problem generation and pre-calculation:** For problem generation and pre-calculation, the `Mathematica` file named `Random_data_generation_and_precalculation.nb` located in the directory `Code_for_precalculation`  is used. There are two blocks in the file, the first block contains the necessary function descriptions and the second block generates a random problem, performs the pre-calculation, and finds a starting point.  All the parameters can be changed during the random instance generation process. If the starting point is suboptimal, then it saves the data in a directory as prescribed by the variable `mypath` in second block.

2. **Graph projection splitting algorithm**: For solving the specific problem instance created in step 1 and saved in the folder `mypath`, the `Matlab` file `graph_projection_splitting_numerical_example.m` in the directory `Code_for_graph_splitting` is used. In the `.m` file, please change variables `mypath` and `outputpath` to the directories where the step 1 data has been saved and where the output data should be saved, respectively. After running the code the output will tell if optimality has been reached within the maximum number of iterations, and plot $ f\left(x^{\textrm{current}}\right)-f\left(x^{\star}\right)$ vs. iterations and $\|x^{\textrm{current}}-x^{\star}\| $ vs. iterations.

  ​

## Acknowledgements

I thank Professor [Wilberd van der Kallen](https://www.staff.science.uu.nl/~kalle101/) and Professor [Xiao-Wen Chang](http://www.cs.mcgill.ca/~chang/) for giving me permission to use their software packages `hnfLLL` and `MILES`, respectively.