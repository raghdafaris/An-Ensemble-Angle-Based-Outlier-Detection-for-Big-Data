clc
clear
close all

% Run for 10 times
%read the data (dim , lenghth ,defined the number of buckets)
load 60Dim-Global-outliers

% diminsion reduction LSH
X=allData(:,1:end-1);
y=allData(:,end);
num_pack=20;
dim=size(X,2);
len_data=size(X,1);

%generating vectors.
vectors=round(2*rand(num_pack,dim)-1);

%finding a value 
a=max(X(:))/num_pack;

%finding the bucket number 
for i=1:len_data
    D=X(i,:);
    for j=1:20
        out(i,j)=floor((D*vectors(j,:)')/(norm(vectors(j,:))*a));
    end
end
