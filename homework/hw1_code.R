## 1a
yij2 <- 5185.5
y1dot <- 50
y2dot <- 75
y3dot <- 100
y4dot <- 90
y5dot <- 60

## treatment
y_margin <- c(y1dot, y2dot, y3dot, y4dot, y5dot)
ydotdot <- sum(y_margin)
ni <- 6
N <- 30

fn_error <- function(x){
  a <- (x/ni - ydotdot/N)^2
  return(a)
}

trt <- c(rep(0,length(y_margin)))
for(i in 1:length(y_margin)){
  trt[i] <- fn_error(y_margin[i])
}

ss_trt <- sum(trt)

## error
sse <- yij2 - 11/6*ydotdot

## total
ss_tot <- yij2 - 2*(375^2/60) + (375/30)^2

ss_tot <- 5185.5-(375^2)/30
ss_trt <- (50^2 + 75^2 + 100^2 + 90^2 + 60^2)/6 - (375^2)/30 
sse <- ss_tot-ss_trt
ss_tot/29
ss_trt/4
sse/25

70.83/8.59
#1b

qf(0.99,4,25)
qf(0.95,4,25)
qf(0.90,4,25)

#3a
d20 <- c(24,28,37,30)
d30 <- c(37,44,34,35)
d40 <- c(42,47,52,38)

mu_hat <- mean(c(d20,d30,d40))
d20_mean <- mean(d20)
d30_mean <- mean(d30)
d40_mean <- mean(d40)
mu_hat
d20_mean
d30_mean
d40_mean
mu_hat 
d20_mean + d40_mean - d30_mean

4*(d20_mean)
4*(d30_mean)
4*(d40_mean)

# 3d
37.3+7.45
37.5+7.25
2*7.45 + 7.55 - 0.2
2*7.25 + 7.75 - 0
3*(-7.55) - 2*0.2 -7.45
3*(-7.75) - 2*0 - 7.25
37.3 - 7.55 + 0.2 +7.45
37.5 - 7.75 + 0 + 7.25
44.75-37.5
29.75-37.5

#4 OVENS
o1 <- c(491.5,498.3, 498.1, 493.5,493.6)
o2 <- c(488.5, 484.65, 497.9, 477.35)
o3 <- c(490.1, 484.8, 488.25, 473, 471.85, 478.65)
oven <- c(c(rep("o1",length(o1))), c(rep("o2", length(o2))), c(rep("o3", length(o3))))

ovens <- data.frame(cbind(c(o1,o2,o3), oven))

colnames(ovens) <- c("temp", "oven")

lm_oven <- lm(as.numeric(as.character(temp)) ~ as.factor(oven), data = ovens)
require(car)
Anova(lm_oven, type = "III")
aov(lm_oven)

#4d 
mean(o1)
length(o1)

mean(o2)
length(o2)

mean(o3)
length(o3)
mean(c(o1,o2,o3))

#7
d20 <- c(28,37,30)
d30 <- c(37,44,34,35)
d40 <- c(42,47,52,38)
d_mean <- sum(c(d20,d30,d40))/11
d20_mean <- mean(d20)
d30_mean <- mean(d30)
d40_mean <- mean(d40)

d20_mean - d_mean
d30_mean - d_mean
d40_mean - d_mean

sum(d20)
sum(d30)
sum(d40)
