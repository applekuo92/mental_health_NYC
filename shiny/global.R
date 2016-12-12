
test<- "Think of how stingy you are with your money: if someone on the street asks for $10, you're not giving it to them. There's no way you're giving a 30% tip for a normal dining experience. And so on.And yet so many of us just waste ungodly amounts of our time. We throw it away, every day. I know I do unless I'm careful. What helps me to not waste time is to see it as an investment, and to keep track of the returns I get for my investment."

library(tm)


params <- readRDS("dictionary.RDS")

pcamod <- readRDS("PCA.RDS")

regmod <- readRDS("LogReg.RDS")

