function result = get_user_input()
    printf('Welcome to Queue Simulator\n');
    car_num = cast(input('Enter no. of cars: '), 'uint64');
    seed_decision = getline('Do you want to set your own seed value? [Y/n] : ');
    seed_decision = lower(seed_decision);
    seed = 0;

    if (strcmp('y', seed_decision(1)))
        seed = uint64(input('Enter your seed value: '));
    elseif (strcmp('n', seed_decision(1)))
        % rand() returns the number in [0,1)
        seed = rand() * 2^64;
    else
        printf('Entered: %s\n', seed_decision);
        return;
    end

    result = {car_num, seed}
end
