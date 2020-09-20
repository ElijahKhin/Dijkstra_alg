% функция определяет минимальную вершину и записывает ее порядковый номер в матрицу
function [defMin, i_ndex_WasThereTops] = defMin(step, i_ndex_WasThereTops, tops)
if step == 1 % частный случай
    defMin = 1;
    i_ndex_WasThereTops(step) = 1;
else 
    usedTops = tops([i_ndex_WasThereTops]); % выделяю посещенный вершины
    indexMin = 0;
    
    for i = 1 : 6 % отсеиваю непосещенные вершины и определяю min
        score = 0; 
        for j = 1: step - 1
            if tops(i) ~= usedTops(j) % сравниваю каждый вершину с посещенными 
                score = score + 1;% если не совпадает, начисляю балл 
            elseif tops(i) == usedTops(j) 
                break
            end
            if score == step - 1% набравшие максимум баллов 
                indexMin = indexMin + 1;% (т.е. несовпавшие ни с одной выделенной вершиной)
                supportArray(indexMin) = tops(i);% отбираются в отдельный массив
            end
        end
    end
    
    defMin = min(supportArray); % в отдельном массиве опрделяется минимальная вершина
    for i = 1 : 6 % определяю индекс песещенной вершины и записываю его в матрицу
        if tops(i) == defMin
            i_ndex_WasThereTops(step) = i;% индекс минимальной матрицы служит меткой того, что вершина посещена
        end
    end
end
 

            

