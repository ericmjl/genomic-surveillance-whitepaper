---
title: "Genotypic and Phenotypic Measurements for Real-Time Pathogen Surveillance"
author: 
- "Eric J. Ma (MIT)"
- "Jonathan A. Runstadler (MIT)"
date: 22 June 2016
csl: nature.csl
---

## Summary

This whitepaper describes the current state-of-the-art on (real-time) pathogen surveillance, as well as a proposal for building the necessary infrastructure to deliver insights from genomic data.

## Abstract

One goal of genomic surveillance is to predict the potential harm to human health that a pathogen can inflict, based on its sequence. Having this ability could dramatically reduce the time required to determine drug resistance, antigenic sensitivity, and perhaps even virulence. One potential way to accomplish this is to use machine learning to learn the mapping from viral sequence to phenotype. However, the data necessary to accomplish this are not available. Here, we propose a "generic" experimental strategy for systematically characterizing a protein for its biochemical phenotype, and propose a few ways that machine learning methods may be integrated with the data as part of a surveillance dashboard.

## Genomic Surveillance for Viral Infectious Agents

### Purpose of Genomic Surveillance

Genomic surveillance refers to the sequencing of a new viral or bacterial pathogen after its outbreak in humans. The goals (otherwise stated as the 'expected utility') of sequencing a pathogen include:

1. identifying the outbreak source using comparative genomics,
2. describing and modelling the geographical movement of the virus,
3. forecasting the strains that will cause the next outbreaks, and
4. computing the predicted risk that a virus will have in the outbreak scenario.

Sequencing an outbreak pathogen allows us to gain useful insights into its evolutionary history. Integrating the data together can help us identify the viruses that share a common ancestor with the outbreak virus and its probable geographic movement history[@Lemey:2010eu; @Lemey:2009wn; @Fusaro:2011eg].

This knowledge can inform epidemiology and biosecurity efforts. For example, knowing that cross-geopolitical border movement is not a factor in the spread of an agent can help a country avoid unnecessary economic damage that may result, allowing limited manpower and financial resources to be devoted to other spread prevention measures. This point, in particular, was alluded to in the 2014 Ebola outbreak[@Park:2015cw]. Additionally, crucial epidemiological parameters, such as the basic reproductive number (R~0~) of the pathogen, can be estimated simultaneously with phylogenies[@Gardy:2015fp]. As a final example, a study integrating Bayesian phylogeography with ecosystem information showed that wild birds were responsible for the spread of avian influenza between domestic birds in different geographic areas[@Bahl:2016efa]. Tightening biosecurity around animal farms would be the logical epidemiological course of action. Taken together, the value of sampling new outbreaks and continued surveillance and cannot be overstated.

### Genome Sequencing

Crucial to genomic surveillance is the capacity to sequence pathogens soon after its isolation. While traditional Sanger and Next Generation Sequencing methods have been used, here I would like to focus on the development of portable, handheld sequencers, exemplified by the MinION (Oxford Nanopore Technologies). With the advent of these devices, sequencing soon after isolation is rapidly becoming a possibility. Pilot experiments with MinION showed that samples can be sequenced within days of collection[@Quick:2016kf], sometimes within just 24 hours, and can return analyzable sequence reads within minutes to hours of beginning a sequence run [@Quick:2015ko]. This, in principle, opens up the possibility of rapid identification of possible pathogenic agents from a patient, potentially faster than a live culture might take.

The core challenges that remain for the MinION, as applied to genomic surveillance for pathogen outbreaks, are similar to the challenges for other sequencing platforms, namely (from *Quick et. al.*[@Quick:2015ko]):

1. monetary cost of sample prep reagents,
2. labour, and hence time required, for sample preparation, and
3. target enrichment from mixed samples.

