source("../start.R")

seed <- 2017
n.chains <- 3
n.adapt <- 1000
n.burnin <- 10000
n.iter <- 40000
n.thin <- 1
set.seed(seed)
init.seeds <- sample(1:100000, n.chains)

### set initials ##########################
init.jags <- vector("list", n.chains)
for(i in 1:n.chains){
  init.jags[[i]] <- list(.RNG.name = "base::Wichmann-Hill", .RNG.seed = init.seeds[i])
}


################# model 1 #########################################################
params <- c("CACE", "u1out", "v1out", "s1out", "b1out", 
            "pic", "pin", "pia", "alpha_n", "alpha_a") 
jags.m1 <- jags.model(file="../models/m1.txt", data=data, inits=init.jags, n.chains=n.chains, n.adapt=n.adapt)
update(jags.m1, n.iter=n.burnin) # burn in
samps.m1 <- coda.samples.dic(jags.m1, variable.names=params, n.iter=n.iter, thin=n.thin)

write.table(summary(samps.m1$samples)[[1]], "../outputs/out1_1.txt", sep="\t")
write.table(summary(samps.m1$samples)[[2]], "../outputs/out2_1.txt", sep="\t")
#gelman.diag(samps.m1$samples)
#gelman.plot(samps.m1$samples)

out3_1 <- rep(NA, 3)
out3_1[1] <- samps.m1$dic[[1]] # mean deviance
out3_1[2] <- samps.m1$dic[[2]] # pD
out3_1[3] <- samps.m1$dic[[1]] + samps.m1$dic[[2]]  # DIC
write.table(out3_1, "../outputs/out3_1.txt", sep="\t")


################# model 2 a) #########################################################
params <- c("CACE", "u1out", "v1out", "s1out", "b1out", "pic", "pin", "pia", "sigma_s") 
jags.m2a <- jags.model(file="../models/m2a.txt", data=data, inits=init.jags, n.chains=n.chains, n.adapt=n.adapt)
update(jags.m2a, n.iter=n.burnin) # burn in
samps.m2a <- coda.samples.dic(jags.m2a, variable.names=params, n.iter=n.iter, thin=n.thin)

write.table(summary(samps.m2a$samples)[[1]], "../outputs/out1_2a.txt", sep="\t")
write.table(summary(samps.m2a$samples)[[2]], "../outputs/out2_2a.txt", sep="\t")
out3_2a <- rep(NA, 3)
out3_2a[1] <- samps.m2a$dic[[1]] # mean deviance
out3_2a[2] <- samps.m2a$dic[[2]] # pD
out3_2a[3] <- samps.m2a$dic[[1]] + samps.m2a$dic[[2]]  # DIC
write.table(out3_2a, "../outputs/out3_2a.txt", sep="\t")


################# Model 2 b) #########################################################
params <- c("CACE", "u1out", "v1out", "s1out", "b1out", "pic", "pin", "pia", "sigma_b") 
jags.m2b <- jags.model(file="../models/m2b.txt", data=data, inits=init.jags, n.chains=n.chains, n.adapt=n.adapt)
update(jags.m2b, n.iter=n.burnin) # burn in
samps.m2b <- coda.samples.dic(jags.m2b, variable.names=params, n.iter=n.iter, thin=n.thin)

write.table(summary(samps.m2b$samples)[[1]], "../outputs/out1_2b.txt", sep="\t")
write.table(summary(samps.m2b$samples)[[2]], "../outputs/out2_2b.txt", sep="\t")

out3_2b <- rep(NA, 3)
out3_2b[1] <- samps.m2b$dic[[1]] # mean deviance
out3_2b[2] <- samps.m2b$dic[[2]] # pD
out3_2b[3] <- samps.m2b$dic[[1]] + samps.m2b$dic[[2]]  # DIC
write.table(out3_2b, "../outputs/out3_2b.txt", sep="\t")


################# Model 2 c) #########################################################
params <- c("CACE", "u1out", "v1out", "s1out", "b1out", "pic", "pin", "pia", "sigma_u") 
jags.m2c <- jags.model(file="../models/m2c.txt", data=data, inits=init.jags, n.chains=n.chains, n.adapt=n.adapt)
update(jags.m2c, n.iter=n.burnin) # burn in
samps.m2c <- coda.samples.dic(jags.m2c, variable.names=params, n.iter=n.iter, thin=n.thin)

