# Filebench_Test_Suite
This is the custom test suite for filebenchmarking using filebench, tweaked to test the performance of computers with 2 cores and 4 GB ram.
It uses filebench to analyse performance under a variety of predefined loads, and a python script to visualize the result.

The whole test suite consists of:
1. Random reads on a 1 gig file
2. Random reads on a 5 gig file
3. Random reads/writes on a 1 gig file
4. Random reads/writes on a 5 gig file
5. OLTP simulation workload
6. Fileserver simulation workload
7. Webserver simulation workload

Docs: https://docs.google.com/document/d/14WyX2FmBHLcedQ0rLCSHm2MsQ6uPB3_lfn-y7pXstM4/edit?usp=sharing

# Installing Filebench
Please refer to the README of the project for more information
https://github.com/filebench/filebench
1. Download tar distribution of filebench  (1.5-alpha 3) https://github.com/filebench/filebench/releases/download/1.5-alpha3/filebench-1.5-alpha3.tar.gz
2. Download Yacc (bison)& Lex (flex) as a prerequisite for installing filebench
`sudo apt-get install flex bison`
3. Extract the tar distribution of the filebench.
4. Then, change directory to extracted filebench folder. Proceed with configuration, compilation, and installation as usual:
`$ ./configure`
`$ make`
`$ sudo make install`
5. Check if it’s installed by running typing `filebench` on your terminal.
6. Disable virtual address randomization, switch to root shell and exit.
`sudo sh -c "echo 0 > /proc/sys/kernel/randomize_va_space"`

# Running the experiment
The repo comes with a predefined bash script. All you need to do is execute
`bash script.sh` in the root directory.
Every testcase takes 10 minutes to run, the whole script should be finished in ~70 minutes.
The log results should be stored in /log directory.

# Visualizing the experiment
Once you have the log ready, then you can visualize it! Try opening viz.py to get a grasp of what it's doing.
It needs at least 1 log files to generate a plot with 2 values.

In general, you need to:
1. Set file paths to the results that you have got and what you wanna compare it against.
2. Call the functions to parse the log file that you've got.

![image](https://user-images.githubusercontent.com/75229742/220404641-1e679ddb-c9f3-400a-9212-bed5a5e0f77e.png)
This is the example of the visualization, depicting comparison of random reads on a 1 gig file between a digital ocean droplet and my local machine.

# Things to note:
1. Please ENSURE virtual address randomization is of or Filebench won't run properly.
