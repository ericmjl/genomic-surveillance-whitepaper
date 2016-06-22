---
title: "Real-Time Pathogen and Outbreak Surveillance: A Proposal"
author: 
- "Eric J. Ma"
date: 22 June 2016
csl: nature.csl
---

## Abstract

This whitepaper proposes an implementation on the current state-of-the-art on real-time pathogen surveillance, as well as a proposal for building the necessary infrastructure to deliver insights from genomic data.

## Genomic Surveillance for Viral Infectious Agents

### Purpose and Goals of Genomic Surveillance

Genomic surveillance refers to the sequencing of a new viral or bacterial pathogen after its outbreak in humans. Sequencing an outbreak pathogen allows us to gain useful insights into its evolutionary history. This can help us identify the viruses that share a common ancestor with the outbreak virus and its probable geographic movement history[@Lemey:2010eu; @Lemey:2009wn; @Fusaro:2011eg].

This knowledge can inform epidemiology efforts. For example, knowing that cross-geopolitical border movement is not a factor in the spread of an agent can help a country avoid unnecessary economic damage that may result, allowing limited manpower and financial resources to be devoted to other spread prevention measures. This point, in particular, was alluded to in the 2014 Ebola outbreak[@Park:2015cw]. Additionally, crucial numbers, such as the R~0~ of the pathogen, can be estimated on phylogenetic trees as well[@Gardy:2015fp].

Knowledge gained from phylogenetic modelling can also lead to further hypotheses about how to prevent further outbreaks. For example, knowledge that influenza is a zoonotic pathogen came from phylogenetic reconstructions of the virus, with its intermediate hosts being farm animals, led to agriculture-based biosecurity efforts (#cite).

### Hardware for Genomic Surveillance

**Sequencing:** Crucial to genomic surveillance is the capacity to sequence pathogens soon after its isolation. With the advent of portable sequencers such as the MinION (by Oxford Nanopore Technologies), this is rapidly becoming a possibility, as the MinION can be used to sequence a within days of collection[@Quick:2016kf], and can return analyzable sequence reads within minutes to hours of beginning a sequence run [@Quick:2015ko]. This, in principle, opens up the possibility of rapid identification of possible pathogenic agents from a patient, potentially faster than a live culture might take.

Apart from the MinION, other sequencing technologies have been used. For example, the Illumina sequencing platform is routinely used in influenza surveillance (#cite).

The core challenges that remain for the MinION, as applied to genomic surveillance for pathogen outbreaks, are similar to the challenges for other sequencing platforms, namely (from *Quick et. al.*[@Quick:2015ko]):

1. Monetary cost of sample prep reagents.
2. Labour, and hence time required, for sample preparation.
3. Target enrichment from mixed samples.

### Software Tools

#### Sequence Databases

Without publicly accessible sequence databases, the sequence data collected remain of little utility to the broader scientific community. 

#### Phylogenetic Software


## Phenotypic Surveillance

## Case Studies

In this section, I outline cases where genomic surveillance helped us gain a scientific understanding of an outbreak.

### Ebola Outbreak

For example, post-outbreak analysis of Ebola genomes showed that cross-border introduction was not a major factor in the outbreak progression[@Park:2015cw]. 

### Zika Outbreak

### Salmonella Outbreak

### Seasonal Influenza

## References