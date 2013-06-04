basedir = '/Users/tomas789/Desktop/zadani1';

fid_cr = fopen([basedir '/cr.txt']);
fid_eu = fopen([basedir '/eu.txt']);

read_cr = fscanf(fid_cr, '%d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d', [23 inf]);
read_eu = fscanf(fid_eu, '%d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d', [23 inf]);

[cr_r cr_c]= size(read_cr);
cr_A = read_cr(1 : cr_r-1, 1 : cr_c)';
cr_b = read_cr(cr_r, 1 : cr_c)';

[eu_r eu_c]= size(read_eu);
eu_A = read_eu(1 : eu_r-1, 1 : eu_c)';
eu_b = read_eu(eu_r, 1 : eu_c)';

clear read_cr read_eu cr_r cr_c eu_r eu_c;

% i-ta promenna reprezentuje plochu osetou i-tou plodinou (v arech)

cena = [313; 238; 699; 296; 551; 636; 656; 565; 628; 653; 582; 583
	    527; 589; 201; 228; 343; 296; 546; 683; 470; 546];
	 
vynos = [660; 794; 1890; 557; 980; 1982; 1537; 1768; 1971; 1812; 980
	     1456; 900; 1809; 615; 720; 556; 627; 1933; 1639; 725; 749];
		 
f = -1 * ( vynos - cena );
		 
A_1 = [cr_A; eu_A; cena'; ones(1,22)];
b_1 = [cr_b; eu_b; 2500000 + 500000; 10000];
[x_1, fval_1] = linprog(f,A_1,b_1,[],[],zeros(22,1),[]);
clear A_1 b_1;

A_2 = [eu_A; cena'; ones(1,22)];
b_2 = [eu_b; 2500000; 10000];
[x_2, fval_2] = linprog(f,A_2,b_2,[],[],zeros(22,1),[]);
clear A_2 b_2;

A_3 = [cr_A; cena'; ones(1,22)];
b_3 = [cr_b; 2500000; 10000];
[x_3, fval_3] = linprog(f,A_3,b_3,[],[],zeros(22,1),[]);
clear A_3 b_3;

switch min([fval_1 fval_2 fval_3])
	case fval_1
		A = [cr_A; eu_A; cena'; ones(1,22)];
		b = [cr_b; eu_b; 2500000 + 500000; 10000];
		fval_t = fval_1;
	case fval_2
		A = [eu_A; cena'; ones(1,22)];
		b = [eu_b; 2500000; 10000];
		fval_t = fval_2;
	case fval_3
		A = [cr_A; cena'; ones(1,22)];
		b = [cr_b; 2500000; 10000];
		fval_t = fval_3;
end

f_new = zeros(22, 1);
f(4) = 1;
f(7) = 1;
f(11) = 1;
f(12) = 1;
f(16) = 1;
f(20) = 1;

[x, fval] = linprog(f_new,A,b,f,fval_t,zeros(22,1),[]);
