
Testbench for the unprotected design, naive_HPC2 and GHPC/GHPCLL, Pipeline and ClockGating designs are provided.
To generate other testbenches, you just need to adjust these two parameters:

`constant fresh_size   : integer := xx;`
`constant AddedLatency : integer := yy;`