write.table(summary(samps.m2c$samples)[[1]], "../outputs/out1_2c.txt", sep="\t")
write.table(summary(samps.m2c$samples)[[2]], "../outputs/out2_2c.txt", sep="\t")

out3_2c <- rep(NA, 3)
out3_2c[1] <- samps.m2c$dic[[1]] # mean deviance
out3_2c[2] <- samps.m2c$dic[[2]] # pD
out3_2c[3] <- samps.m2c$dic[[1]] + samps.m2c$dic[[2]]  # DIC
write.table(out3_2c, "../outputs/out3_2c.txt", sep="\t")


################# Model 2 d) #########################################################
params <- c("CACE", "u1out", "v1out", "s1out", "b1out", "pic", "pin", "pia", "sigma_v") 
jags.m2d <- jags.model(file="../models/m2d.txt", data=data, inits=init.jags, n.chains=n.chains, n.adapt=n.adapt)
update(jags.m2d, n.iter=n.burnin) # burn in
samps.m2d <- coda.samples.dic(jags.m2d, variable.names=params, n.iter=n.iter, thin=n.thin)

write.table(summary(samps.m2d$samples)[[1]], "../outputs/out1_2d.txt", sep="\t")
write.table(summary(samps.m2d$samples)[[2]], "../outputs/out2_2d.txt", sep="\t")

out3_2d <- rep(NA, 3)
out3_2d[1] <- samps.m2d$dic[[1]] # mean deviance
out3_2d[2] <- samps.m2d$dic[[2]] # pD
out3_2d[3] <- samps.m2d$dic[[1]] + samps.m2d$dic[[2]]  # DIC
write.table(out3_2d, "../outputs/out3_2d.txt", sep="\t")


################# Model 2 e) #########################################################
params <- c("CACE", "u1out", "v1out", "s1out", "b1out", 
            "pic", "pin", "pia", "alpha_n", "alpha_a", "sigma_n") 
jags.m2e <- jags.model(file="../models/m2e.txt", data=data, inits=init.jags, n.chains=n.chains, n.adapt=n.adapt)
update(jags.m2e, n.iter=n.burnin) # burn in
samps.m2e <- coda.samples.dic(jags.m2e, variable.names=params, n.iter=n.iter, thin=n.thin)

write.table(summary(samps.m2e$samples)[[1]], "../outputs/out1_2e.txt", sep="\t")
write.table(summary(samps.m2e$samples)[[2]], "../outputs/out2_2e.txt", sep="\t")

out3_2e <- rep(NA, 3)
out3_2e[1] <- samps.m2e$dic[[1]] # mean deviance
out3_2e[2] <- samps.m2e$dic[[2]] # pD
out3_2e[3] <- samps.m2e$dic[[1]] + samps.m2e$dic[[2]]  # DIC
write.table(out3_2e, "../outputs/out3_2e.txt", sep="\t")


################# Model 2 f) #########################################################
params <- c("CACE", "u1out", "v1out", "s1out", "b1out", "pic", "pin", "pia", "sigma_a") 
jags.m2f <- jags.model(file="../models/m2f.txt", data=data, inits=init.jags, n.chains=n.chains, n.adapt=n.adapt)
update(jags.m2f, n.iter=n.burnin) # burn in
samps.m2f <- coda.samples.dic(jags.m2f, variable.names=params, n.iter=n.iter, thin=n.thin)

write.table(summary(samps.m2f$samples)[[1]], "../outputs/out1_2f.txt", sep="\t")
write.table(summary(samps.m2f$samples)[[2]], "../outputs/out2_2f.txt", sep="\t")

out3_2f <- rep(NA, 3)
out3_2f[1] <- samps.m2f$dic[[1]] # mean deviance
out3_2f[2] <- samps.m2f$dic[[2]] # pD
out3_2f[3] <- samps.m2f$dic[[1]] + samps.m2f$dic[[2]]  # DIC
write.table(out3_2f, "../outputs/out3_2f.txt", sep="\t")


