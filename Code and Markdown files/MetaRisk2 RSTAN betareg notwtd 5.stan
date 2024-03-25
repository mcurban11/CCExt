data {
  int<lower=0> N; // total
  int<lower=0> S; // number of studies
  vector[N] percent;  // Percent extinction
  vector[N] Ind;  // Pre-industrial temp. rise
  int Study[N];  // Study random effect
}
parameters {
  vector[S] stu;    // Study random effect
  real<lower=0> sigma_stu; //Study intercepts 
  real mu;              // mean treatment effect
  real beta;            // pre-industrial effect
  real<lower=0> tau;    // deviation of treatment effects
  vector[N] eta;
  real<lower=0> phi;                   // dispersion parameter
}
transformed parameters {
  vector[N] theta;
  vector[N] mud;
    theta = mu + Ind*beta+ stu[Study] + tau * eta; //
    mud = inv_logit(theta); // use logit transform
}
model {
  percent ~ beta(mud * phi, (1.0 - mud) * phi);
  mu ~ normal(-25, 1);
  beta ~ normal(0,5);
  eta ~ normal(0, 1);
  tau ~ normal(0, 5);
  stu ~ normal(0, sigma_stu);
  sigma_stu ~ normal(0, 5);
  phi ~ normal(0,10);        // Prior for dispersion parameter
}
generated quantities { 
     real log_lik[N]; 
     real y_rep[N];
     for (i in 1:N) { 
         log_lik[i] = beta_lpdf(percent[i] | mud[i] * phi, (1.0 - mud[i]) * phi); 
     } 
     y_rep = beta_rng(mud * phi, (1.0 - mud) * phi);
}
