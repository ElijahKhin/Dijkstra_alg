% ������� ���������� ����������� ������� � ���������� �� ���������� ����� � �������
function [defMin, i_ndex_WasThereTops] = defMin(step, i_ndex_WasThereTops, tops)
if step == 1 % ������� ������
    defMin = 1;
    i_ndex_WasThereTops(step) = 1;
else 
    usedTops = tops([i_ndex_WasThereTops]); % ������� ���������� �������
    indexMin = 0;
    
    for i = 1 : 6 % �������� ������������ ������� � ��������� min
        score = 0; 
        for j = 1: step - 1
            if tops(i) ~= usedTops(j) % ��������� ������ ������� � ����������� 
                score = score + 1;% ���� �� ���������, �������� ���� 
            elseif tops(i) == usedTops(j) 
                break
            end
            if score == step - 1% ��������� �������� ������ 
                indexMin = indexMin + 1;% (�.�. ����������� �� � ����� ���������� ��������)
                supportArray(indexMin) = tops(i);% ���������� � ��������� ������
            end
        end
    end
    
    defMin = min(supportArray); % � ��������� ������� ����������� ����������� �������
    for i = 1 : 6 % ��������� ������ ���������� ������� � ��������� ��� � �������
        if tops(i) == defMin
            i_ndex_WasThereTops(step) = i;% ������ ����������� ������� ������ ������ ����, ��� ������� ��������
        end
    end
end
 

            