################# Model 3 a) #########################################################
params <- c("CACE", "u1out", "v1out", "s1out", "b1out", 
            "pic", "pin", "pia", "sigma_a", "sigma_s") 
jags.m3a <- jags.model(file="../models/m3a.txt", data=data, inits=init.jags, n.chains=n.chains, n.adapt=n.adapt)
update(jags.m3a, n.iter=n.burnin) # burn in
samps.m3a <- coda.samples.dic(jags.m3a, variable.names=params, n.iter=n.iter, thin=n.thin)

write.table(summary(samps.m3a$samples)[[1]], "../outputs/out1_3a.txt", sep="\t")
write.table(summary(samps.m3a$samples)[[2]], "../outputs/out2_3a.txt", sep="\t")

out3_3a <- rep(NA, 3)
out3_3a[1] <- samps.m3a$dic[[1]] # mean deviance
out3_3a[2] <- samps.m3a$dic[[2]] # pD
out3_3a[3] <- samps.m3a$dic[[1]] + samps.m3a$dic[[2]]  # DIC
write.table(out3_3a, "../outputs/out3_3a.txt", sep="\t")


################# Model 3 b) #########################################################
params <- c("CACE", "u1out", "v1out", "s1out", "b1out", 
            "pic", "pin", "pia", "sigma_a", "sigma_b") 
jags.m3b <- jags.model(file="../models/m3b.txt", data=data, inits=init.jags, n.chains=n.chains, n.adapt=n.adapt)
update(jags.m3b, n.iter=n.burnin) # burn in
samps.m3b <- coda.samples.dic(jags.m3b, variable.names=params, n.iter=n.iter, thin=n.thin)

write.table(summary(samps.m3b$samples)[[1]], "../outputs/out1_3b.txt", sep="\t")
write.table(summary(samps.m3b$samples)[[2]], "../outputs/out2_3b.txt", sep="\t")

out3_3b <- rep(NA, 3)
out3_3b[1] <- samps.m3b$dic[[1]] # mean deviance
out3_3b[2] <- samps.m3b$dic[[2]] # pD
out3_3b[3] <- samps.m3b$dic[[1]] + samps.m3b$dic[[2]]  # DIC
write.table(out3_3b, "../outputs/out3_3b.txt", sep="\t")

################# Model 3 c) #########################################################
params <- c("CACE", "u1out", "v1out", "s1out", "b1out", 
            "pic", "pin", "pia", "sigma_a", "sigma_u") 
jags.m3c <- jags.model(file="../models/m3c.txt", data=data, inits=init.jags, n.chains=n.chains, n.adapt=n.adapt)
update(jags.m3c, n.iter=n.burnin) # burn in
samps.m3c <- coda.samples.dic(jags.m3c, variable.names=params, n.iter=n.iter, thin=n.thin)

write.table(summary(samps.m3c$samples)[[1]], "../outputs/out1_3c.txt", sep="\t")
write.table(summary(samps.m3c$samples)[[2]], "../outputs/out2_3c.txt", sep="\t")

out3_3c <- rep(NA, 3)
out3_3c[1] <- samps.m3c$dic[[1]] # mean deviance
out3_3c[2] <- samps.m3c$dic[[2]] # pD
out3_3c[3] <- samps.m3c$dic[[1]] + samps.m3c$dic[[2]]  # DIC
write.table(out3_3c, "../outputs/out3_3c.txt", sep="\t")


################# Model 3 d) #########################################################
params <- c("CACE", "u1out", "v1out", "s1out", "b1out", 
            "pic", "pin", "pia", "sigma_a", "sigma_v") 
jags.m3d <- jags.model(file="../models/m3d.txt", data=data, inits=init.jags, n.chains=n.chains, n.adapt=n.adapt)
update(jags.m3d, n.iter=n.burnin) # burn in
samps.m3d <- coda.samples.dic(jags.m3d, variable.names=params, n.iter=n.iter, thin=n.thin)

write.table(summary(samps.m3d$samples)[[1]], "../outputs/out1_3d.txt", sep="\t")
write.table(summary(samps.m3d$samples)[[2]], "../outputs/out2_3d.txt", sep="\t")

