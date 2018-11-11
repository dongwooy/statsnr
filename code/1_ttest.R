# Import a csv file
mice = read.csv("불러올 파일의 경로를 입력하시오")

# Check if we imported a correct one
print(mice)

# Get basic statistics
summary(mice)

# T-test between two groups (Normal vs Mutant) for gene 1
t.test(mice$g1_n, mice$g1_m, alternative="greater")

# T-test between two groups (Normal vs Mutant) for gene 2
t.test(mice$g2_n, mice$g2_m, alternative="greater")
