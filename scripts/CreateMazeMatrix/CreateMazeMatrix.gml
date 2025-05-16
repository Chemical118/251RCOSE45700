/// @description rmg_recursive_backtracking(width, height, border, north entrance, south entrance, east entrance, west entrance)
/// @function rmg_recursive_backtracking
/// @param  width
/// @param  height

function CreateMazeMatrix(width, height) {
	// This Random Maze Generator (RMG) uses a DS Grid to generate the maze. Each cell of the grid will represent either 
	// a Floor cell or a Wall cell. This means that after a row/column of Floor cells there will be one of Wall cells,
	// mantaining the spacing between each Floor/Wall cell the same throughout the maze.

	// The Recursive Backtracking algorithm starts by moving in a random direction that has not been previously visited 
	// and it marks the path as VISITED. When it reaches a position where all surrounding cells have been visited,
	// he sets that path as a DEAD END, to prevent the algorithm from returning to that position, and it starts to 
	// backtrack, until it finds a new cell that has as a neighbor a NOT VISITED cell. This pattern is repeated until
	// it backtracks all the way to the starting position.

	// Set the script arguments
	var border = 1;
	
	// The reason why the grid size is increased is to prevent the code from going outside the grid and slowing down 
	// the program, so it leaves a border of 2 cells around the maze unused.
	// If the maze has a border, it means there already is a border around the maze, so it is only increased by half.
	if (border == 1) {
	    var b_width = width+2;
	    var b_height = height+2;
	} else if (border == 0) {
	    var b_width = width+4;
	    var b_height = height+4;
	}

	// Create the grid based on the variables determined above
	var grid = ds_grid_create(b_width, b_height);

	// Create the maze area in the center of the grid, leaving a border of 2 cells unused
	ds_grid_set_region(grid, 2, 2, b_width-3, b_height-3, NOT_VISITED);

	// Randomize the maze. If this function is not called GM will always use the same random variable.
	randomize();

	// Create the controller in the corner of the maze. 
	// The controler will be responsible for creating the maze path.
	// It is simply a location that will be updated by the algorithm.
	var cx = b_width-3;
	var cy = b_height-3;

	// Store the controller start position for later use
	var c_start = grid[# cx, cy];

	// Give the controller a random direction. This will initialize the variable that randomly chooses a direction.
	var cdir = choose(N_DIR, S_DIR, E_DIR, W_DIR);

	// Create the level in "n" steps. 
	// The code inside this repeat function is the algorithm itself. The larger the size of the maze, the more this will
	// have to be repeated. But, inside the repeat there is break statement that is activated when the maze is competed.
	// This way you can set a high number of repetitions, with no worries of running the code for no reason.
	repeat (10000) {
	    // Set the cell where the controller is currently at as VISITED
	    grid[# cx, cy] = VISITED;
    
	    //Randomize the direction of the controller
	    cdir = choose(N_DIR, S_DIR, E_DIR, W_DIR);
    
	    // Move the controller 2 cells in the chosen direction
	    // Here we use the variables "xdir" and "ydir" to indicate the direction in which the controller is going to move.
	    // We move 2 cells because we have to pass over the Wall cell and land in the next viable path.
	    if (cdir == N_DIR) { xdir = 0 ydir = -2; }
	    else if (cdir == S_DIR) { xdir = 0 ydir = 2; }
	    else if (cdir == E_DIR) { xdir = 2 ydir = 0; }
	    else if (cdir == W_DIR) { xdir = -2 ydir = 0; }
    
	    // Move the controller only if the cell was not yet visited
	    // We only increment the controller position if the cell where he is going to has not yet been visited
	    if (grid [# cx+xdir, cy+ydir] == NOT_VISITED) {
	        // We set the area where the controller passed through as VISITED, indicating it is a path
	        ds_grid_set_region(grid, cx, cy, cx+xdir, cy+ydir, VISITED);
	        cx += xdir;
	        cy += ydir;
    
	    // If the cell where the controller was moving to was already visited, he is then going to check if all 4 cells 
	    // surrounding him have been visited. If they have all been visited, he is going to set that path as a DEAD_END.
	    // This will prevent the controller from returning to that path and will make him backtrack.
	    // Now the loop will restart, randomly choosing a new direction and repeating the process.
	    } else if (grid[# cx, cy-2] != NOT_VISITED and grid[# cx, cy+2] != NOT_VISITED and grid[# cx+2, cy] != NOT_VISITED and grid[# cx-2, cy] != NOT_VISITED) {
	        if (grid [# cx+sign(xdir), cy+sign(ydir)] == VISITED) {
	            grid [# cx+sign(xdir), cy+sign(ydir)] = DEAD_END;
	            cx += xdir;
	            cy += ydir;
            
	            // End the algorithm if the controller returns to it's initial position
	            // If the controller returns to the position it started in, it means it has passed through all possible
	            // paths and has backtracked all the way.
	            if (grid[# cx, cy] == c_start) {
	                break;
	            }
	        }
	    }
	}

	// Add the Floor and Walls
	// Here we change the variables VISITED/DEAD_END and NOT_VISITED to FLOOR and WALL cells respectively.
	// It is not a necessery step, but makes it easier to undestand. It is also possible to use these values 
	// directly in the algorithm process.
	for (var yy = 2; yy < b_height-2; yy++) {
	    for (var xx = 2; xx < b_width-2; xx++) {
	        if (grid[# xx, yy] == VISITED or grid[# xx, yy] == DEAD_END) {
	            // Add the floor
	            grid[# xx, yy] = FLOOR;
	        } else if (grid[# xx, yy] == NOT_VISITED) {
	            // Add the walls
	            grid[# xx, yy] = WALL;
	        }
	    }
	}

	// Resize the DS Grid and add the border maze
	// In here we remove the extra area of the DS Grid added in the beginning, nad if there is a border we added it.
	// In the border area it is also added the entrances.
	// With Border
	// Transfer maze area to the center
	ds_grid_set_grid_region(grid, grid, 2, 2, b_width-3, b_height-3, 1, 1);
    
	// Resize the grid to the corect value
	ds_grid_resize(grid, width, height);
    
	// Add the borders
	ds_grid_set_region(grid, 0, 0, width-1, 0, WALL);
	ds_grid_set_region(grid, 0, height-1, width-1, height-1, WALL);
	ds_grid_set_region(grid, 0, 0, 0, height-1, WALL);
	ds_grid_set_region(grid, width-1, 0, width-1, height-1, WALL);
	
	for (var _x = 1; _x < width-1; _x++) {
        if (grid[# _x, 1] == FLOOR) {
            // 바로 위쪽(0행)에 통로를 뚫는다
            grid[# _x, 0] = FLOOR;
			global.mazestw = _x;
			global.mazesth = 0;
            break;
        }
    }
	
	for (var _x = width-2; _x > 0; _x--) {
        if (grid[# _x, height-2] == FLOOR) {
            // 바로 아래쪽(height-1행)에 통로를 뚫는다
            grid[# _x, height-1] = FLOOR;
			global.mazendw = _x;
			global.mazendh = height-1;
            break;
        }
    }
	
	global.mazew = global.mazestw;
	global.mazeh = global.mazesth;
	
    PrintMatrix(grid);
	global.maze_matrix = grid;
	
	var w = ds_grid_width(grid);
    var h = ds_grid_height(grid);
    global.maze_matrix_vis = ds_grid_create(w, h);
	global.maze_matrix_vis[# global.mazew, global.mazeh] = 1;
}
