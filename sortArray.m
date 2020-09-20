%Пузырьковая сортировка
function sortArray = sortArray(sortArray)
for j = 1: length(sortArray)
    for i = 1: length(sortArray)-1
        if sortArray(i) > sortArray(i+1)
            sortArray(i:i+1) = [sortArray(i+1) sortArray(i)];
        end
    end
end
end