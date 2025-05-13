/// @func BFSRegion(grid)
/// @arg grid — ds_grid 에 0,1,3 값이 들어있다고 가정
/// @ret map — { success:bool, coords:ds_list of [x,y] }
function BFSRegion(grid) {
    var W = ds_grid_width(grid),
        H = ds_grid_height(grid);

    // 1) 시작점(값==3) 찾기
    var startX = -1, startY = -1;
    for (var yy = 0; yy < H; yy++) {
        for (var xx = 0; xx < W; xx++) {
            if (ds_grid_get(grid, xx, yy) == 3) {
                startX = xx; startY = yy;
                break;
            }
        }
        if (startX >= 0) break;
    }
    // 시작점이 없으면 실패 리턴
    if (startX < 0) {
        var err0 = ds_map_create();
        ds_map_add(err0, "success", false);
        ds_map_add(err0, "coords", ds_list_create());
        return err0;
    }

    // 2) 방문 체크 그리드
    var visited = ds_grid_create(W, H);
    ds_grid_clear(visited, 0);

    // 3) 큐와 결과 리스트
    var queue  = ds_queue_create();
    var coords = ds_list_create();
    var success = true;

    ds_queue_enqueue(queue, [startX, startY]);
    ds_grid_set(visited, startX, startY, 1);

    // 4) 4방향 BFS
    var dirs = [[1,0],[-1,0],[0,1],[0,-1]];
    while (!ds_queue_empty(queue)) {
        var cell = ds_queue_dequeue(queue);
        var cx = cell[0], cy = cell[1];
        ds_list_add(coords, [cx, cy]);

        // 외곽 닿으면 실패
        if (cx == 0 || cy == 0 || cx == W-1 || cy == H-1) {
            success = false;
        }

        // 이웃 탐색
        for (var i = 0; i < 4; i++) {
            var nx = cx + dirs[i][0],
                ny = cy + dirs[i][1];
            if (nx < 0 || ny < 0 || nx >= W || ny >= H) continue;
            if (ds_grid_get(visited, nx, ny) == 1) continue; // 이미 방문
            if (ds_grid_get(grid,   nx, ny)    == 1) continue; // 벽
            ds_grid_set(visited, nx, ny, 1);
            ds_queue_enqueue(queue, [nx, ny]);
        }
    }

    // 5) 정리
    ds_grid_destroy(visited);
    ds_queue_destroy(queue);

    // 6) 결과 맵 리턴
    var result = ds_map_create();
    ds_map_add(result, "success", success);
    ds_map_add(result, "coords", coords);
    return result;
}