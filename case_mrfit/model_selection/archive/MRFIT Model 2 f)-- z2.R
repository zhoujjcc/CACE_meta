setwd('/linux/jinchenz/research')
source("start.R")
#########################################
####  2. f) random delta_z2
modelString="
model{
for (i in 1:n) {

R[i, ] ~ dmulti(prob[i, 1:8], Ntol[i])

prob[i, 1] <- (1-r[i])*(pi_n[i]*(1-s1[i]) + pi_c[i]*(1-v1[i]))
prob[i, 2] <- (1-r[i])*(pi_n[i]*s1[i] + pi_c[i]*v1[i])
prob[i, 3] <- (1-r[i])*(pi_a[i]*(1-b1[i]))
prob[i, 4] <- (1-r[i])*(pi_a[i]*b1[i])
prob[i, 5] <- r[i]*(pi_n[i]*(1-s1[i]))
prob[i, 6] <- r[i]*(pi_n[i]*s1[i])
prob[i, 7] <- r[i]*(pi_c[i]*(1-u1[i])+pi_a[i]*(1-b1[i]))
prob[i, 8] <- r[i]*(pi_c[i]*u1[i]+pi_a[i]*b1[i])

probit(u1[i]) <- alpha_u
probit(v1[i]) <- alpha_v

z1[i] <- alpha_z1 
z2[i] <- alpha_z2 + delta_z2[i]
delta_z2[i] ~ dnorm(0, tau_z2)
pi_n[i] <- exp(z1[i])/(1+exp(z1[i])+exp(z2[i]))
pi_a[i] <- exp(z2[i])/(1+exp(z1[i])+exp(z2[i]))
pi_c[i] <- 1-pi_a[i]-pi_n[i]

logit(s1[i]) <- alpha_s1 
logit(b1[i]) <- alpha_b1
} 

CACE <- phi(alpha_u)-phi(alpha_v)

pin <- exp(alpha_z1)/(1+exp(alpha_z1)+exp(alpha_z2))
pia <- exp(alpha_z2)/(1+exp(alpha_z1)+exp(alpha_z2))
pic <- 1-pia-pin
u1out <- phi(alpha_u)
v1out <- phi(alpha_v)
s1out <- ilogit(alpha_s1)
b1out <- ilogit(alpha_b1)

# priors
alpha_z1~  dnorm(0, 0.16)
tau_z2 ~ dgamma(2, 2)
sigma_z2 <- 1/sqrt(tau_z2)
alpha_z2 ~ dnorm(0, 0.16)

alpha_s1 ~  dnorm(0, 0.25)
alpha_b1 ~  dnorm(0, 0.25)

alpha_u ~  dnorm(0, 0.25)
alpha_v ~  dnorm(0, 0.25)
}"
  
writeLines(modelString, con="MRFIT_m2f.txt")

params <- c("CACE", "u1out", "v1out", "s1out", "b1out", "pic", "pin", "pia", "sigma_z2") 

Inits1 <- list("alpha_z1"= 1, "alpha_z2"= 1, "alpha_s1"= 1, "alpha_b1"= 1, "alpha_u"=1, "alpha_v"=2, 
               "tau_z2"=0.5, .RNG.name="base::Wichmann-Hill", .RNG.seed=1)
Inits2 <- list("alpha_z1"= 0, "alpha_z2"= 0, "alpha_s1"= 0, "alpha_b1"= 0, "alpha_u"=0, "alpha_v"=1, 
               "tau_z2"=2, .RNG.name="base::Wichmann-Hill", .RNG.seed=1)
Inits=list(Inits1,Inits2)

################# rjags code #########################################################
jags.m2f <- jags.model(file="MRFIT_m2f.txt", data=data, inits=Inits, n.chains=2, n.adapt=2000)
update(jags.m2f, n.iter=5000) # burn in
samps.m2f <- coda.samples.dic(jags.m2f, variable.names=params, n.iter=20000, thin=5)

setwd('/linux/jinchenz/research')
write.table(summary(samps.m2f$samples)[[1]], "out1_2f.txt", sep="\t")
write.table(summary(samps.m2f$samples)[[2]], "out2_2f.txt", sep="\t")

out3_2f <- rep(NA, 3)
out3_2f[1] <- samps.m2f$dic[[1]] # mean deviance
out3_2f[2] <- samps.m2f$dic[[2]] # pD
out3_2f[3] <- samps.m2f$dic[[1]] + samps.m2f$dic[[2]]  # DIC
write.table(out3_2f, "out3_2f.txt", sep="\t")