out3_3d <- rep(NA, 3)
out3_3d[1] <- samps.m3d$dic[[1]] # mean deviance
out3_3d[2] <- samps.m3d$dic[[2]] # pD
out3_3d[3] <- samps.m3d$dic[[1]] + samps.m3d$dic[[2]]  # DIC
write.table(out3_3d, "../outputs/out3_3d.txt", sep="\t")


################# Model 3 e) #########################################################
params <- c("CACE", "u1out", "v1out", "s1out", "b1out", 
            "pic", "pin", "pia", "sigma_n", "sigma_a")  
jags.m3e <- jags.model(file="../models/m3e.txt", data=data, inits=init.jags, n.chains=n.chains, n.adapt=n.adapt)
update(jags.m3e, n.iter=n.burnin) # burn in
samps.m3e <- coda.samples.dic(jags.m3e, variable.names=params, n.iter=n.iter, thin=n.thin)

write.table(summary(samps.m3e$samples)[[1]], "../outputs/out1_3e.txt", sep="\t")
write.table(summary(samps.m3e$samples)[[2]], "../outputs/out2_3e.txt", sep="\t")

out3_3e <- rep(NA, 3)
out3_3e[1] <- samps.m3e$dic[[1]] # mean deviance
out3_3e[2] <- samps.m3e$dic[[2]] # pD
out3_3e[3] <- samps.m3e$dic[[1]] + samps.m3e$dic[[2]]  # DIC
write.table(out3_3e, "../outputs/out3_3e.txt", sep="\t")


################# Model 4 a) #########################################################
params <- c("CACE", "u1out", "v1out", "s1out", "b1out", 
            "pic", "pin", "pia", "sigma_n", "sigma_a", "sigma_s")  
jags.m4a <- jags.model(file="../models/m4a.txt", data=data, inits=init.jags, n.chains=n.chains, n.adapt=n.adapt)
update(jags.m4a, n.iter=n.burnin) # burn in
samps.m4a <- coda.samples.dic(jags.m4a, variable.names=params, n.iter=n.iter, thin=n.thin)

write.table(summary(samps.m4a$samples)[[1]], "../outputs/out1_4a.txt", sep="\t")
write.table(summary(samps.m4a$samples)[[2]], "../outputs/out2_4a.txt", sep="\t")

out3_4a <- rep(NA, 3)
out3_4a[1] <- samps.m4a$dic[[1]] # mean deviance
out3_4a[2] <- samps.m4a$dic[[2]] # pD
out3_4a[3] <- samps.m4a$dic[[1]] + samps.m4a$dic[[2]]  # DIC
write.table(out3_4a, "../outputs/out3_4a.txt", sep="\t")

################# Model 4 b) #########################################################
params <- c("CACE", "u1out", "v1out", "s1out", "b1out", 
            "pic", "pin", "pia", "sigma_n", "sigma_a", "sigma_b") 
jags.m4b <- jags.model(file="../models/m4b.txt", data=data, inits=init.jags, n.chains=n.chains, n.adapt=n.adapt)
update(jags.m4b, n.iter=n.burnin) # burn in
samps.m4b <- coda.samples.dic(jags.m4b, variable.names=params, n.iter=n.iter, thin=n.thin)

write.table(summary(samps.m4b$samples)[[1]], "../outputs/out1_4b.txt", sep="\t")
write.table(summary(samps.m4b$samples)[[2]], "../outputs/out2_4b.txt", sep="\t")

out3_4b <- rep(NA, 3)
out3_4b[1] <- samps.m4b$dic[[1]] # mean deviance
out3_4b[2] <- samps.m4b$dic[[2]] # pD
out3_4b[3] <- samps.m4b$dic[[1]] + samps.m4b$dic[[2]]  # DIC
write.table(out3_4b, "../outputs/out3_4b.txt", sep="\t")

################# Model 4 c) #########################################################
params <- c("CACE", "u1out", "v1out", "s1out", "b1out", 
            "pic", "pin", "pia", "sigma_n", "sigma_a", "sigma_u") 
jags.m4c <- jags.model(file="../models/m4c.txt", data=data, inits=init.jags, n.chains=n.chains, n.adapt=n.adapt)
update(jags.m4c, n.iter=n.burnin) # burn in
samps.m4c <- coda.samples.dic(jags.m4c, variable.names=params, n.iter=n.iter, thin=n.thin)

