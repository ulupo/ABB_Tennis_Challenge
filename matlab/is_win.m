function output = is_win(prompt)
%Function that determines who is winning given the prompt

prompt = char(prompt);
error_chars = string({'n', 'w', 'd', 'x', 'g', 'e', '!', '#', '@'});

output = -1;

if prompt == '*'
    output = 1;
elseif contains(prompt, '*')
    output = 0;
elseif any(error_chars == prompt(1))
    output = 0;
elseif any(error_chars == prompt(end))
    output = 1;

end

