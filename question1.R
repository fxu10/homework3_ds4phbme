dat <- readFileList('./kirby_3_1_ax_283Labels_M2_corrected_stats.txt',
                   idList='./kirby_3_1_ax_283Labels_M2_corrected_stats.txt')

dat <- filter(dat,type==1,level==1)
ICV <- as.numeric(colSums(select(dat,"volume")))

print(c("Inter Cranial Volume: ", ICV))