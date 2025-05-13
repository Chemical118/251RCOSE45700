function BFS_Grid(startX, startY, count) {
    var visited = ds_grid_create(W, H);
    ds_grid_clear(visited, false);
    var queue  = ds_queue_create();
    var result = ds_list_create();

    // 시작점
    visited[# startX, startY] = true;
    ds_queue_enqueue(queue, [startX, startY]);

    var dirs = [[1,0],[-1,0],[0,1],[0,-1]];
    while (!ds_queue_empty(queue) && ds_list_size(result) < count) {
        var cell = ds_queue_dequeue(queue);
        ds_list_add(result, cell);
        // 이웃
        for (var d = 0; d < 4; d++) {
            var nx = cell[0] + dirs[d][0];
            var ny = cell[1] + dirs[d][1];
            if (nx >= 0 && ny >= 0 && nx < W && ny < H
             && !visited[# nx, ny]) {
                visited[# nx, ny] = true;
                ds_queue_enqueue(queue, [nx, ny]);
            }
        }
    }

    ds_queue_destroy(queue);
    ds_grid_destroy(visited);
    return result;
}
