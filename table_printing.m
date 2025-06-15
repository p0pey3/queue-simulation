function table_print()

    IAT = [1,2,3,4];  //random rn cus i js wanna see if it works
    IATProbability = [15,20,40,25]; // '' 
    IATcdf = [0.15, 0.35, 0.75, 1.00];
    IATrange = ['1-15', '16-35', '36-75', '76-100']; 

    printf('            Probability table: Inter-Arrival Time\n'); 
    printf('+-------------------------------------------------------------+ \n');
    printf('| Inter-Arrival Time | Probability (%) | CDF | Rand Num Range | \n');
    printf('+-------------------------------------------------------------+ \n');

    for i = 1:numel(IAT)
        printf('    | %d   | %d    | %.2f    | %s   \n');
    end

    printf('+-------------------------------------------------------------+ \n');

