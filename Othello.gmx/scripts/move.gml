#define move
posibal_moves = 0;
//turning the board of objects into an array of ints and finding starting information
for(i = 0; i < 8; i++){
    for(j = 0; j < 8; j++){
        start_board_2D_ar[j*8 + i] = curent_board_2D_ar[i,j].tile_color;
        if(start_board_2D_ar[j*8 + i] = 0){
            posibal_moves++;
        }
    }
}
//calling minn_max to find what board state we want to change to next
start_board_value = heuristic_scr(start_board_2D_ar);
move_made = min_max_scr(start_board_2D_ar, start_board_value, posibal_moves, 0, 1);
//changing the global array contaning the visobal objects to match the result of min_max
for(i = 0; i < 8; i++){
    for(j = 0; j < 8; j++){
        curent_board_2D_ar[i,j].tile_color = move_made[j*8 + i];
    }
}

#define min_max_scr
///min_max_scr(board_sim, heuristic, posibal_moves, ply, max)
if(ply == global.ply_depth or posibal_moves == 0){
    return argument1;
}
else{
    best_move = 0;
    board_move_3D_ar = board_sim_scr(argument0, argument2);
    for(m = 0; m < posibal_movies; m++){
        //seing if it is max or mins turn to choses 1 = max, -1 = min
        if(argument4 == 1){
            move_heuristic[m] = min_max_scr(board_move_3D_ar[m], heuristic_scr(board_move_3D_ar[m]), argument2 + 1, argument3 + 1, argument4*(-1));
            if(move_heuristic[m] >= move_heuristic[best_move]){
                best_move = m;
            }   
        }
        else{
            move_heuristic[m] = min_max_scr(board_move_3D_ar[m], heuristic_scr(board_move_3D_ar[m]), argument2 + 1, argument3 + 1, argument4*(-1));
            if(move_heuristic[m] <= move_heuristic[best_move]){
                best_move = m;
            }   
        }
    }
    if(argument3 == 0){
        return board_move_3D_ar[best_move];
    }
    else{
        return heuristic_scr(board_move_3D_ar[best_move]);
    }
}


#define heuristic_scr
///heuristic_scr(board_sim)
heuristic = 0
for (i = 0; i < 8; i += 1){
    for (j = 0; j < 8; j += 1){
        if (argument0[j*8 + i] == 2){
            heuristic += 1;
        }
        else if (argument0[j*8 + i] == 1){
            heuristic -= 1;
        }
    }
}
return heuristic;

#define board_sim_scr
///board_sim_scr(start_board, posibal_movies)
move_number = 0;
new_board_move_3D_ar[0] = argument0;
if(move_number < argument1){
    for(i = 0; i < 8; i++){
        for(j = 0; j < 8; j++){
            if(argument0[j*8 + i] == 0){
                new_board_move_3D_ar[move_number] = argument0;
                new_board_move_3D_ar[move_number,j*8 + i] = 2;
                new_board_move_3D_ar[move_number] = check_flips_scr(new_board_move_3D_ar[move_number], i, j);
                move_number++;
            }
        }
    }
}
return new_board_move_3D_ar;

#define check_flips_scr
///check_flips_scr(board_to_check, changed_peace_x, changed_peace_y)
i = argument1;
j = argument2;
fliped_board_2D_ar[0,0] = 0
//convertinng 1d array into 2d array
for(i = 0; i < 8; i++){
    for(j = 0; j < 8; j++){
        fliped_board_2D_ar[i,j] = argument0[j*8 + i]
    }
}
//cheking NW diagonal
while(i > 0 and j > 0){
    i--;
    j--;
    if(argument0[i,j] == 2 and i+j+2 != argument1+argument2){
        //steping back thrue fliping the tiles
        while(i < argument1 and j < argument2){
            i++;
            j++;
            fliped_board_2D_ar[i,j] = 2;
        }
        break;
    }
    else if(argument0[i,j] == 0 or (argument0[i,j] == 2 and i+j+2 == argument1+argument2)){
        break;
    }
}
i = argument1;
j = argument2;
//cheking the N vertical
while(j > 0){
    j--;
    if(argument0[i,j] == 2 and j+1 != argument2){
        //steping back thrue fliping the tiles
        while(j < argument2){
            j++;
            fliped_board_2D_ar[i,j] = 2;
        }
        break;
    }
    else if(argument0[i,j] == 0 or (argument0[i,j] == 2 and j+1 == argument2)){
        break;
    }
}
i = argument1;
j = argument2;
//cheking NE diagonal
while(i < 7 and j > 0){
    i++;
    j--;
    if(argument0[i,j] == 2 and i+j != argument1+argument2){
        //steping back thrue fliping the tiles
        while(i > argument1 and j < argument2){
            i--;
            j++;
            fliped_board_2D_ar[i,j] = 2;
        }
        break;
    }
    else if(argument0[i,j] == 0 or (argument0[i,j] == 2 and i+j == argument1+argument2)){
        break;
    }
}
i = argument1;
j = argument2;
//cheking the E horazontal
while(i < 7){
    i++;
    if(argument0[i,j] == 2 and i-1 != argument1){
        //steping back thrue fliping the tiles
        while(i > argument1){
            i--;
            fliped_board_2D_ar[i,j] = 2;
        }
        break;
    }
    else if(argument0[i,j] == 0 or (argument0[i,j] == 2 and i-1 == argument1)){
        break;
    }
}
i = argument1;
j = argument2;
//cheking SE diagonal
while(i < 7 and j < 7){
    i++;
    j++;
    if(argument0[i,j] == 2 and i+j-2 != argument1+argument2){
        //steping back thrue fliping the tiles
        while(i > argument1 and j > argument2){
            i--;
            j--;
            fliped_board_2D_ar[i,j] = 2;
        }
        break;
    }
    else if(argument0[i,j] == 0 or (argument0[i,j] == 2 and i+j-2 == argument1+argument2)){
        break;
    }
}
i = argument1;
j = argument2;
//cheking the S vertical
while(j < 7){
    j++;
    if(argument0[i,j] == 2 and j-1 != argument2){
        //steping back thrue fliping the tiles
        while(j > argument2){
            j--;
            fliped_board_2D_ar[i,j] = 2;
        }
        break;
    }
    else if(argument0[i,j] == 0 or (argument0[i,j] == 2 and j-1 == argument2)){
        break;
    }
}
//cheking SW diagonal
while(i > 0 and j < 7){
    i--;
    j++;
    if(argument0[i,j] == 2 and i+j != argument1+argument2){
        //steping back thrue fliping the tiles
        while(i < argument1 and j > argument2){
            i++;
            j--;
            fliped_board_2D_ar[i,j] = 2;
        }
        break;
    }
    else if(argument0[i,j] == 0 or (argument0[i,j] == 2 and i+j == argument1+argument2)){
        break;
    }
}
i = argument1;
j = argument2;
//cheking the W horazontal
while(i > 0){
    i--;
    if(argument0[i,j] == 2 and i+1 != argument1){
        //steping back thrue fliping the tiles
        while(i < argument1){
            i++;
            fliped_board_2D_ar[i,j] = 2;
        }
        break;
    }
    else if(argument0[i,j] == 0 or (argument0[i,j] == 2 and i+1 == argument1)){
        break;
    }
}
//convertinng 2d array into 1d array
fliped_board_ar[0,0] = 0;
for(i = 0; i < 8; i++){
    for(j = 0; j < 8; j++){
        fliped_board_ar[j*8 + i] = fliped_board_2D_ar[i,j]
    }
}
return fliped_board_ar;