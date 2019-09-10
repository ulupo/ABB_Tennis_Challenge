function model_matrix = convert_model(input_mat)
%Function to convert the model matrix into the appropriate format

s = size(input_mat);
rows = s(1);
cols = s(2);

for i = 1:rows
    for j = 1:cols
        input_mat{i,j} = string(input_mat{i,j});
    end
end

    
model_matrix = input_mat;

end

