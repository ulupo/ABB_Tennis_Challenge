clear all

%% Data Preparation

% Loading the model matrix
load('model_matrix.mat');
load('shots_opo_com.mat');
load('serves_opponent.mat');

% All shots, possible prompts and threshold
all_shots = string({'4', '4+', '5', '6', '6+', 'X', 'b', 'b1', 'b17', 'b18', 'b19', 'b2', 'b27', 'b28', 'b29', 'b3', 'b37', 'b38', 'f', 'f+1', 'f+3', 'f1', 'f18', 'f2', 'f27', 'f28', 'f29', 'f3', 'f37', 'f38', 'r2', 's', 's1', 's2', 's28', 's3', 'v1', 'v3', 'z1', 'z3'});
possible_prompts = string({'f3', 'f1', 'b2', 'b1', 'X', 'f2', 'b3', '4', '6', '5', '*', 'b28', 'f28', 'b27', 's2', 'f+3', 's3', 'n@', 'f+1', 'b18', 'd@', 'f38', 'b29', 's1', 'b38', 'f37', '#', 'w@', 'f27', 'f29', 'n#', 'd#', 'f', 'b', 's28', 'b37', 'b17', 'f1*', 'b19', 'b39', 'w#', 'r2', 'f18', 'f39', 'z3', 'v1', 'v3', 'f#', 's27', '4+', '6+', 'z1', 'b1*', 'f3*', 'm2', 'f17', 'r3', 's', 'r1', 's29', 's38', 'b+1', 'z2', 'o3', 'c6', 'v2', 'c4', 'b1w@', 'b#', 'b1n@', 'b+3', 'f19', 'b3*', 'f+2', 'f1w@', 'b3w@', 's37', 's39', 'f3n@', 'f3w@', 'm3', 'f1n@', 'b1d@', 'b2n#', 'f2d@', 'f1n#', 'b1w#', 's#', 'b1n#', 'x@', 'f1w#', 'y3', 'f2d#', 'b2d@', 'f2n#', 'f3d@', 'y1', 'b3w#', 'o1', 'f-3'});
threshold = 1;

% Converting the model matrix and shots_opo_com to the right format
model_matrix = convert_model(model_matrix);
[shots_opo_com, serves_opponent] = convert_shots_opo_com(shots_opo_com, serves_opponent);

% Executing the model for a sample prompt and shot
result = execute_model(model_matrix, possible_prompts, all_shots, threshold, '5', 'f28');


%% Example Policy

number_of_points_played = 10000;

keySet = string({"f3", "f1"});
valueSet = {string({'b2', 'b2', 'b3', 'v1'}), string({'f1'})};
example_policy = containers.Map(keySet,valueSet);

[points_won, points_lost] = test_model(example_policy, number_of_points_played, serves_opponent, model_matrix,possible_prompts,all_shots,threshold);
points_won
points_lost
performance = points_won/(points_won+points_lost)

