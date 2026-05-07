%% Data loading
load CRIM.mat
Y = CRIM; % Assuming CRIM is a table or matrix loaded from the .mat file

%% Figure 3 left panel: Traditional non robust PCA 
out=pcaFS(Y,"smartEVchart",true);

%% Outlier detection 
close all
outFSM=FSM(Y{:,:},'bonflev',0.9999,'plots',0);

%% Figure 3 right panel: Robust PCA analysis 
robust=struct;
n=height(Y);
seq=1:n;
robust.bsb=setdiff(seq,outFSM.outliers);
outFS=pcaFS(Y,"robust",robust,"smartEVchart",true);
% In the biplot APP to reproduce exactly the right panel of Figure 3
% 1) select the chechbox conf.ell.
% 2) select omega=0.3 in the top slider bar

%% Figure 2: personalized scatter plot matrix with the 2 groups
close all
group=ones(n,1);
group(outFSM.outliers)=2;
typespm=struct;
typespm.upper='circle';
spmplot(Y,'group',group,'dispopt','box','typespm',typespm)




