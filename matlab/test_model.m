function [points_won,points_lost] = test_model(policy, number_of_points_played, serves_opponent, model_matrix,possible_prompts,all_shots,threshold)
% Function that tests the policy function given as input.
   

points_won  = 0;
points_lost = 0;

for num = 1: number_of_points_played
   if rand() < 0.5
       current_prompt = 'X';
   else
       current_prompt = serves_opponent{randi([1,length(serves_opponent)])};
       current_prompt = strrep(current_prompt, ' ', '');
   end
   
   while 1
       if policy.isKey(current_prompt)
           possibilities = policy(current_prompt);
           shot = strrep(char(possibilities(randi([1,length(possibilities)]))), ' ', '');
       else
           shot = '5';
       end
       
       next_prompt = execute_model(model_matrix,possible_prompts,all_shots,threshold, current_prompt, shot);
       current_prompt = next_prompt;
       
       
       if is_win(current_prompt) == 1
           points_won  = points_won + 1;
           break
       end
       if is_win(current_prompt) == 0
           points_lost  = points_lost + 1;
           break
       end
   end
   
      
end


end

