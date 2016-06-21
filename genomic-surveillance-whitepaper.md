
# Real-Time Genomic Surveillance

- **Author:** Eric J. Ma
- **Affiliation:** Department of Biological Engineering, Massachusetts Institute of Technology
- **Email:** ericmjl@mit.edu

## Abstract

This whitepaper proposes an implementation on how real-time genomic surveillance can be accomplished.

## Outline

1. Genomic Surveillance for Viral Infectious Agents
    1. Defining genomic surveillance, and its purpose.
    2. Available technologies:
        3.  Portable sequencers
        4.  High throughput, high read depth sequencers.
1. Phenotypic Surveillance for Viral Infectious Agents
    2. Defining phenotypic surveillance:
        3. Beyond drug susceptibility testing: determining biochemical properties of a virus' set of proteins.
    4. Most common use case: antibiotic drug resistance determination. (#citation required)
2. Case studies: where has genomic surveillance been used? 
    3. Ebola outbreak of 2014/2015 {Park:2015cw}
    4. Zika outbreak of 2015/2016
    5. Salmonella outbreak, Birmingham
    5. Seasonal influenza
1. What's missing:
    2. The "real-time" factor for phenotyping. How close (in time) from sampling can we gain insights, and not just sequence?
    3. Moving beyond evolutionary histories to phenotypic trajectories. (Not saying evo history is useless; just saying we need more.)
1. A plan forward:
    2. Systematically characterized data set.
        3. Cover the viable genotype space: use what's been isolated (those have been successful in nature).
    1. How machine learning can help.
        2. Map mutational trajectories. (MDS plots), help guide generation of new mutants.
        3. Supervised learning - learn mapping from genotype space to phenotype space.

## Genomic Surveillance for Viral Infectious Agents

Genomic surveillance refers to the sequencing of a new viral or bacterial pathogen after its outbreak in humans. Sequencing an outbreak pathogen allows us to use its evolutionary history to identify the viruses that share a common ancestor with the outbreak virus (#citation required), and its probable geographic movement history (#cite: phylogeography stuff).

## Case Studies

### Phylogeographic Analysis

For example, post-outbreak analysis of Ebola genomes showed that cross-border introduction was not a major factor in the outbreak progression (#cite: Danny's cell paper). 

### 










