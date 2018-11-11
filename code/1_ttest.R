# Import a csv file
mice = read.csv(".../1_normal_mutant.csv")

# Check if we imported a correct one
print(mice)

# Get basic statistics
summary(mice)

# T-test between two groups (Normal vs Mutant) for gene 1
t.test(mice$g1_n, mice$g1_m, alternative="greater")

# T-test between two groups (Normal vs Mutant) for gene 2
t.test(mice$g2_n, mice$g2_m, alternative="greater")
