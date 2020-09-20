%Алгоритм Дейкстры. Задача: Найти кратчайшие пути от первой 
%вершины графа до всех остальных

clc; 
clear all;
tic 


% Матрица стоимости ребер 
edges = [ inf 2 inf inf 3 inf;
          inf inf 3 inf 2 inf;
         inf inf inf inf 10 2;
          1 inf inf inf inf 2;
          inf inf inf 1 inf 7;
     inf 5 inf inf inf inf; ];

% Матрица стоимости вершин 
tops = [0 inf inf inf inf inf];
i_ndex_WasThereTops = [0];

for step = 1: 6
    % функция определяет минимальную вершину и записывает ее порядковый номер в матрицу
    [defMin,  i_ndex_WasThereTops] = defMin(step, i_ndex_WasThereTops, tops);
    % сортирует дуги в порядке возростания 
    whereToGo = sortArray(edges(i_ndex_WasThereTops(end), :));
    oldIndexes = zeros(1, 6);
    
    % опрделяю старые идексы вершин в отсортированной матрице...
    % Они нужны для опреления порядкового номера     
    for i = 1:6 
        if whereToGo(1,i) < inf % отбрасываю неподходящие дуги
            for j = 1:6 % восстанавливаю индексы 
                if whereToGo(1,i) == edges(i_ndex_WasThereTops(end), j)
                    oldIndexes(1,i) = j;  
                end
            end
        end
    end
    % иду по дугам и меняю значения вершин 
    for i = 1 : 6
        if whereToGo(1,i) < inf % отбрасываю неподходящие дуги
            if step == 1 % частный случай для первой итерации 
                defMin = 0;
            end    
            if defMin + whereToGo(1,i) < tops(1, oldIndexes(i))% вершина + дуга < значения вершин
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