write.table(summary(samps.m4c$samples)[[1]], "../outputs/out1_4c.txt", sep="\t")
write.table(summary(samps.m4c$samples)[[2]], "../outputs/out2_4c.txt", sep="\t")

out3_4c <- rep(NA, 3)
out3_4c[1] <- samps.m4c$dic[[1]] # mean deviance
out3_4c[2] <- samps.m4c$dic[[2]] # pD
out3_4c[3] <- samps.m4c$dic[[1]] + samps.m4c$dic[[2]]  # DIC
write.table(out3_4c, "../outputs/out3_4c.txt", sep="\t")

################# Model 4 d) #########################################################
params <- c("CACE", "u1out", "v1out", "s1out", "b1out", 
            "pic", "pin", "pia", "sigma_n", "sigma_a", "sigma_v") 
jags.m4d <- jags.model(file="../models/m4d.txt", data=data, inits=init.jags, n.chains=n.chains, n.adapt=n.adapt)
update(jags.m4d, n.iter=n.burnin) # burn in
samps.m4d <- coda.samples.dic(jags.m4d, variable.names=params, n.iter=n.iter, thin=n.thin)

write.table(summary(samps.m4d$samples)[[1]], "../outputs/out1_4d.txt", sep="\t")
write.table(summary(samps.m4d$samples)[[2]], "../outputs/out2_4d.txt", sep="\t")

out3_4d <- rep(NA, 3)
out3_4d[1] <- samps.m4d$dic[[1]] # mean deviance
out3_4d[2] <- samps.m4d$dic[[2]] # pD
out3_4d[3] <- samps.m4d$dic[[1]] + samps.m4d$dic[[2]]  # DIC
write.table(out3_4d, "../outputs/out3_4d.txt", sep="\t")

################# Model 4 e) #########################################################
params <- c("CACE", "u1out", "v1out", "s1out", "b1out", 
            "pic", "pin", "pia", "Sigma_z")  
jags.m4e <- jags.model(file="../models/m4e.txt", data=data, inits=init.jags, n.chains=n.chains, n.adapt=n.adapt)
update(jags.m4e, n.iter=n.burnin) # burn in
samps.m4e <- coda.samples.dic(jags.m4e, variable.names=params, n.iter=n.iter, thin=n.thin)

write.table(summary(samps.m4e$samples)[[1]], "../outputs/out1_4e.txt", sep="\t")
write.table(summary(samps.m4e$samples)[[2]], "../outputs/out2_4e.txt", sep="\t")

out3_4e <- rep(NA, 3)
out3_4e[1] <- samps.m4e$dic[[1]] # mean deviance
out3_4e[2] <- samps.m4e$dic[[2]] # pD
out3_4e[3] <- samps.m4e$dic[[1]] + samps.m4e$dic[[2]]  # DIC
write.table(out3_4e, "../outputs/out3_4e.txt", sep="\t")



################# Model 5 a) #########################################################
params <- c("CACE", "u1out", "v1out", "s1out", "b1out", 
            "pic", "pin", "pia", "Sigma_z", "sigma_s")  
jags.m5a <- jags.model(file="../models/m5a.txt", data=data, inits=init.jags, n.chains=n.chains, n.adapt=n.adapt)
update(jags.m5a, n.iter=n.burnin) # burn in
samps.m5a <- coda.samples.dic(jags.m5a, variable.names=params, n.iter=n.iter, thin=n.thin)

write.table(summary(samps.m5a$samples)[[1]], "../outputs/out1_5a.txt", sep="\t")
write.table(summary(samps.m5a$samples)[[2]], "../outputs/out2_5a.txt", sep="\t")

out3_5a <- rep(NA, 3)
out3_5a[1] <- samps.m5a$dic[[1]] # mean deviance
out3_5a[2] <- samps.m5a$dic[[2]] # pD
out3_5a[3] <- samps.m5a$dic[[1]] + samps.m5a$dic[[2]]  # DIC
write.table(out3_5a, "../outputs/out3_5a.txt", sep="\t")

