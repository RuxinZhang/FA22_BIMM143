library(bio3d)


## Q7:

# import FASTA alignment
alignment <- read.fasta('alignment', rm.dup = TRUE, to.upper = FALSE, to.dash=TRUE)

# calculate a sequence identity matrix for the multiple alignments
seq_id_matrix <- seqidentity(alignment, normalize=TRUE, similarity=FALSE, ncore=1, nseg.scale=1)

# plot the sequence identity matrix as a heatmap
heatmap(seq_id_matrix)



## Q8
"

# find the consensus sequence for the aligned sequences
consensus_seq <- consensus(alignment)
# blast the consensus sequence against the main protein database to find the most similar atomic resolution structures to the aligned sequences 
res.balst <- blast.pdb(consensus_seq)

Kinesin structures vary a lot and the compared sequences were not similar. An meaingful consensus sequence simply doesn't exist,
  and therefore blasting against this consequence seqeuence won't return valid structures.

In this case the ERROR message is basically saying NO MATCH FOUND

reference: https://www.biostars.org/p/13643/

"

#  "In this case you could chose the sequence with the highest identity to all others 
#     in your alignment by calculating the row-wise maximum from your sequence identity matrix." - Barry

rowSums(seq_id_matrix)

# the Firebelly_salamander (our first BLAST result) has the highest score, continue with this sequence

"
chose BLAST result over EMBOSS Transeq because Transeq-generated sequences contain stop condon in all 6 frames.
"
# import salamander FASTA
salamander <- read.fasta('salamander_sequence', rm.dup = TRUE, to.upper = FALSE, to.dash=TRUE)

# blast
res.blast <- blast.pdb(salamander)

# the results of blast.pdb() contain the hits PDB identifier (or pdb.id) as well as Evalue and identity
# http://thegrantlab.org/bio3d/reference/blast.pdb.html

head(res.blast$hit.tbl)
top.hits <- plot(res.blast)
head(top.hits$hits)

top.hits <- plot.blast(res.blast, cutoff=358)
get.pdb(top.hits)

#annotate
pdb.annotate("1x88_A")
pdb.annotate("1II6_A")
pdb.annotate("3HQD_A")



## Q9:


