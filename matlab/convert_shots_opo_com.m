function [shots_opo_com, serves_opponent] = convert_shots_opo_com(input_shots_opo_com, input_serves_opponent)
% Function to convert shots_opo_com in the appropriate format

s = size(input_shots_opo_com);
rows = s(1);
cols = s(2);

l = length(input_serves_opponent);

shots_opo_com = cell(rows, cols);
serves_opponent = cell(l);

for i = 1:rows
    for j = 1:cols
        shots_opo_com{i,j} = strrep(join(string(input_shots_opo_com(i,j,:))), ' ', '');
    end
end

for i = 1:l
    serves_opponent{i} = strrep(input_serves_opponent(i), ' ', '');
end


end

