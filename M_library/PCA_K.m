function [PCm, eigen_val, Vm ] = PCA_K(Y)
% Y = T by k
% PCm = T by k

% 1 �ܰ�: ��������� ����ϱ�
CORM = corrcoef(Y);

% 2 �ܰ�: Ư����, Ư������ ����ϱ�
[V, D] = eig(CORM);

% V = Ư������, D�� �밢���� = Ư����
   
% 3 �ܰ�
eigen_val = diag(D); % 3 by 1
[eigen_val, index] = sort(eigen_val, 'descend'); % Ư���� �����ϱ�
Vm = V(:, index);% Ư������ �����ϱ�

% 4 �ܰ�: PC ����ϱ�
PCm = Y*Vm; % T by 3

disp(['Ư���� = ', num2str(eigen_val'/cols(Y))]);
end