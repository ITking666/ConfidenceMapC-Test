function SparseL = SparseMatrixLoading()
% This function is for sparse matrix loading
addpath(genpath('..\Data'));

L1 = csvread('L1_T10.csv');
L2 = csvread('L2_T10.csv');

ArrayL = [L1;L2];
Rows = max(ArrayL(:,1))+1;
Cols = max(ArrayL(:,2))+1;
SparseL = sparse(Rows,Cols);

RowIndx = ArrayL(:,1)+1;
ColIndx = ArrayL(:,2)+1;
Val = ArrayL(:,3);

SparseL = sparse(RowIndx,ColIndx,Val,Rows,Cols,length(Val)); 

end