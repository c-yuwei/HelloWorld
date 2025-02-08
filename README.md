![BRAPH 2.0](braph2banner.png)

[![BRAPH 2](https://img.shields.io/twitter/url?label=BRAPH%202&style=social&url=https%3A%2F%2Ftwitter.com%2Fbraph2software)](https://twitter.com/braph2software)
[![Website](https://img.shields.io/website?up_message=braph.org&url=http%3A%2F%2Fbraph.org%2F)](http://braph.org/)
[![DOI](https://img.shields.io/badge/DOI-10.1371%2Fjournal.pone.0178798-blue)](https://doi.org/10.1371/journal.pone.0178798)


# BRAPH 2 Hello, World!
The **BRAPH 2 Hello, World!** is a simple BRAPH 2 distribution that showcases the BRAPH 2 _Genesis_ System to create a **standalone**, **unit-tested**, and **GUI-ready** software distribution. 

This distribution utilizes the minimal functionalities of the **standard BRAPH 2 software** to demonstrate a pipeline consisting of (1) Defining the first string (e.g., _Hello_), (2) Defining the second string (e.g., _World_)), and (3) Combining both strings (e.g., _Hello World_). More information about how to create your own distribution can be found in the main [BRAPH 2.0](https://github.com/braph-software/BRAPH-2/tree/develop) repository. The full tutorials are available [here](https://github.com/braph-software/BRAPH-2/tree/develop/tutorials).

## Software compilation

The compiled version of the software is already provided in this repository under "braph2helloworld" folder. However, if you would like to compile the software again (for example, after implementing new functionalities in BRAPH 2.0, or adding new pipelines) you will need to run the braph2genesis('braph2helloworld_config.m') . This will re-generate "braph2helloworld" folder which can then be used as explained above. **WARNING**: To ensure a successful compilation, the folder "braph2helloworld" should be erased and all of its dependencies should be removed from the MATLAB path. This folder will be regenerated after a successful compilation.

