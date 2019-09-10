function [output] = execute_model(model_matrix,possible_prompts,all_shots,threshold,prompt,shot)
%Function that executes the model. It returns as output the next prompt


n_grams_ps = model_matrix{find(possible_prompts == strrep(prompt, ' ', '')), find(all_shots == shot)};
if length(n_grams_ps) > threshold
    output = n_grams_ps(randi([1,length(n_grams_ps)]));
else
    output = 'n@';
end

output = strrep(char(output), ' ', '');

