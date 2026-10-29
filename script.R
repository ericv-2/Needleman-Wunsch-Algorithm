blossum50 <- read.table("blossum50.txt")

s1 <- "BEAVTY"
s2 <- "BEAST"
gap <- 0

#Splitting the input
s1v <- strsplit(s1, split = "")[[1]] 
s2v <- strsplit(s2, split = "")[[1]]

#Aux Matrix
aux <- matrix(nrow = length(s1v) + 1, ncol = length(s2v) + 1)
rownames(aux) <- c("-", s1v)
colnames(aux) <- c("-", s2v)
aux[1, ] <- 0
aux[, 1] <- 0

#Filling Aux Matrix with BLOSSUM values
for(i in 2:nrow(aux)){
  for(j in 2:ncol(aux)){
    x <- s1v[i-1]
    y <- s2v[j-1]
    aux[i,j] <- blossum50[x,y]
  }
}

#Score Matrix
score <- matrix(nrow = length(s1v) + 1, ncol = length(s2v) + 1)
rownames(score) <- c("-", s1v)
colnames(score) <- c("-", s2v)
score[1, ] <- 0
score[, 1] <- 0

#Direction Matrix
dir <- matrix(nrow = length(s1v) + 1, ncol = length(s2v) + 1)
rownames(dir) <- c("-", s1v)
colnames(dir) <- c("-", s2v)
dir[1, ] <- "←"
dir[, 1] <- "↑"
dir[1,1] <- "·"

#Score Matrix and Recording Directions
for(i in 2:nrow(aux)){
  for(j in 2:ncol(aux)){
    up = score[i-1, j] + gap
    left = score[i, j-1] + gap
    diag = score[i-1, j-1] + aux[i,j]
    score[i,j] = max(up, left, diag)
    
#Recording in the Dir Matrix ("diag" first because it has priority)
    if (score[i,j] == diag) {
      dir[i,j] = "↖"
    } else if (score[i,j] == up) {
      dir[i,j] = "↑"
    } else if (score[i,j] == left) {
      dir[i,j] = "←"
    } 
  }
}

#Doing the alignment
i <- length(s1v) + 1
j <- length(s2v) + 1
align_si <- character(0)
align_sj <- character(0)
while(dir[i,j] != dir[1,1]){
  if (dir[i,j] == "↖"){
    i = i-1
    j = j-1
    align_si <- c(align_si, s1v[i])
    align_sj <- c(align_sj, s2v[j])
    
  } else if (dir[i,j] == "↑"){
    i = i-1
    align_sj <- c(align_sj, "-")
    align_si <- c(align_si, s1v[i])
    
  } else if (dir[i,j] == "←"){
    j = j-1
    align_sj <- c(align_sj, s2v[j])
    align_si <- c(align_si, "-")
  }
}

#Reverse the final alignment
final_i <- rev(align_si)
final_j <- rev(align_sj)
final_score <- score[nrow(score), ncol(score)]

#Print the result
cat("The final alignment is:\n", final_i, "\n", final_j, "\n", "Score: ",
    final_score, sep = "")