################# Model 5 b) #########################################################
params <- c("CACE", "u1out", "v1out", "s1out", "b1out", 
            "pic", "pin", "pia", "sigma_n", "sigma_a", "sigma_b", "sigma_s") 
jags.m5b <- jags.model(file="../models/m5b.txt", data=data, inits=init.jags, n.chains=n.chains, n.adapt=n.adapt)
update(jags.m5b, n.iter=n.burnin) # burn in
samps.m5b <- coda.samples.dic(jags.m5b, variable.names=params, n.iter=n.iter, thin=n.thin)

write.table(summary(samps.m5b$samples)[[1]], "../outputs/out1_5b.txt", sep="\t")
write.table(summary(samps.m5b$samples)[[2]], "../outputs/out2_5b.txt", sep="\t")

out3_5b <- rep(NA, 3)
out3_5b[1] <- samps.m5b$dic[[1]] # mean deviance
out3_5b[2] <- samps.m5b$dic[[2]] # pD
out3_5b[3] <- samps.m5b$dic[[1]] + samps.m5b$dic[[2]]  # DIC
write.table(out3_5b, "../outputs/out3_5b.txt", sep="\t")

################# Model 5 c) #########################################################
params <- c("CACE", "u1out", "v1out", "s1out", "b1out", 
            "pic", "pin", "pia", "sigma_n", "sigma_a", "sigma_u", "sigma_s") 
jags.m5c <- jags.model(file="../models/m5c.txt", data=data, inits=init.jags, n.chains=n.chains, n.adapt=n.adapt)
update(jags.m5c, n.iter=n.burnin) # burn in
samps.m5c <- coda.samples.dic(jags.m5c, variable.names=params, n.iter=n.iter, thin=n.thin)

write.table(summary(samps.m5c$samples)[[1]], "../outputs/out1_5c.txt", sep="\t")
write.table(summary(samps.m5c$samples)[[2]], "../outputs/out2_5c.txt", sep="\t")

out3_5c <- rep(NA, 3)
out3_5c[1] <- samps.m5c$dic[[1]] # mean deviance
out3_5c[2] <- samps.m5c$dic[[2]] # pD
out3_5c[3] <- samps.m5c$dic[[1]] + samps.m5c$dic[[2]]  # DIC
write.table(out3_5c, "../outputs/out3_5c.txt", sep="\t")

################# Model 5 d) #########################################################
params <- c("CACE", "u1out", "v1out", "s1out", "b1out", 
            "pic", "pin", "pia", "sigma_n", "sigma_a", "sigma_v", "sigma_s") 
jags.m5d <- jags.model(file="../models/m5d.txt", data=data, inits=init.jags, n.chains=n.chains, n.adapt=n.adapt)
update(jags.m5d, n.iter=n.burnin) # burn in
samps.m5d <- coda.samples.dic(jags.m5d, variable.names=params, n.iter=n.iter, thin=n.thin)

write.table(summary(samps.m5d$samples)[[1]], "../outputs/out1_5d.txt", sep="\t")
write.table(summary(samps.m5d$samples)[[2]], "../outputs/out2_5d.txt", sep="\t")

out3_5d <- rep(NA, 3)
out3_5d[1] <- samps.m5d$dic[[1]] # mean deviance
out3_5d[2] <- samps.m5d$dic[[2]] # pD
out3_5d[3] <- samps.m5d$dic[[1]] + samps.m5d$dic[[2]]  # DIC
write.table(out3_5d, "../outputs/out3_5d.txt", sep="\t")




################# Model 2 f) Sens 1 ####################################################
params <- c("CACE", "u1out", "v1out", "s1out", "b1out", 
            "pic", "pin", "pia", "alpha_n", "alpha_a", "sigma_a") 
jags.m2f_s1 <- jags.model(file="../models/m2f_s1.txt", data=data, inits=init.jags, n.chains=n.chains, n.adapt=n.adapt)
update(jags.m2f_s1, n.iter=n.burnin) # burn in
samps.m2f_s1 <- coda.samples.dic(jags.m2f_s1, variable.names=params, n.iter=n.iter, thin=n.thin)

write.table(summary(samps.m2f_s1$samples)[[1]], "../outputs/out1_2f_s1.txt", sep="\t")
write.table(summary(samps.m2f_s1$samples)[[2]], "../outputs/out2_2f_s1.txt", sep="\t")

