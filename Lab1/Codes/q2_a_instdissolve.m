y0= ; 

k2= ; 

total_time=500 ;
dt=1e-2 ;
N= total_time/dt;

drug_conc= zeros(N,1);

i= 1:0.01:100;
plot (yo*exp(-k2*i));

