# Import a csv file
  gene1n2 <- read.csv(".../2_normal_mutant_double.csv")

# Check if we imported correct one
  print(gene1n2)

# Subset the data for gene 1 only
  gene1 <- gene1n2[gene1n2[,"gene"] == 1,]
  print(gene1)

# Transform numeric value to factor
  gene1 <- transform(gene1, type = factor(type))
  print(gene1)

# Check if we transformed the data correctly
  class(gene1$type)

# Boxplot by mutatation types (Gene 1 only)
  boxplot(value~type,data=gene1, xlab="Mutation Lvel (Gene 1): Normal(1)    /    Mutant(2)     /    DoubleMutant(3)", ylab = "Expression Value")

# Basic statistics by mutation type (Gene 1 only)
  tapply(gene1$value, gene1$type, summary)

# ANOVA test
  anova1 <- aov(value~type, data=gene1)

# Display more details of results
  summary(anova1)



# ========================== Same process for Gene 2 ======================================================================


gene2 <- gene1n2[gene1n2[,"gene"] == 2,]
print(gene2)
gene2 <- transform(gene2, type = factor(type))
print(gene1)
class(gene1$type)

boxplot(value~type,data=gene2, xlab="Mutation Lvel (Gene 2): Normal(1)    /    Mutant(2)     /    DoubleMutant(3)", ylab = "Expression Value")
tapply(gene2$value, gene2$type, summary)
anova2 <- aov(value~type, data=gene2)
summary(anova2)
