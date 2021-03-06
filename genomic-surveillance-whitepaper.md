---
title: "Genotypic and Phenotypic Measurements for Real-Time Pathogen Surveillance"
author:
- name: "Eric J. Ma"
  affiliation: MIT
- name: "Jonathan A. Runstadler"
  affiliation: "MIT"
date: 22 June 2016
csl: pnas.csl  # references style; we're using PNAS.
numbersections: True  # numbers sections automatically
toc: True  # table of contents
lof: True  # list of figures
lot: True  # list of tables
---

# Key Points Overview

1. We are at a stage where genomic sequencing of outbreak pathogens is becoming routine for bacterial and viral pathogens.
1. The key challenge we will face is in interpreting the sequence data beyond phylogenetic reconstructions. The ideal would be inferring a pathogen's virulence.
1. We argue that significant investments are needed to generate a densely measured and appropriately standardized dataset of phenotype measurements paired with the appropriate sequences.

# Abstract

One goal of genomic surveillance is to predict the potential harm to human health that a pathogen can inflict, based on its sequence. Having this ability could dramatically reduce the time required to determine drug resistance, antigenic sensitivity, and perhaps even virulence. One potential way to accomplish this is to use machine learning to learn the mapping from viral sequence to phenotype. However, the data necessary to accomplish this are not available. Here, we broadly outline the state-of-the-art in genomic data collection, data warehousing, and pathogen characterization, and find that our capability to perform phenotypic interpretation of genomic data is limited by available comparison data. We also propose an experimental strategy for systematically characterizing a protein for its biochemical phenotype, argue for its relevance in interpreting a pathogen's genome for virulence, and propose a way to integrate machine learning methods with the data as part of a surveillance dashboard.

# Genomic Surveillance

## Purpose of Genomic Surveillance

Genomic surveillance refers to the sequencing of a new viral or bacterial pathogen after its outbreak in humans. The goals (otherwise stated as the 'expected utility') of sequencing a pathogen include:

1. identifying the outbreak source using comparative genomics,
2. describing and modelling the geographical movement of the virus,
3. forecasting the strains that will cause the next outbreaks, and
4. computing the predicted risk that a virus will have in the outbreak scenario.

From a public health perspective, a valuable outcome of genomic surveillance is being able to connect the presence of "hallmark mutations" to decision-making. As it currently stands, the logic can be summarized as in Figure {@fig:geno-policy}.

![Connecting gene sequence of a pathogen to decision-making. A crucial step is being able to accurately link epidemiologically- and clinically-relevant phenotypic traits to gene sequences, which in turn allows for better prediction of a virus' risk.](images/genomic-interpretation-to-policy.png){#fig:geno-policy}

As we will argue later in this white paper, the crucial systematic data link between genotype and phenotype is missing for a broad range of relevant phenotypes (red arrows in Figure {@fig:geno-policy}), with HIV drug resistance being the only exception known.

Sequencing an outbreak pathogen also allows us to gain useful insights into its evolutionary history. Integrating the new viral sequence data together with existing ones can help us identify the viruses that share a common ancestor with the outbreak virus and its probable geographic movement history [@Lemey:2010eu; @Lemey:2009wn; @Fusaro:2011eg].

This knowledge can inform epidemiology and biosecurity efforts. For example, knowing that cross-geopolitical border movement is not a factor in the spread of an agent can help a country avoid unnecessary economic damage that may result, allowing limited manpower and financial resources to be devoted to other spread prevention measures. This point, in particular, was alluded to in the 2014 Ebola outbreak [@Park:2015cw].

Additionally, crucial epidemiological parameters, such as the basic reproductive number (R~0~) of the pathogen, can be estimated simultaneously with phylogenies [@Gardy:2015fp]. As a final example, a study integrating Bayesian phylogeography with ecosystem information showed that wild birds were responsible for the spread of avian influenza between domestic birds in different geographic areas [@Bahl:2016efa]. Tightening biosecurity around animal farms would be the logical epidemiological course of action. Taken together, the value of sampling new outbreaks and continued surveillance and cannot be overstated.

## Genome Sequencing

Crucial to genomic surveillance is the capacity to sequence pathogens soon after its isolation. While traditional Sanger and Next Generation Sequencing methods have been used, here we would like to focus on the development of portable, handheld sequencers, exemplified by the MinION (Oxford Nanopore Technologies). With the advent of these devices, sequencing soon after isolation is rapidly becoming a possibility. Pilot experiments with MinION showed that samples can be sequenced within days of collection [@Quick:2016kf], sometimes within just 24 hours, and can return analyzable sequence reads within minutes to hours of beginning a sequence run [@Quick:2015ko]. This, in principle, opens up the possibility of rapid identification of possible pathogenic agents from a patient, potentially faster than a live culture might take.

The core challenges that remain for the MinION, as applied to genomic surveillance for pathogen outbreaks, are similar to the challenges for other sequencing platforms, namely (from *Quick et. al.* [@Quick:2015ko]):

1. monetary cost of sample prep reagents,
2. labour, and hence time required, for sample preparation, and
3. target enrichment from mixed samples.

Additionally, the MinION still requires improvements to its read accuracy. While the sequence reads are sufficiently accurate to detect antimicrobial resistance gene cassettes, it still does not have the necessary accuracy to identify point mutations associated with antibiotic resistance [@Judge:2015jr]. Estimates for read accuracy currently are between 60%-85%, as determined by pilot studies [@Hoenen:2016fo; @Ashton:2015ff]. Better modelling will enable fast read mapping [@Loose:2016gr] to reference sequences and greater accuracy [@Jain:2015ij], greatly increasing the value of deploying these sequencers. In the long-run, being able to resolve single nucleotide differences in real-time on portable sequencers would be considered most ideal.

## Sequence Databases

Without publicly accessible sequence databases, the sequence data collected remain of little utility to the broader scientific community. Publicly accessible sequence databases enable meta- and global studies of pathogens [@Ma:2016ht; @Wertheim:2013de], and data mining can be conducted where rich metadata are available.

The influenza research and surveillance community has the **Influenza Research Database (IRD)** [@Squires:2012fx] as a public repository of viral sequences isolated through surveillance efforts globally. Here, not only are the sequences stored, valuable metadata including date and country of collection, and the viral host, are stored and easily accessible in the default interface. Additional ecological metadata are also stored, such as the age of wild birds when collecting, enabling studies into the interplay between host and viral ecology [@Hill:2016dh; @Bahl:2016efa].

The HIV research community also has benefited from the **HIV Sequence Database** maintained by the Los Alamos National Laboratory[^lanl], as well as the **Stanford HIV Drug Resistance Database**[^hivdb]. In particular, the utility of a drug resistance database has been articulated [@Shafer:2006go], including the identification of genomic correlates of drug resistance. From the perspective of genomic surviellance, the sharing of this data has enabled the development of machine learning tools that can automatically predict viral properties from sequence [@Hepler:2014fy], which can enable rapid prediction, or even identification, of drug resistant strains in a patient's viral pool.

[^lanl]: http://www.hiv.lanl.gov/content/index
[^hivdb]: http://hivdb.stanford.edu

# Phenotypic Surveillance

## Goals and Examples of Phenotypic Surveillance

The canonical use of phenotypic surveillance are to determine the drug resistance profile of a pathogen. Such data are usually obtained by isolating the pathogen of interest and culturing them in the presence of an antimicrobial drug. For example, bacterial pathogens are cultured under antibiotic selective media to identify whether it is resistant to that antibiotic. Similar experiments can be conducted for viruses to determine drug resistance, such as for the influenza neuraminidase [@Eichelberger:2008ij].

Beyond drug resistance, other clinically- or epidemiologically-relevant phenotypes may be of interest. For influenza, there are two examples. One is the antigenic distance of an influenza virus to vaccine strains [@Smith:2004jc]; such data are used in the recommendation for updating vaccine strains (See *Fonville et. al.* [@Fonville:2014fr] and the [CDC Website](http://www.cdc.gov/flu/about/season/vaccine-selection.htm).) Antigenic distance is essentially a property of the protein sequence and fold, hence it is, in principle, predictable from sequence, though the current models that do so [@Pan:2011gb] have room for improvement.

The other is pathogenic load. Particular point mutants of the influenza PB2 protein (part of the polymerase complex) have been associated with weight loss, increased immune response, and lung viral titers in mice [@Mok:2011cq]. Likewise, other point mutations in the polymerase genes have been associated with increased replication rate *in vitro* [@Hussein:2016dc; @Fan:2014er; @Subbarao:1993tt; @Mehle:2009ee].

Both assays have been widely used in the literature, but their formats have not been standardized. (By lack of standardization, we mainly refer to having varied baseline controls, and hence normalization, but also variance in procedures.) This is understandable, as research groups have access to different baseline viruses. Nonetheless, such lack of standardization hampers comparisons between experiments. As such, genetic associations with particular phenotypes can only be assessed in an ad-hoc fashion. This type of data has been useful to a certain extent, and published ad-hoc studies have led to the development of Sequence Feature Variant Types (SVFTs) in the [IRD](http://www.fludb.org/brc/influenza_sequenceFeatureVariantTypes_search.spg?method=ShowCleanSearch&decorator=influenza). These data have been used to identify associations between influenza NS1 protein variants and host range [@Noronha:2012hc], but the data suffer from collection biases and a lack of standardized controls on which fair comparisons between them can be made. The authors also acknowledge this.

By contrast, the HIV Drug Resistance Database contains a wealth of densely measured drug resistance phenotype data for more than 10^3^-10^4^ viral isolates. On the basis of this data, multiple papers have been published that investigate the performance of a variety of algorithms on classifying HIV drug resistance from sequence [@Beerenwinkel:2002cza; @Harrison:2013hs; @Heider:2013gd; @Heider:2011bf; @Wu:2011iv; @Prosperi:2009ua; @Heider:2010io]. While there are weaknesses in each approach (e.g. learning capacity, interpretability), it is clear that the computational technology required for making such predictions are available.

# Case Studies

In this section, we summarize cases where genomic surveillance helped us gain a scientific understanding of a pathogen. Particular focus is given to the insights gained from genomic information, while also highlighting the gaps that are present.

## Ebola Surveillance

In 2014, Ebola virus spread rapidly through Sierra Leone, Guinea and Liberia. This outbreak was a deadly one, with case fatality rates ranging between 43-86% (where sample sizes are greater than 5) [@Gatherer:2014fp; @Baize:2014gx; @WHOEbolaResponseTeam:2014eo]. There was considerable media attention, and this heightened fears of a global spread of this deadly virus.

Genomic surveillance of the virus involved obtaining sequences from patient samples. During the outbreak, polymerase chain reaction-based (PCR) testing was widely used [@Frieden:2014fv]. On the other hand, sequencing was more difficult, with sufficient genomic material being required; in one study, only 3 patient samples that had high viral loads were sequenced [@Baize:2014gx].

A pair of studies led by Pardis Sabeti's group provided a global view into the evolution of the Ebola virus during the outbreak. The first study [@Gire:2014fk] was published based on 99 genomes from 78 patients. Phylogeographic analysis of the virus helped determine that the virus (1) likely came from central Africal lineages, (2) with the time of crossing into Guinea and Sierra Leone being May 2014, and that (3) there was no evidence of additional zoonotic spillovers.

The second study [@Park:2015cw] involved an expanded set of genome sequences from 232 patients in addition to 86 previously released genomes. Phylogeographic analysis showed that there was very little cross-border movement of the virus; this implied that the epidemiological intervention of closing borders would likley have little effect on the spread. Additionally, the authors found that there were intra-host genomic variants shared between patients, likely indicating that the infectious dose size was large enough to allow for this to happen. Non-synonymous mutations decreased over time, likely indicating purifying selection against deleterious variants.

Some unique features of the Sabeti lab's efforts was their radical transparency in releasing the genome sequences publicly, and their collaborative and public paper writing. All of the sequences were released to NCBI as soon as they were available[^ncbi], while the paper was written collaboratively with edit history on Authorea[^authorea].

[^ncbi]: http://www.ncbi.nlm.nih.gov/bioproject/PRJNA257197
[^authorea]: https://www.authorea.com/users/10734/articles/19957

Apart from the two in-depth studies on Ebola, the outbreak also served as a testing ground for new technologies. In a study [@Quick:2015ko] led by Joshua Quick, the MinION sequencer was deployed during the outbreak, and data from the sequencing efforts showed that sequences could be obtained within 24 hours of sample collection. While the MinION currently still suffers from read accuracy issues, this test clearly illustrated the future possibility of real-time genomic surveillance.

Taking the 2014 Ebola outbreak as an example, currently the best insights that we can gain from viral genome sequences (where no systematic phenotypic data are available), include:

1. Geographic movement
1. Dating of spillover and introduction events
1. Mapping of transmission patterns

However, our ability to predict how a virus' phenotype from sequence is still limited, as noted by the absence of such predictions for the Ebola virus.

## *Salmonella* Surveillance

*Salmonella* surveillance has traditionally been done by pulse field gel electrophoresis. This method, however, has limited capability to discriminate between outbreak strains [@denBakker:2014ke]. Given the technologies currently available, we would hesitate to call this a "genomic" form of surveillance. In recent years, however, there have been studies that used whole genome sequencing of *salmonella*, and insights from those studies show the potential for genomic surveillance.

For example, den Bakker et. al. [@denBakker:2014ke] investigated the practicality of whole genome sequencing in an outbreak setting using IonTorrent PGM sequencers. The key parameter for an outbreak scenario is the speed of sequencing; the authors were able to achieve a peak throughput of 32 samples within 8 days of sequencing.

In a more recent study, Quick et. al. [@Quick:2015ko] used a rapid MiSeq protocol, cutting the sequencer runtime from 55 hours to 6 hours, though with the tradeoff of reducing the mean sequence coverage. They also used the MinION, and using the "streaming" sequencing data, they were able to a species-level identification of their *Salmonella* patient samples within minutes of sequencing, and within hours determine whether a pathogen is part of an outbreak or not.

Because the MinION is capable of doing long reads, it has also been used to resolve the genomic position of antibiotic resistance islands [@Ashton:2015ff]. This undoubtedly has advantages over short read sequencing; as a whole genome sample may contain a mixture of microorganisms, long reads help with "phasing" a sequence to its genomic context.

From a practitioners perspective, it is quite clear that genome sequencing technologies can be deployed in a clinical setting, and that technological and cost hurdles are progressively being removed. What remains is our capability to interpret the genome sequences appropriately.

The current state-of-the-art in genome interpretation for bacterial pathogens is roughly at the same place as for viral pathogens, with antibiotic resistance genes being the only exception. There are two recent studies of distinct *Salmonella* lineages that we would like to highlight here.

The first was a study of 315 *S. Typhimurium DT104* isolates sampled from 1969-2012 [@Leekitcharoenphon:2016cf]. The authors here used Bayesian phylogenetic reconstruction to identify the times of divergence and effective population size over time of the global *Salmonella* pool. Because whole genome sequence was available, they were also able to identify the movement of a 13 kilobase multi-drug resistance over space and time.

A similar study was conducted for the multi-drug resistant *S. typhi* lineage H58 [@Wong:2015bi]. By using phylogeographic analysis, the authors were able to trace the spread of antibiotic resistance genes, and show that this drug resistant lineage was expanding globally over time.

As seen from above two recent examples, the key genomic tool for interpreting the genome has been phylogenetic methods. This is similar to the state-of-the-art in viral surveillance. Phenotypic interpretation remains limited to antibiotic resistance, for this has been one phenotype where the presence or absence of a single gene (and its variants) is sufficient to confer a resistance phenotype. Other aspects of *Salmonella*'s virulence have not been amenable to interpretation, and hence the prevailing literature does not deal with this.

## Seasonal Influenza Surveillance

# Challenges Ahead

- The inherent tension between the goals of extinguishing an outbreak asap, vs. collecting sufficient numbers of patients and data for vaccine & drug development, etc. [@Cohen:2016fza] (this is a broad tension of the field of infectious disease, not a specific one to any problem)

# The missing pieces

**Proper phenotypic interpretation from sequence requires a comprehensive and representative comparison set.** The key gap here is the lack of a systematically standardized set of phenotype measurements that are paired with gene sequences. By representative, we mean that the sequences present in the dataset are those that are evolutionarily successful. By comprehensive, we mean that there should be coverage of all known mutations that from successful isolates. The data that are required essentially are a densely measured matrix of sequence (large `n` >10^3^) by phenotype, as illustrated in the Table {@tbl:schema}.

| Sequence | Pheno1 | Pheno2 | Pheno3 | Pheno4 |
|----------|--------|--------|--------|--------|
| MKLV...  | 1.9    | 1.8    | 2.4    | 1.8    |
| MKLR...  | 2.2    | 2.7    | 10.3   | 1.9    |
| MRLV...  | 2.5    | 2.7    | 2.3    | 1.9    |
|   ...    | ...    | ...    | ...    | ...    |

Table: Table schema of data required for rationally and systematically interpreting phenotype from genotype. {#tbl:schema}

<!--Is deep mutational scanning a useful thing to do for genomic surveillance? Refer to Jesse Bloom's papers. -->

# References