out3_2f_s1 <- rep(NA, 3)
out3_2f_s1[1] <- samps.m2f_s1$dic[[1]] # mean deviance
out3_2f_s1[2] <- samps.m2f_s1$dic[[2]] # pD
out3_2f_s1[3] <- samps.m2f_s1$dic[[1]] + samps.m2f_s1$dic[[2]]  # DIC
write.table(out3_2f_s1, "../outputs/out3_2f_s1.txt", sep="\t")

################# Model 2 f) Sens 2 ######################################################
jags.m2f_s2 <- jags.model(file="../models/m2f_s2.txt", data=data, inits=init.jags, n.chains=n.chains, n.adapt=n.adapt)
update(jags.m2f_s2, n.iter=n.burnin) # burn in
samps.m2f_s2 <- coda.samples.dic(jags.m2f_s2, variable.names=params, n.iter=n.iter, thin=n.thin)

write.table(summary(samps.m2f_s2$samples)[[1]], "../outputs/out1_2f_s2.txt", sep="\t")
write.table(summary(samps.m2f_s2$samples)[[2]], "../outputs/out2_2f_s2.txt", sep="\t")

out3_2f_s2 <- rep(NA, 3)
out3_2f_s2[1] <- samps.m2f_s2$dic[[1]] # mean deviance
out3_2f_s2[2] <- samps.m2f_s2$dic[[2]] # pD
out3_2f_s2[3] <- samps.m2f_s2$dic[[1]] + samps.m2f_s2$dic[[2]]  # DIC
write.table(out3_2f_s2, "../outputs/out3_2f_s2.txt", sep="\t")


############## save out3 tables ###################
out3_1 <- read.table('../outputs/out3_1.txt')
out3_2a <- read.table('../outputs/out3_2a.txt')
out3_2b <- read.table('../outputs/out3_2b.txt')
out3_2c <- read.table('../outputs/out3_2c.txt')
out3_2d <- read.table('../outputs/out3_2d.txt')
out3_2e <- read.table('../outputs/out3_2e.txt')
out3_2f <- read.table('../outputs/out3_2f.txt')
out3_3a <- read.table('../outputs/out3_3a.txt')
out3_3b <- read.table('../outputs/out3_3b.txt')
out3_3c <- read.table('../outputs/out3_3c.txt')
out3_3d <- read.table('../outputs/out3_3d.txt')
out3_3e <- read.table('../outputs/out3_3e.txt')
out3_4a <- read.table('../outputs/out3_4a.txt')
out3_4b <- read.table('../outputs/out3_4b.txt')
out3_4c <- read.table('../outputs/out3_4c.txt')
out3_4d <- read.table('../outputs/out3_4d.txt')
out3_4e <- read.table('../outputs/out3_4e.txt')
out3_5a <- read.table('../outputs/out3_5a.txt')
out3_5b <- read.table('../outputs/out3_5b.txt')
out3_5c <- read.table('../outputs/out3_5c.txt')
out3_5d <- read.table('../outputs/out3_5d.txt')
# out3_2f_s1 <- read.table('../outputs/out3_2f_s1.txt')
# out3_2f_s2 <- read.table('../outputs/out3_2f_s2.txt')

out3_12 <- cbind(out3_1, out3_2a, out3_2b, out3_2c, out3_2d, out3_2e, out3_2f)
out3_3 <- cbind(out3_3a, out3_3b, out3_3c, out3_3d, out3_3e)
out3_4 <- cbind(out3_4a, out3_4b, out3_4c, out3_4d, out3_4e)
out3_5 <- cbind(out3_5a, out3_5b, out3_5c, out3_5d)
# out3_sens <- cbind(out3_2e, out3_2f_s1, out3_2f_s2)
write.table(out3_12, "../outputs/out3_m12.txt", sep="\t")
write.table(out3_3, "../outputs/out3_m3.txt", sep="\t")
write.table(out3_4, "../outputs/out3_m4.txt", sep="\t")
write.table(out3_5, "../outputs/out3_m5.txt", sep="\t")
# write.table(out3_sens, "../outputs/out3_sens.txt", sep="\t")
