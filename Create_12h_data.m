%% Read data
hros = readtable("AZKZ0AI_hros.csv");
% prepare data
data=hros.Var1;
n = numel(data);
b=720;
% devide data into equal cells of 720 (12 hours)
c = mat2cell(data,diff([0:b:n-1,n]));
AZKZ0AI=zeros(size(c,1),720);
% loop to create matrix from previous cells
for i=1:1:size(c,1)
    AZKZ0AI(i,:)=c{i}';
end