%�������� ��������. ������: ����� ���������� ���� �� ������ 
%������� ����� �� ���� ���������

clc; 
clear all;
tic 


% ������� ��������� ����� 
edges = [ inf 2 inf inf 3 inf;
          inf inf 3 inf 2 inf;
         inf inf inf inf 10 2;
          1 inf inf inf inf 2;
          inf inf inf 1 inf 7;
     inf 5 inf inf inf inf; ];

% ������� ��������� ������ 
tops = [0 inf inf inf inf inf];
i_ndex_WasThereTops = [0];

for step = 1: 6
    % ������� ���������� ����������� ������� � ���������� �� ���������� ����� � �������
    [defMin,  i_ndex_WasThereTops] = defMin(step, i_ndex_WasThereTops, tops);
    % ��������� ���� � ������� ����������� 
    whereToGo = sortArray(edges(i_ndex_WasThereTops(end), :));
    oldIndexes = zeros(1, 6);
    
    % �������� ������ ������ ������ � ��������������� �������...
    % ��� ����� ��� ��������� ����������� ������     
    for i = 1:6 
        if whereToGo(1,i) < inf % ���������� ������������ ����
            for j = 1:6 % �������������� ������� 
                if whereToGo(1,i) == edges(i_ndex_WasThereTops(end), j)
                    oldIndexes(1,i) = j;  
                end
            end
        end
    end
    % ��� �� ����� � ����� �������� ������ 
    for i = 1 : 6
        if whereToGo(1,i) < inf % ���������� ������������ ����
            if step == 1 % ������� ������ ��� ������ �������� 
                defMin = 0;
            end    
            if defMin + whereToGo(1,i) < tops(1, oldIndexes(i))% ������� + ���� < �������� ������
                tops(1, oldIndexes(i)) = defMin + whereToGo(1,i);
            end
        end
    end
    clear defMin 
end

disp(tops)
toc
choice = input('Which top would you like to reach?'); 
answer = num2str(tops(choice));
answer = ['The shortest path costs:' ' ' answer];
disp(answer)  