Additionally, the MinION still requires improvements to its read accuracy. While the sequence reads are sufficiently accurate to detect antimicrobial resistance gene cassettes, it still does not have the necessary accuracy to identify point mutations associated with antibiotic resistance[@Judge:2015jr]. Estimates for read accuracy currently are between 60%-85%, as determined by pilot studies[@Hoenen:2016fo; @Ashton:2015ff]. Better modelling will enable fast read mapping[@Loose:2016gr] to reference sequences and greater accuracy[@Jain:2015ij], greatly increasing the value of deploying these sequencers. In the long-run, being able to resolve single nucleotide differences on portable sequencers would be considered most ideal.

### Sequence Databases

Without publicly accessible sequence databases, the sequence data collected remain of little utility to the broader scientific community. Publicly accessible sequence databases enable meta- and global studies of pathogens[@Ma:2016ht; @Wertheim:2013de], and data mining can be conducted where rich metadata are available.

The influenza research and surveillance community has the **Influenza Research Database (IRD)**[@Squires:2012fx] as a public repository of viral sequences isolated through surveillance efforts globally. Here, not only are the sequences stored, valuable metadata including date and country of collection, and the viral host, are stored and easily accessible in the default interface. Additional ecological metadata are also stored, such as the age of wild birds when collecting, enabling studies into the interplay between host and viral ecology[@Hill:2016dh; @Bahl:2016efa].

The HIV research community also has benefited from the **HIV Sequence Database** maintained by the Los Alamos National Laboratory (http://www.hiv.lanl.gov/content/index), as well as the **Stanford HIV Drug Resistance Database** (http://hivdb.stanford.edu). In particular, the utility of a drug resistance database has been articulated[@Shafer:2006go], including the identification of genomic correlates of drug resistance. From the perspective of genomic surviellance, the sharing of this data has enabled the development of machine learning tools that can automatically predict viral properties from sequence[@Hepler:2014fy], which can enable rapid prediction, or even identification, of drug resistant strains in a patient's viral pool.

## Phenotypic Surveillance

### Goals and Examples of Phenotypic Surveillance

<!--Main point: Why do phenotypic surveillance -->

The canonical use of phenotypic surveillance are to determine the drug resistance profile of a pathogen. Such data are usually obtained by isolating the pathogen of interest and culturing them in the presence of an antimicrobial drug. For example, bacterial pathogens are cultured under antibiotic selective media to identify whether it is resistant to that antibiotic. Similar experiments can be conducted for viruses to determine drug resistance, such as for the influenza neuraminidase[@Eichelberger:2008ij].

Beyond drug resistance, other clinically- or epidemiologically-relevant phenotypes may be of interest. For influenza, there are two examples. One is the antigenic distance of an influenza virus to vaccine strains[@Smith:2004jc]; such data are used in the recommendation for updating vaccine strains (See *Fonville et. al.*[@Fonville:2014fr] and the [CDC Website](http://www.cdc.gov/flu/about/season/vaccine-selection.htm).) Antigenic distance is essentially a property of the protein sequence and fold, hence it is, in principle, predictable from sequence, though the current models that do so[@Pan:2011gb] have room for improvement.

The other is pathogenic load. Particular point mutants of the influenza PB2 protein (part of the polymerase complex) has been associated with weight loss, increased immune response, and lung viral titers in mice[@Mok:2011cq]. Likewise, other point mutations in the polymerase genes have been associated with increased replication rate *in vitro*[@Hussein:2016dc; @Fan:2014er; @Subbarao:1993tt; @Mehle:2009ee].

Both assays have been widely used in the literature, but their formats have not been standardized (e.g. different baseline controls, modified procedures). This is understandable, as research groups have access to different baseline viruses. As such, genetic associations with particular phenotypes can only be assessed in an ad-hoc fashion.

## Case Studies

In this section, I outline cases where genomic surveillance helped us gain a scientific understanding of an outbreak.

### Ebola Outbreak

For example, post-outbreak analysis of Ebola genomes showed that cross-border introduction was not a major factor in the outbreak progression[@Park:2015cw].

### Zika Outbreak

### Salmonella Outbreak

### Seasonal Influenza

## References