These codes are for a fun project I am looking into. It is about applying graph projection splitting algorithm as a heuristic to convex integer programming problems (*e.g.,* linear integer programming problems). The codes in this repository applies the graph projection splitting heuristic to the following problem: 

<p align="center"><img src="https://rawgit.com/Shuvomoy/Graph-projection-splitting-heuristic/master/svgs/182ebd0d905a0bdd86a850278d4a48b5.svg?invert_in_darkmode" align=middle width=238.5999pt height=86.51181pt/></p>
where <img src="https://rawgit.com/Shuvomoy/Graph-projection-splitting-heuristic/master/svgs/332cc365a4987aacce0ead01b8bdcc0b.svg?invert_in_darkmode" align=middle width=9.3951pt height=14.15535pt/> is the optimization variable and <img src="https://rawgit.com/Shuvomoy/Graph-projection-splitting-heuristic/master/svgs/a6da2a5bc69cc4ae51ed6d51ff11c10a.svg?invert_in_darkmode" align=middle width=256.320405pt height=24.14676pt/> are problem data. The matrix <img src="https://rawgit.com/Shuvomoy/Graph-projection-splitting-heuristic/master/svgs/53d147e7f3fe6e47ee05b88b166bd3f6.svg?invert_in_darkmode" align=middle width=12.3288pt height=22.46574pt/> is fat full row rank (<img src="https://rawgit.com/Shuvomoy/Graph-projection-splitting-heuristic/master/svgs/5a601ba4f57c17b0e6bcfc9879b1c506.svg?invert_in_darkmode" align=middle width=43.6854pt height=17.72364pt/>) and the matrix <img src="https://rawgit.com/Shuvomoy/Graph-projection-splitting-heuristic/master/svgs/78ec2b7008296ce0561cf83393cb746d.svg?invert_in_darkmode" align=middle width=14.06625pt height=22.46574pt/> is skinny full column row rank (<img src="https://rawgit.com/Shuvomoy/Graph-projection-splitting-heuristic/master/svgs/d58f8160933ecf88fbe5bf8dfb022632.svg?invert_in_darkmode" align=middle width=37.52298pt height=17.72364pt/>). 

## Code structure

There are two parts:

1. **Problem generation and pre-calculation:** The problem generation and pre-calculation is done using `Mathematica` because of the excellent package `hnfLLL`, that calculates integer normal form of a matrix using LLL algorithm, is written in `Mathematica`. The package is written by by Professor Wilberd van der Kallen and is used with his permission. 
2. **Graph projection splitting algorithm:** The algorithm is implemented in `MATLAB`. The integer least squares problem is solved exactly by using the `MATLAB` package `MILES`.



## How to use the code

1. **Problem generation and pre-calculation:** For problem generation and pre-calculation, the `Mathematica` file named `Random_data_generation_and_precalculation.nb` located in the directory `Code_for_precalculation`  is used. There are two blocks in the file, the first block contains the necessary function descriptions and the second block generates a random problem, performs the pre-calculation, and finds a starting point.  All the parameters can be changed during the random instance generation process. If the starting point is suboptimal, then it saves the data in a directory as prescribed by the variable `mypath` in second block.

2. **Graph projection splitting algorithm**: For solving the specific problem instance created in step 1 and saved in the folder `mypath`, the `Matlab` file `graph_projection_splitting_numerical_example.m` in the directory `Code_for_graph_splitting` is used. In the `.m` file, please change variables `mypath` and `outputpath` to the directories where the step 1 data has been saved and where the output data should be saved, respectively. After running the code the output will tell if optimality has been reached within the maximum number of iterations, and plot <img src="https://rawgit.com/Shuvomoy/Graph-projection-splitting-heuristic/master/svgs/9eda9b9f56adbb9745ad99bd94ca4bb4.svg?invert_in_darkmode" align=middle width=135.41913pt height=24.6576pt/> vs. iterations and <img src="https://rawgit.com/Shuvomoy/Graph-projection-splitting-heuristic/master/svgs/ca02015375f3d9ea9c4897b2c5ae1714.svg?invert_in_darkmode" align=middle width=102.463845pt height=24.6576pt/> vs. iterations.

  ​

## Acknowledgements

I thank Professor [Wilberd van der Kallen](https://www.staff.science.uu.nl/~kalle101/) and Professor [Xiao-Wen Chang](http://www.cs.mcgill.ca/~chang/) for giving me permission to use their software packages `hnfLLL` and `MILES`, respectively.