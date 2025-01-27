# Investigating Algorithms for the Probabilistic Optimisation of Composite Panels

## Overview  

This repository contains the work from my individual 12-month MEng dissertation project at Imperial College London titled **"Investigating Algorithms for the Probabilistic Optimisation of Composite Panels"**. The research aimed to improve the robustness and reliability of composite aircraft structural designs while evaluating the efficiency and scalability of various optimisation methods. The project scored **86% (Distinction)** and resulted in a **publication** and **conference presentation**.

## Objective  

To:
1. Investigate the use of probabilistic design methods for improved structural performance under uncertainty.
2. Compare and benchmark a range of optimisation algorithms across deterministic, probabilistic (robust, reliable), and hybrid formulations.

## Highlights  

- **Dual-layer surrogate modelling**: Achieved over **700x computational speed-up** with <1% error, enabling efficient Monte Carlo simulations for uncertainty-driven design.
- **Algorithm comparison**: Rigorously evaluated five classes of algorithms (gradient, direct, evolutionary, genetic, combined) on performance, convergence times, and ability to locate global optima for deterministic and probabilistic design problems.
- **Hybrid Probabilistic Formulations**: Developed a hybrid optimisation model balancing robustness and reliability for composite panels, demonstrating superior trade-off performance compared to deterministic designs.
- **Pareto Fronts**: Explored multi-objective optimisation for visualising trade-offs between mass reduction and structural performance metrics.

## Technologies and Tools  

- **Structural Simulation**: ABAQUS with Python scripting for Finite Element Analysis (FEA) of a stiffened composite panel.
- **Optimisation Platform**: Dassault Systèmes Isight for running algorithms and integrating surrogate modelling workflows.
- **Analysis and Visualisation**: MATLAB for algorithm benchmarking, result analysis, and generating Pareto visualisations.

## Key Files and Directories  

- `SIMULATIONS/`  
  - **Abaqus/**: Contains setup files (`*.inp`) for FEA and Python post-processing scripts.  
  - **Isight/**: Ready-to-run `.zmf` workflows for all optimisation studies, including algorithm tuning, surrogate approximations, and Pareto exploration.
  
- `DATA PROCESSING/`  
  - MATLAB scripts for analysing results and generating comparison plots for convergence, objective functions, and algorithm performance.  
  - Subdirectories for processed data and generated diagrams integrated into the final report.

- `Final Presentation No Animations.pdf`  
  - Comprehensive visual summary of the research, methodology, and findings presented for evaluation.

- `Marij_FYP_Full_Report.pdf`  
  - The submitted dissertation providing in-depth discussions, methodology, results, and technical details.

## Results  

- **Findings**:  
  - Deterministic optimisations are quick but perform poorly under uncertainty.  
  - Hybrid approaches significantly improve robustness (+29%) with minor mass penalties (+10%).  
  - Genetic and combined algorithms excelled at global optima discovery in highly non-linear, multi-objective problems.  

- **Algorithm benchmarks**:  
  - **LSGRG**: Fastest for simple deterministic tasks.  
  - **Multi-Island Genetic Algorithm (MIGA)**: Superior for complex hybrid problems.  

## How to Use  

### Simulations  
1. Set up **Abaqus** with required plugins and run simulations for structural geometry in `SIMULATIONS/Abaqus/panel.inp`.  
2. Post-process results with `userscript_odb.py` to extract key eigenvalues.

### Optimisation Studies  
1. Open `.zmf` workflows in Isight (e.g., `alg_comparison.zmf`, `method_results.zmf`).  
2. Configure run parameters and execute specific optimisation tasks.

### Data Processing  
1. Use MATLAB to analyse optimisation data (`DATA PROCESSING/result_data/`) and visualise trade-offs.  
2. Example command: `pareto_fronts.m` plots performance envelopes from hybrid runs.

## Future Work  

1. Extend to multi-stringer composite panels.  
2. Include real-world material and manufacturing variability for further validation.  
3. Explore alternative probabilistic methods like First/Second Order Reliability Methods (FORM/SORM).  
