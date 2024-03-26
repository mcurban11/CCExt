data {
  int<lower=0> N; // total
  int<lower=0> S; // number of studies
  int<lower=0> P; // number of predictors
  vector[N] percent;  // Percent extinction
  matrix[N,P] betamat;  // factors
  int Study[N];  // Study random effect
  vector[N] phi;  // per-study sigma
}
parameters {
  vector[S] stu;    // Study random effect
  real<lower=0> sigma_stu; //Study intercepts 
  vector[P] beta;            // pre-industrial effect
  real<lower=0> tau;    // deviation of treatment effects
  vector[N] eta;
}
transformed parameters {
  vector[N] theta;
    theta = inv_logit(betamat*beta + stu[Study] + tau * eta);// use logit transform
}
model {
  percent ~ beta(theta .* phi, (1.0 - theta) .* phi);
  beta ~ normal(0, 5);//used 0,5
  eta ~ normal(0, 1);//used 0,1
  tau ~ normal(0, 1);//used 0,1
  stu ~ normal(0, sigma_stu);
  sigma_stu ~ normal(0, 5); //used uniform(0, 5)
}
generated quantities { 
     real log_lik[N]; 
     real y_rep[N];
     for (i in 1:N) { 
         log_lik[i] = beta_lpdf(percent[i] | theta[i] .* phi[i], (1.0 - theta[i]) .* phi[i]); 
     } 
     y_rep = beta_rng(theta .* phi,(1.0 - theta) .* phi);
}
// Rstan meta-analysis
// after https://mc-stan.org/docs/stan-users-guide/meta-analysis.html 
//  https://rpubs.com/kaz_yos/stan_beta1
// using beta regression https://m-clark.github.io/models-by-example/bayesian-beta-regression.html https://www.andrewheiss.com/blog/2021/11/08/beta-regression-guide/ 
